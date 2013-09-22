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

    def printColor(self):
        print self.color, "is the color of Car", self.id


def expovar(**kwargs):
    return expovariate(kwargs['lambd'])


colorlist = ["Black", "White", "Red"]
queue_simulator = QueueSimulator(Entity=Car)
queue_simulator.initCounters(goods_dist=random)
queue_simulator.initQueue(colors=colorlist, randchoice=expovar, lambd=1.5)
queue_simulator.startSimulation()
