class Display(object):
    '''
    The parent display class. Logs all the simulation stats.
    PoVs are implemented through children classes that focus
    thier attention only on certail logs.
    '''
    def __init__(self):
        # Format of the log file:
        # a list of [['tags'], relevant_id, 'output string']
        self.logs = []

    def appendLog(self,class_name, obj_id, string):
        '''
        Appends string to log with tags and relevant IDs
        '''
        self.logs.append([class_name, obj_id, string])

    def printLog(self):
        '''
        Prints all output statements in the log.
        '''
        for log in self.logs:
            print log[2]


class DisplayCounter(Display):
    def __init__(self, counters):
        '''
        Parameters:
        entities - a list of the IDs of the counters whose PoV we wish to view.
        '''
        Display.__init__(self)
        # Keep track of which counters to bother about
        self.counter_list = counters

    def printLog(self):
        '''
        Prints output statements specific to the counters
        in counter_list, from the log.
        '''
        for log in self.logs:
            if 'counter' in log[0]:
                if log[1] in self.counter_list:
                    print log[2]


class DisplayCounters(Display):
    def __init__(self):
        Display.__init__(self)

    def printLog(self):
        '''
        Prints all counter-related logs
        '''
        for log in self.logs:
            if ("counter" in log[0]) or ("counters" in log[0]):
                print log[2]


class DisplayEntity(Display):
    def __init__(self, entities):
        '''
        Parameters:
        entities - a list of the IDs of the entities whose PoV we wish to view.
        '''
        Display.__init__(self)
        # Keep track of which entities to bother about
        self.entity_list = entities

    def printLog(self):
        '''
        Prints output statements specific to the entities 
        in entity_list, from the log.
        '''
        for log in self.logs:
            if "entity" in log[0]:
                if log[1] in self.entity_list:
                    print log[2]


class DisplayEntities(Display):
    def __init__(self):
        Display.__init__(self)

    def printLog(self):
        '''
        Prints all entity-related logs
        '''
        for log in self.logs:
            if ("entity" in log[0]) or ("entities" in log[0]):
                print log[2]


class DisplayEntry(Display):
    def __init__(self):
        Display.__init__(self)

    def printLog(self):
        '''
        Prints all entry queue related logs
        '''
        for log in self.logs:
            if "entry" in log[0]:
                print log[2]


class DisplayExit(Display):
    def __init__(self):
        Display.__init__(self)

    def printLog(self):
        '''
        Prints all exit queue related logs
        '''
        for log in self.logs:
            if "exit" in log[0]:
                print log[2]


class DisplayStatus(Display):
    def __init__(self):
        Display.__init__(self)

    def printLog(self):
        '''
        Print all status related logs
        '''
        for log in self.logs:
            if "status" in log[0]:
                print log[2]

