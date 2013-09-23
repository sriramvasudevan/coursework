from collections import deque
from entity import *
from counter import *


def constDist(**kwargs):
    return 1


class QueueSimulator(object):
    def __init__(self, Counter=Counter, Entity=Entity, views):
        # Global variables
        self.Counter = Counter
        self.Entity = Entity
        self.counters = []
        self.time = 0
        self.entry_queue = deque()
        self.exit_queue = deque()

    def initCounters(self,  no_counters=3, max_goods=15, goods_dist=constDist, **kwargs):
        for i in range(1, no_counters):
            counter = self.Counter(max_goods, goods_dist, **kwargs)
            self.counters.append(counter)
        print len(self.counters), "counters created at t =", self.time

    def exitQueue(self):
        # Is it a queue with a min wait time, or instantaneously leaving?
        if self.exit_queue:
            # No need to check if curr_goods is non-zero because it will be, by construction.
            self.exit_queue[0].curr_goods -= 1
            if not self.exit_queue[0].curr_goods:
                entity = self.exit_queue.popleft()
                print entity.id, "leaving exit queue at t =", self.time
                if self.exit_queue:
                    entity = self.exit_queue[0]
                    print entity.id, "at the head of the exit queue at t =", self.time
                else:
                    print "Exit queue emptied at t =", self.time

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
                        print counter.engaged.id, "joining exit queue at t =", self.time
                        if not self.exit_queue:
                            print counter.engaged.id, "at the head of the exit queue at t =", self.time
                        self.exit_queue.append(counter.engaged)
                        counter.engaged = None

                else: #Just got empty in the previous iteration, entity still at counter
                    counter.empty = True
                    print counter.engaged.id, "joining exit queue at t =", self.time
                    if not self.exit_queue:
                        print counter.engaged.id, "at the head of the exit queue at t =", self.time
                    self.exit_queue.append(counter.engaged)
                    counter.engaged = None

        self.counters = [counter for counter in self.counters if not counter.empty]
        if not self.counters:
            print "Counters empty at t =", self.time

    def moveToCounter(self):
        for counter in self.counters:
            if not counter.engaged:
                if self.entry_queue:
                    counter.engaged = self.entry_queue.popleft()
                    print counter.engaged.id, "going to counter", counter.id, "at t =", self.time
                else:
                    break

    def initQueue(self, max_goods_desired=4, desire_dist=constDist, **kwargs):
        total = sum([counter.goods for counter in self.counters])
        while total:
            entity = self.Entity(max_goods_desired, desire_dist, **kwargs)
            self.entry_queue.append(entity)
            total -= 1
            print entity.id, "joining queue at t =", self.time

    def viewpoint():
        pass

    def startSimulation(self):
        # Going in reverse to prevent same entity from moving
        # forward multiple steps in one time instance
        while self.counters:
            self.exitQueue()
            self.serveAtCounter()
            if self.counters:
                self.moveToCounter()
            self.time += 1

        self.time -= 1
        print "Simulation halted at t =", self.time
        print "Emptying exit queue..."
        while self.exit_queue:
            entity = self.exit_queue.popleft()
            print entity.id, "exiting queue at t =", self.time
        print "Exit queue emptied."

