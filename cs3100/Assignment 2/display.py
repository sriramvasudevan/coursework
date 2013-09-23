class Display(object):
    def __init__(self):
        self.
        'all'
        'entities'
        'entity'
        'counters'
        'counter'
        'status'
        'entry'
        'exit'

    def printCounter(self):
        return

    def printCounters(self):
        return

    def printEntity(self):
        return

    def printEntities(self):
        return

    def printEntry(self):
        return

    def printExit(self):
        return

    def printStatus(self):
        return

    def printAll(self):
        return


class DisplayCounter(Display):
    def __init__(self, counter):
        Display.__init__(self)
        self.counter = counter


    def printCounter(self):
        return


class DisplayCounters(DisplayCounter):
    def printCounters(self):
        for counter in self.counter:
            printCounter()
            

class DisplayEntity(Display):
    def __init__(self, entity):
        Display.__init__(self)
        self.entity = entity


    def printEntity(self):
        return


class DisplayEntities(DisplayEntity):
    def __init__(self, entity):
        DisplayEntity.__init__(self)
        self.entity = entity


    def printEntities(self):
        for entity in self.entity:
            printEntity()


class DisplayEntry(Display):
    def __init__(self, entry_queue):
        Display.__init__(self)
        self.entry_queue= entry_queue


    def printEntry(self):
        return


class DisplayExit(Display):
    def __init__(self, exit_queue):
        Display.__init__(self)
        self.exit_queue= exit_queue


    def printExit(self):
        return


class DisplayStatus(Display):
    def __init__(self, exit_queue):
        Display.__init__(self)
        self.exit_queue= exit_queue


    def printStatus(self):
        return


class DisplayAll(DisplayCounters, DisplayEntities, DisplayEntry, DisplayExit, DisplayStatus):
    def __init__(self, **kwargs):


    def printAll(self):
        self.printCounters()
        self.printEntities()
        self.printEntry()
        self.printExit()
        self.printStatus()
        return
