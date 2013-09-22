import sys
from collections import deque
from random import random
from math import ceil


class Entity(object):
    number = 0
    def __init__(self, max_goods_desired, desire_dist, **kwargs):
        Entity.number += 1
        self.id = Entity.number
        self.goods_desired = ceil(max_goods_desired*desire_dist(**kwargs))
        self.curr_goods = 0
        self.exit = False


class Counter(object):
    number = 0
    def __init__(self, max_goods, goods_dist, **kwargs):
        Counter.number += 1
        self.id = Counter.number
        self.goods = ceil(max_goods*goods_dist(**kwargs))
        self.engaged = None
        self.empty = (self.goods==0)


class QueueSimulator(object):
    def __init__(self, Counter=Counter, Entity=Entity):
        # Global variables
        self.Counter = Counter
        self.Entity = Entity
        self.counters = []
        self.time = 0
        self.entry_queue = deque()
        self.exit_queue = deque()


    def initCounters(self,  no_counters=3, max_goods=5, goods_dist=(lambda : 1), **kwargs):
        for i in range(1, no_counters):
            counter = self.Counter(max_goods, goods_dist, **kwargs)
            self.counters.append(counter)
        print len(self.counters), "counters created at t =", self.time


    def exitQueue(self):
        # Is it a queue with a min wait time, or instantaneously leaving?
        # Do the people waiting in the entry queue also need to leave?
        for entity in self.exit_queue:
            # No need to check if curr_goods is non-zero because it will be.
            # If curr_goods was zero, it never got anything from the counters (they were all closed)
            # which means such an entity is one that has directly been sent to exit queue.
            # This is handled elsewhere.
            entity.curr_goods -= 1
            if not entity.curr_goods:
                entity.exit = True
                print entity.id, "exiting queue at t =", self.time

        self.exit_queue = deque([entity for entity in self.exit_queue if not entity.exit])
        if not self.exit_queue:
            print "Exit queue empty at t =", self.time


    def serveAtCounter(self):
        for counter in self.counters:
            if counter.engaged:
                #If an entity is at the counter, then he is definitely unsatisfied
                #Hence no need to check if curr==desired here
                if counter.goods:
                    counter.goods -= 1
                    counter.engaged.curr_goods += 1
                    if (counter.engaged.goods_desired == counter.engaged.curr_goods):
                        if not counter.goods:
                            counter.empty = True
                        self.exit_queue.append(counter.engaged)
                        print counter.engaged.id, " joining exit queue at t = ", self.time
                        counter.engaged = None

                else: #Just got empty in the previous iteration, entity still at counter
                    counter.empty = True
                    self.exit_queue.append(counter.engaged)
                    print counter.engaged.id, " joining exit queue at t = ", self.time
                    counter.engaged = None

        self.counters = [counter for counter in self.counters if not counter.empty]
        if not self.counters:
            print "Counters empty at t = ", self.time


    def moveToCounter(self):
        for counter in self.counters:
            if not counter.engaged:
                if self.entry_queue:
                    counter.engaged = self.entry_queue.popleft()
                    print counter.engaged.id, " going to counter ", counter.id, " at t = ", self.time
                else:
                    break


    def initQueue(self, max_goods_desired=4, desire_dist=(lambda : 1), **kwargs):
        #Find out what sir said
        total = sum([counter.goods for counter in self.counters])
        while total:
            entity = self.Entity(max_goods_desired, desire_dist, **kwargs)
            self.entry_queue.append(entity)
            total -= 1
            print entity.id, " Joining queue at t = ", self.time


    def viewpoint():
        pass


    def startSimulation(self, argv):
        # Going in reverse to prevent same entity from moving
        # forward multiple steps in one time instance
        while self.counters:
            self.exitQueue()
            self.serveAtCounter()
            if self.counters:
                self.moveToCounter()
            else:
                print "Emptying entry queue into exit queue at t = ", self.time
                while self.entry_queue:
                    entity = self.entry_queue.popleft()
                    self.exit_queue.append(entity)
                    print entity.id, " joining exit queue at t = ", self.time
                    entity.exit = True
                    print entity.id, "exiting queue at t =", self.time
                self.exit_queue = deque([entity for entity in self.exit_queue if not entity.exit])
            self.time += 1

        print "Waiting for exit queue to empty"
        while self.exit_queue:
            self.exitQueue()
            self.time += 1


if __name__ == "__main__":
    queue_simulator = QueueSimulator()
    queue_simulator.initCounters()
    queue_simulator.initQueue()
    queue_simulator.startSimulation(sys.argv)
