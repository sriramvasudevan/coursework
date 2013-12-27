% CS3100 - Programming Assignment 2
% Sriram V - CS11B058
%

## Read Me

1. The files `counter.py`, `display.py`, `entity.py` and `queuesim.py` together make up the Queue Simulator library.
2. The `test.py` file is an example of how to import the library and extend the appropriate classes, to customize and build upon the basic simulator that the library provides.
3. To use the library without any customisations:  

    ```
    from queuesim import *

    queue_simulator = QueueSimulator()
    queue_simulator.initCounters()
    queue_simulator.intiQueue()
    queue_simulator.startSimulation()
    ```

4. To extend the simulator and the associated classes, only `queuesim.py` needs to be imported.
5. `counter.py` contains the definiion for the Counter class.
6. `entity.py` contains the definiion for the Entity class.
7. `diplay.py` contains the definiion for the Display class. This class handles the logging of simulator outputs, and printing of messages depending on the specified PoV.
8. `queuesim.py` contains the QueueSimulator class definition.
9. The provided `Makefile` is set up to run the demo `test.py` on entering `make` in the terminal. `python test.py` entered in the terminal works as well.
10. The docstrings provide information about the parameters for the various methods and constructors used in the simulation library, which is required for the efficient extension and customisation of this basic library.
