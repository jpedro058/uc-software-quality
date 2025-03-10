/*Using LTL, verify that there is always at most one process inside the
critical region in the following model:*/

ltl p1 { [] (semaphore <= 1) }

#define N 2
short semaphore = 1;

inline P ( sem ) { /* wait ( sem ) function */
    atomic {
        ( sem > 0);
        sem --
    }
}

inline V ( sem ) { /* signal ( sem ) function */
    sem ++
}

 active [ N ] proctype Q () {
        P ( semaphore );
        // Critical region
        V ( semaphore );
}