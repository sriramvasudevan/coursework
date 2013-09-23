from collections import deque
from entity import *
from counter import *
from display import *


def constDist(**kwargs):
    return 1


class QueueSimulator(object):
    def __init__(self, Counter=Counter, Entity=Entity, view=['all',]):
        # Global variables
        self.Counter = Counter
        self.Entity = Entity
        self.counters = []
        self.time = 0
        self.entry_queue = deque()
        self.exit_queue = deque()
        self.display = self.chooseView(view)

    def initCounters(self,  no_counters=3, max_goods=15, goods_dist=constDist, **kwargs):
        for i in range(1, no_counters):
            counter = self.Counter(max_goods, goods_dist, **kwargs)
            self.counters.append(counter)
            self.display.appendLog(["counter"], counter.id, "t = "+str(self.time)+"\tid = "+str(counter.id)+"\tcounter created.")
        self.display.appendLog(["counters", "status"], None, "t = "+str(self.time)+"\t"+str(len(self.counters))+" counters created.")

    def exitQueue(self):
        if self.exit_queue:
            # No need to check if curr_goods is non-zero because it will be, by construction.
            self.printExitWait()
            self.exit_queue[0].curr_goods -= 1
            if not self.exit_queue[0].curr_goods:
                entity = self.exit_queue.popleft()
                self.display.appendLog(["entity", "exit"], entity.id, "t = "+str(self.time)+"\tid = "+str(entity.id)+"\tLeaving exit queue.")
                if self.exit_queue:
                    entity = self.exit_queue[0]
                    self.display.appendLog(["entity", "exit"], entity.id, "t = "+str(self.time)+"\tid = "+str(entity.id)+"\tAt head of exit queue. To wait for "+str(entity.curr_goods)+" units of time.")
                else:
                    self.display.appendLog(["exit"], None, "t = "+str(self.time)+"\tExit queue emptied.")

    def serveAtCounter(self):
        for counter in self.counters:
            if counter.engaged:
                self.display.appendLog(["entity"], counter.engaged.id, "t = "+str(self.time)+"\tid = "+str(counter.engaged.id)+"\tRequesting 1 unit of goods at "+str(counter.id))
                #If an entity is at the counter, then he is definitely unsatisfied
                #Hence no need to check if curr==desired here
                if counter.goods:
                    counter.goods -= 1
                    self.display.appendLog(["counter"], counter.id, "t = "+str(self.time)+"\tid = "+str(counter.id)+"\tServicing entity "+str(counter.engaged.id)+". Goods remaining = "+str(counter.goods))
                    counter.engaged.curr_goods += 1
                    self.display.appendLog(["entity"], counter.engaged.id, "t = "+str(self.time)+"\tid = "+str(counter.engaged.id)+"\tReceived 1 unit of goods from "+str(counter.id)+". Need "+str(int(counter.engaged.goods_desired-counter.engaged.curr_goods))+" more.")
                    if (counter.engaged.goods_desired == counter.engaged.curr_goods):
                        if not counter.goods:
                            self.display.appendLog(["entity"], counter.engaged.id, "t = "+str(self.time)+"\tid = "+str(counter.engaged.id)+"\tNo more goods avaiable at "+str(counter.id)+". Need "+str(int(counter.engaged.goods_desired-counter.engaged.curr_goods))+" more.")
                            counter.empty = True
                            self.display.appendLog(["counter"], counter.id, "t = "+str(self.time)+"\tid = "+str(counter.id)+"\tCounter empty, shutting down.")
                        self.display.appendLog(["entity", "exit"], counter.engaged.id, "t = "+str(self.time)+"\tid = "+str(counter.engaged.id)+"\tJoining exit queue.")
                        if not self.exit_queue:
                            self.display.appendLog(["entity", "exit"], counter.engaged.id, "t = "+str(self.time)+"\tid = "+str(counter.engaged.id)+"\tAt head of exit queue. To wait for "+str(counter.engaged.curr_goods)+" units of time.")
                        self.exit_queue.append(counter.engaged)
                        counter.engaged.at = None
                        counter.engaged = None

                else: #Just got empty in the previous iteration, entity still at counter
                    counter.empty = True
                    self.display.appendLog(["counter"], counter.id, "t = "+str(self.time)+"\tid = "+str(counter.id)+"\tCounter empty, shutting down.")
                    self.display.appendLog(["entity", "exit"], counter.engaged.id, "t = "+str(self.time)+"\tid = "+str(counter.engaged.id)+"\tJoining exit queue.")
                    if not self.exit_queue:
                        self.display.appendLog(["entity", "exit"], counter.engaged.id, "t = "+str(self.time)+"\tid = "+str(counter.engaged.id)+"\tAt head of exit queue. To wait for "+str(counter.engaged.curr_goods)+" units of time.")
                    self.exit_queue.append(counter.engaged)
                    counter.engaged.at = None
                    counter.engaged = None

        self.counters = [counter for counter in self.counters if not counter.empty]
        if not self.counters:
            self.display.appendLog(["counters"], None, "t = "+str(self.time)+"\tCounters empty.")

    def moveToCounter(self):
        self.printEntryWait()
        for counter in self.counters:
            if not counter.engaged:
                if self.entry_queue:
                    counter.engaged = self.entry_queue.popleft()
                    counter.engaged.at = counter
                    self.display.appendLog(["entity", "entry"], counter.engaged.id, "t = "+str(self.time)+"\tid = "+str(counter.engaged.id)+"\tAt the head of entry queue. Going to Counter "+str(counter.id))
                else:
                    break

    def initQueue(self, max_goods_desired=4, desire_dist=constDist, **kwargs):
        total = sum([counter.goods for counter in self.counters])
        while total:
            entity = self.Entity(max_goods_desired, desire_dist, **kwargs)
            self.entry_queue.append(entity)
            total -= 1
            self.display.appendLog(["entity", "entry"], entity.id, "t = "+str(self.time)+"\tid = "+str(entity.id)+"\tJoining queue.")

        self.display.appendLog(["entities", "status"], None, "t = "+str(self.time)+"\t"+str(len(self.entry_queue))+" Entities created.")

    def chooseView(self, view):
        if 'all' in view:
            return Display()
        if 'counters' in view:
            return DisplayCounters()
        if 'entities' in view:
            return DisplayEntities()
        if 'entry' in view:
            return DisplayEntry()
        if 'exit' in view:
            return DisplayExit()
        if 'status' in view:
            return DisplayStatus()
        if 'counter' in view:
            return DisplayCounter([int(x) for x in view[1:]])
        if 'entity' in view:
            return DisplayEntity([int(x) for x in view[1:]])

    def updateEntryWait(self):
        for entity in self.entry_queue:
            entity.entry_wait += 1

    def updateExitWait(self):
        for entity in self.exit_queue:
            entity.exit_wait += 1

    def printEntryWait(self):
        for entity in self.entry_queue:
            self.display.appendLog(["entity", "entry"], entity.id, "t = "+str(self.time)+"\tid = "+str(entity.id)+"\tWaiting time in entry queue = "+str(entity.entry_wait))

    def printExitWait(self):
        for entity in self.exit_queue:
            self.display.appendLog(["entity", "exit"], entity.id, "t = "+str(self.time)+"\tid = "+str(entity.id)+"\tWaiting time in exit queue = "+str(entity.exit_wait))

    def updateStatus(self):
        status = "Status at t = "+str(self.time)+":\n"
        status += "In Entry Queue:\n"
        for entity in self.entry_queue:
            status += "Entity "+str(entity.id)+"\n"
        for counter in self.counters:
            status += "\nAt Counters:\n"
            if counter.engaged:
                status += "Counter "+str(counter.id)+": Entity "+str(counter.engaged.id)+"\n"
        status += "\nIn Exit Queue:\n"
        for entity in self.exit_queue:
            status += "Entity "+str(entity.id)+"\n"

        self.display.appendLog(["status"], None, status)

    def startSimulation(self):
        # Going in reverse to prevent same entity from moving
        # forward multiple steps in one time instance
        while self.counters:
            self.updateStatus()
            self.exitQueue()
            self.serveAtCounter()
            if self.counters:
                self.moveToCounter()
            self.time += 1
            self.updateEntryWait()
            self.updateExitWait()

        self.time -= 1
        self.updateStatus()
        self.display.printLog()
        print "Simulation halted at t =", self.time
        print "Emptying exit queue..."
        while self.exit_queue:
            entity = self.exit_queue.popleft()
            print entity.id, "exiting queue at t =", self.time
        print "Exit queue emptied."

