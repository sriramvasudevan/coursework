from queuesim import *
from random import random, expovariate
from math import floor


class Car(Entity):
    def __init__(self, max_goods_desired, desire_dist, **kwargs):
        Entity.__init__(self, max_goods_desired, desire_dist, **kwargs)
        randchoice = kwargs['randchoice']
        colors = kwargs['colors']
        index = int(floor(len(colors)*randchoice(**kwargs)))
        index = index%len(colors)
        self.color = colors[index]
        #self.car_type = car_type

    def printData(self):
        print self.color, "is the color of Car", self.id
        #print self.car_type, "is the type of Car", self.id


def expovar(**kwargs):
    return expovariate(kwargs['lambd'])


class QS(QueueSimulator):
    def __init(self, Counter=Counter, Entity=Entity):
        QueueSimulator.__init__(self, Counter, Entity)

    #def initQueue(self, max_goods_desired=4, desire_dist=constDist, **kwargs):
    #    car_types = [1,2,3,4,5]
    #    i = 0
    #    tot_goods = sum([counter.goods for counter in self.counters])
    #    while tot_goods:
    #        car_type = car_types[i%len(car_types)]
    #        entity = self.Entity(max_goods_desired, desire_dist, car_type, **kwargs)
    #        self.entry_queue.append(entity)
    #        tot_goods -= 1
    #        i += 1
    #        print entity.id, "has been appended"
    #        entity.printData()


def main():
    colorlist = ["Black", "White", "Red"]
    queue_simulator = QS(Entity=Car,view=['counters'])
    queue_simulator.initCounters(goods_dist=random)
    queue_simulator.initQueue(colors=colorlist, randchoice=expovar, lambd=1.5)
    queue_simulator.startSimulation()


if __name__=='__main__':
    main()
