from collections import deque
from entity import *
from counter import *
from display import *


def constDist(**kwargs):
    '''
    Function to pass a constant distribution to the simulator.
    The default distribution function used.
    Ensures that all entities (and counters) have the desired (and stock) goods
    equal to exactly the max amount passed during initialisation.

    Parameters:
    **kwargs = keyword arguments. Passed to this function to keep it generic, adhering to the format
               used in the constructors and methods.
    '''
    return 1


class QueueSimulator(object):
    '''
    The Queue Simulator class. Inherit to override specific methods.
    Certain methods are customisable without the necessity to inherit, to give a no-frills simulator.
    '''
    def __init__(self, Counter=Counter, Entity=Entity, view=['all',]):
        '''
        Parameters:
        Counter = Counter class to be used. Must be a child class of Counter in counter.py (default = Counter)
        Entity =  Entity class to be used. Must be a child class of Entity in entity.py (default = Entity)
        view = PoV to observe during the simulation
        '''
        # set the local counter and entity class to the passed ones
        self.Counter = Counter
        self.Entity = Entity

        # Maintain list of counters
        self.counters = []
        self.time = 0

        # queue object to manage the entry and exit queues
        self.entry_queue = deque()
        self.exit_queue = deque()
        # choose the relvant PoV. Default is 'all'
        self.display = self.chooseView(view)


    def initCounters(self, no_counters=3, max_goods=15, goods_dist=constDist, **kwargs):
        '''
        Initialise no_counters with goods according to a passed probability distribution.
        Also accept keyworc arguments to pass to the Counter constructor, to enable custom fields
        in inherited Counter classes without the need to override this method.

        Parameters:
        no_counters = no. of counters (default = 3)
        max_goods = max no. of goods a counter can have (default = 15)
        goods_dist = Probability distribution to generate goods stock (default = constDist)
        **kwargs = misc keyword arguments for the distribution function passed.
        '''
        for i in range(1, no_counters+1):
            counter = self.Counter(max_goods, goods_dist, **kwargs)
            self.counters.append(counter)
            self.display.appendLog(["counter"], counter.id, "t = "+str(self.time)+"\tid = "+str(counter.id)+"\tcounter created.")
        self.display.appendLog(["counters", "status"], None, "t = "+str(self.time)+"\t"+str(len(self.counters))+" counters created.")


    def exitQueue(self):
        '''
        Manages the exit queue. Checks if entities are present, updates the waiting time for all of them.
        Also checks if it is okay for the entity at the head to leave the queue once the constraints are met.
        Appends relevant output to the logs.
        '''
        if self.exit_queue:
            # No need to check if curr_goods is non-zero because it will be, by construction.
            self.printExitWait()
            # decrement time to exit for entity at the head.
            self.exit_queue[0].curr_goods -= 1
            if not self.exit_queue[0].curr_goods:
                # if entity at head is to leave
                entity = self.exit_queue.popleft()
                self.display.appendLog(["entity", "exit"], entity.id, "t = "+str(self.time)+"\tid = "+str(entity.id)+"\tLeaving exit queue.")
                # check if exit queue has been emptied or not, and append relevant log messages.
                if self.exit_queue:
                    entity = self.exit_queue[0]
                    self.display.appendLog(["entity", "exit"], entity.id, "t = "+str(self.time)+"\tid = "+str(entity.id)+"\tAt head of exit queue. To wait for "+str(entity.curr_goods)+" units of time.")
                else:
                    self.display.appendLog(["exit"], None, "t = "+str(self.time)+"\tExit queue emptied.")


    def serveAtCounter(self):
        '''
        Manages the counter-entity relationship. Services entities at counters, decrements the stock, increments entities' goods obtained.
        Outputs relevant messages to the log.
        Also shuts down empty counters, and moves entities into the exit queue after being serviced.
        '''
        for counter in self.counters:
            if counter.engaged:
                self.display.appendLog(["entity"], counter.engaged.id, "t = "+str(self.time)+"\tid = "+str(counter.engaged.id)+"\tRequesting 1 unit of goods at "+str(counter.id))

                #If an entity is at the counter, then he is definitely unsatisfied
                #Hence no need to check if curr==desired here
                if counter.goods:
                    # counter still has stocks
                    counter.goods -= 1
                    self.display.appendLog(["counter"], counter.id, "t = "+str(self.time)+"\tid = "+str(counter.id)+"\tServicing entity "+str(counter.engaged.id)+". Goods remaining = "+str(counter.goods))
                    counter.engaged.curr_goods += 1
                    self.display.appendLog(["entity"], counter.engaged.id, "t = "+str(self.time)+"\tid = "+str(counter.engaged.id)+"\tReceived 1 unit of goods from "+str(counter.id)+". Need "+str(int(counter.engaged.goods_desired-counter.engaged.curr_goods))+" more.")

                    if (counter.engaged.goods_desired == counter.engaged.curr_goods):
                        # entity is satisfied, shift him to the exit queue
                        if not counter.goods:
                            # Shut down the empty counter
                            counter.empty = True

                            self.display.appendLog(["counter"], counter.id, "t = "+str(self.time)+"\tid = "+str(counter.id)+"\tCounter empty, shutting down.")

                        # Print relevant exit queue related output messages
                        self.display.appendLog(["entity", "exit"], counter.engaged.id, "t = "+str(self.time)+"\tid = "+str(counter.engaged.id)+"\tJoining exit queue.")
                        if not self.exit_queue:
                            self.display.appendLog(["entity", "exit"], counter.engaged.id, "t = "+str(self.time)+"\tid = "+str(counter.engaged.id)+"\tAt head of exit queue. To wait for "+str(counter.engaged.curr_goods)+" units of time.")
                        self.exit_queue.append(counter.engaged)
                        counter.engaged = None

                else: 
                    # Just got empty in the previous iteration, entity still at counter, unsatisfied.
                    self.display.appendLog(["entity"], counter.engaged.id, "t = "+str(self.time)+"\tid = "+str(counter.engaged.id)+"\tNo more goods avaiable at "+str(counter.id)+". Need "+str(int(counter.engaged.goods_desired-counter.engaged.curr_goods))+" more.")

                    # Shut down the empty counter
                    counter.empty = True

                    # Print relevant exit queue related output messages
                    self.display.appendLog(["counter"], counter.id, "t = "+str(self.time)+"\tid = "+str(counter.id)+"\tCounter empty, shutting down.")
                    self.display.appendLog(["entity", "exit"], counter.engaged.id, "t = "+str(self.time)+"\tid = "+str(counter.engaged.id)+"\tJoining exit queue.")
                    if not self.exit_queue:
                        self.display.appendLog(["entity", "exit"], counter.engaged.id, "t = "+str(self.time)+"\tid = "+str(counter.engaged.id)+"\tAt head of exit queue. To wait for "+str(counter.engaged.curr_goods)+" units of time.")

                    self.exit_queue.append(counter.engaged)
                    counter.engaged = None

        # Clear out the empty counters
        self.counters = [counter for counter in self.counters if not counter.empty]
        if not self.counters:
            self.display.appendLog(["counters"], None, "t = "+str(self.time)+"\tCounters empty.")


    def moveToCounter(self):
        '''
        Shift entities from the head of the entry queue to a free counter.
        Print relevant output messages.
        '''
        self.printEntryWait()
        for counter in self.counters:
            if not counter.engaged:
                if self.entry_queue:
                    counter.engaged = self.entry_queue.popleft()
                    self.display.appendLog(["entity", "entry"], counter.engaged.id, "t = "+str(self.time)+"\tid = "+str(counter.engaged.id)+"\tAt the head of entry queue. Going to Counter "+str(counter.id))
                else:
                    break


    def initQueue(self, max_goods_desired=4, desire_dist=constDist, **kwargs):
        '''
        Parameters:
        max_goods_desired = max no. of desired goods for an entity
        desitre_dist = passed probablity distribution to choose desired no. of goods for an entity
        **kwargs = misc keyword arguments to be passed to the probability distribution function
        '''
        total = sum([counter.goods for counter in self.counters])
        while total:
            entity = self.Entity(max_goods_desired, desire_dist, **kwargs)
            self.entry_queue.append(entity)
            total -= 1
            self.display.appendLog(["entity", "entry"], entity.id, "t = "+str(self.time)+"\tid = "+str(entity.id)+"\tJoining queue.")

        self.display.appendLog(["entities", "status"], None, "t = "+str(self.time)+"\t"+str(len(self.entry_queue))+" Entities created.")


    def chooseView(self, view):
        '''
        Choose a PoV display class depending on the input.
        Can be overriden to allow for multiple PoVs.
        Display classes will have to be inherited and modified as well.

        Parameters:
        view = The requested PoV to observe during the simulation
        '''
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
            return DisplayCounter([int(x) for x in view[1:]]) # Passing the specific IDs to monitor
        if 'entity' in view:
            return DisplayEntity([int(x) for x in view[1:]]) # Passing the specific IDs to monitor


    def updateEntryWait(self):
        '''
        Update the entry queue wait time for entities
        in the entry queue.
        '''
        for entity in self.entry_queue:
            entity.entry_wait += 1


    def updateExitWait(self):
        '''
        Update the exit queue wait time for entities
        in the exit queue.
        '''
        for entity in self.exit_queue:
            entity.exit_wait += 1


    def printEntryWait(self):
        '''
        Append all entry queue wait time details at the current time instance
        to the logs.
        '''
        for entity in self.entry_queue:
            self.display.appendLog(["entity", "entry"], entity.id, "t = "+str(self.time)+"\tid = "+str(entity.id)+"\tWaiting time in entry queue = "+str(entity.entry_wait))


    def printExitWait(self):
        '''
        Append all entry queue wait time details at the current time instance
        to the logs.
        '''
        for entity in self.exit_queue:
            self.display.appendLog(["entity", "exit"], entity.id, "t = "+str(self.time)+"\tid = "+str(entity.id)+"\tWaiting time in exit queue = "+str(entity.exit_wait))


    def updateStatus(self):
        '''
        Function to output current entity position status to the log.
        '''
        status = "Status at t = "+str(self.time)+":\n"

        # Entities in entry queue
        status += "In Entry Queue:\n"
        for entity in self.entry_queue:
            status += "Entity "+str(entity.id)+"\n"

        # Entities at the counters
        for counter in self.counters:
            status += "\nAt Counters:\n"
            if counter.engaged:
                status += "Counter "+str(counter.id)+": Entity "+str(counter.engaged.id)+"\n"

        # Entities in exit queue
        status += "\nIn Exit Queue:\n"
        for entity in self.exit_queue:
            status += "Entity "+str(entity.id)+"\n"

        self.display.appendLog(["status"], None, status)


    def startSimulation(self):
        '''
        Starts the simulator. Halts it when the counters are empty, and empties the exit queue.
        If entry queue is emptied before the counters stocks hit zero, the simulation keeps running
        as the specified termination condition isn't encountered. To enable entities to join the entry queue at a rate 'r'
        this class needs to be inherited, and this function is to be overriden, with appropriate method calls to update the entry queue.
        Outputs relevant messages to the log.
        '''
        # Going in reverse to prevent same entity from moving
        # forward multiple steps in one time instance
        while self.counters:
            self.updateStatus()
            self.exitQueue()
            self.serveAtCounter()
            # check necessary because all counters may have closed
            if self.counters:
                self.moveToCounter()
            self.time += 1
            self.updateEntryWait()
            self.updateExitWait()

        # End of simulation. Output relevant data and clear exit queue
        self.time -= 1
        self.updateStatus()
        self.display.printLog()
        print "Simulation halted at t =", self.time
        print "Emptying exit queue..."
        while self.exit_queue:
            entity = self.exit_queue.popleft()
            print entity.id, "exiting queue at t =", self.time
        print "Exit queue emptied."

