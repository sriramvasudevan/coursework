class Display(object):
    def __init__(self):
        self.logs = []

    def appendLog(self,class_name, obj_id, string):
        self.logs.append([class_name, obj_id, string])

    def printLog(self):
        for log in self.logs:
            print log[2]


class DisplayCounter(Display):
    def __init__(self, counters):
        Display.__init__(self)
        self.counter_list = counters

    def printLog(self):
        for log in self.logs:
            if 'counter' in log[0]:
                if log[1] in self.counter_list:
                    print log[2]


class DisplayCounters(Display):
    def __init__(self):
        Display.__init__(self)

    def printLog(self):
        for log in self.logs:
            if ("counter" in log[0]) or ("counters" in log[0]):
                print log[2]


class DisplayEntity(Display):
    def __init__(self, entities):
        Display.__init__(self)
        self.entity_list = entities

    def printLog(self):
        for log in self.logs:
            if "entity" in log[0]:
                if log[1] in self.entity_list:
                    print log[2]


class DisplayEntities(Display):
    def __init__(self):
        Display.__init__(self)

    def printLog(self):
        for log in self.logs:
            if ("entity" in log[0]) or ("entities" in log[0]):
                print log[2]


class DisplayEntry(Display):
    def __init__(self):
        Display.__init__(self)

    def printLog(self):
        for log in self.logs:
            if "entry" in log[0]:
                print log[2]


class DisplayExit(Display):
    def __init__(self):
        Display.__init__(self)

    def printLog(self):
        for log in self.logs:
            if "exit" in log[0]:
                print log[2]


class DisplayStatus(Display):
    def __init__(self):
        Display.__init__(self)

    def printLog(self):
        for log in self.logs:
            if "status" in log[0]:
                print log[2]

