import sys
from collections import deque


class Person:
    number = 0
    def __init__(self, goods):
        Person.number += 1
        self.id = Person.number
        self.goods_desired = goods
        self.curr_goods = 0
        self.exit = False


class Counter:
    number = 0
    def __init__(self, goods):
        Counter.number += 1
        self.id = Counter.number
        self.goods = goods
        self.engaged = None
        self.empty = (self.goods==0)


# Global variables
counters = []
for i in range(1,3):
    counter = Counter(5)
    counters.append(counter)

time = 0
delay = 2
queue = deque()
exit_queue = deque()


def exitQueue():
    global exit_queue
    for person in exit_queue:
        if person.goods_desired:
            person.goods_desired -= 1
        else:
            person.exit = True
            print person.id, " exiting queue at t = ", time

    exit_queue = deque([person for person in exit_queue if not person.exit])


def serveAtCounter():
    global counters
    for counter in counters:
        if counter.engaged:
            if (counter.engaged.goods_desired != counter.engaged.curr_goods):
                if counter.goods:
                    counter.goods -= 1
                    counter.engaged.curr_goods += 1
                else: #Just got empty in the previous iteration, macha still at counter
                    counter.empty = True
                    exit_queue.append(counter.engaged)
                    print counter.engaged.id, " joining exit queue at t = ", time
                    counter.engaged = None
            else:
                if not counter.goods:
                    counter.empty = True
                exit_queue.append(counter.engaged)
                print counter.engaged.id, " joining exit queue at t = ", time
                counter.engaged = None

    counters = [counter for counter in counters if not counter.empty]


def moveToCounter():
    for counter in counters:
        if not counter.engaged:
            if queue:
                counter.engaged = queue.popleft()
                print counter.engaged.id, " going to counter ", counter.id, " at t = ", time
            else:
                break


def joinQueue():
    if (time%delay==0):
        person = Person(4)
        queue.append(person)
        print person.id, " Joining queue at t = ", time


def main(argv):
# Going in reverse to prevent same entity from moving
# forward multiple steps in one time instance
    global time
    while counters:
        exitQueue()
        serveAtCounter()
        if counters:
            moveToCounter()
            joinQueue()
        time += 1
    print "Counters empty at t = ", time
    print "Emptying exit queue"
    while exit_queue:
        exitQueue()
        time += 1
    print "Exit queue empty at t = ", time


if __name__ == "__main__":
    main(sys.argv)
