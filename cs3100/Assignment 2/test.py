from queuesim import *
from random import random, expovariate
from math import floor


class Car(Entity):
    '''
    Extension of the Entity class for demo purposes.
    Has custom fields and methods.
    '''
    def __init__(self, max_goods_desired, desire_dist, car_type, **kwargs):
        '''
        Overridden init function.
        '''
        Entity.__init__(self, max_goods_desired, desire_dist, **kwargs)

        # Generate random color
        randchoice = kwargs['randchoice']
        colors = kwargs['colors']
        index = int(floor(len(colors)*randchoice(**kwargs)))
        index = index%len(colors)
        self.color = colors[index]
        self.car_type = car_type

    def printData(self):
        '''
        Function to print data for the custom fields.
        '''
        print self.color, "is the color of Car", self.id
        print self.car_type, "is the type of Car", self.id


def expovar(**kwargs):
    '''
    Modifying the expovariate() function from the random lib
    to allow it to be passed to the object methods as params.
    '''
    return expovariate(kwargs['lambd'])


class QS(QueueSimulator):
    '''
    Custom Queue Simulator class to demo extension capabilities.
    '''
    def __init(self, Counter=Counter, Entity=Entity):
        QueueSimulator.__init__(self, Counter, Entity)

    def initQueue(self, max_goods_desired=4, desire_dist=constDist, **kwargs):
        '''
        Overrides the parent class' method for demo purposes.
        Prints data for custom Entity fields.
        '''
        car_types = [1,2,3,4,5]
        i = 0
        tot_goods = sum([counter.goods for counter in self.counters])

        # Generate Entities equal to the total number of goods in 
        # all the counters.
        while tot_goods:
            car_type = car_types[i%len(car_types)]

            # initialise individual enitites
            entity = self.Entity(max_goods_desired, desire_dist, car_type, **kwargs)
            self.entry_queue.append(entity)
            tot_goods -= 1
            i += 1
            # print custom data
            entity.printData()

            # Append to log
            self.display.appendLog(["entity", "entry"], entity.id, "t = "+str(self.time)+"\tid = "+str(entity.id)+"\tJoining queue.")

        # Append to log
        self.display.appendLog(["entities", "status"], None, "t = "+str(self.time)+"\t"+str(len(self.entry_queue))+" Entities created.")


def main():
    colorlist = ["Black", "White", "Red"]

    # Create a new simulator instance with a custom entity
    # and PoV.
    queue_simulator = QS(Entity=Car,view=['entity', 10])
    # init the countets
    queue_simulator.initCounters(goods_dist=random, no_counters=10)
    # init the enities and append to entry queue
    queue_simulator.initQueue(colors=colorlist, randchoice=expovar, lambd=1.5)
    # start simulation
    queue_simulator.startSimulation()


if __name__=='__main__':
    main()
