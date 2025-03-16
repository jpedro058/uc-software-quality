/* 
Model a gas station. Obey the following constraints:
(a) There is a single reservoir that holds the gas;
(b) Pumps draw gas from the reservoir, as long as there is gas left;
(c) The reservoir can be refilled to its maximum capacity;
(d) While the reservoir is being filled, the pumps cannot work;
(e) Pumps can operate in parallel and their state may change between
in-use (i.e., pumping gas into a car) and idle;
(f) Assume a maximum reservoir capacity of 50 liters and an initial reser-
voir capacity that ranges between 35 and 40 liters;
(g) Assume that the gas station has 2 pumps;
(h) Your model should end when 75 or more liters have been pumped;
*/

bool filling = false;
byte reservoir = 35;
byte total_pumped = 0;
#define MAX_CAPACITY 50
#define END_LIMIT 75
#define NUM_PUMPS 2

inline pump_gas(byte id) {
    if
    :: (reservoir > 0 && !filling) -> 
        printf("Pump %d is pumping. Reservoir: %d\n", id, reservoir);
        reservoir--;
        total_pumped++;
    fi;
}

inline refill() {
    filling = true;
    printf("Refilling reservoir...\n");
    reservoir = MAX_CAPACITY;
    filling = false;
}

proctype Pump(byte id) {
    do
    :: (total_pumped >= END_LIMIT) -> break;
    :: pump_gas(id);
    od;
}

init {
    atomic {
        run Pump(1);
        run Pump(2);
    }
    do
    :: (total_pumped >= END_LIMIT) -> printf("Pumping complete. Total pumped: %d\n", total_pumped); break;
    :: (reservoir == 0) -> refill();
    od;
}

