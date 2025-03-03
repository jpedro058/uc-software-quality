#define N 2
short semaphore = 1;
short global = 0;

inline P ( sem ) { /* wait ( sem ) function */
    atomic{
       ( sem > 0);
        sem--
    }
}

inline V ( sem ) { /* signal ( sem ) function */
    sem ++
}

active [ N ] proctype Q () {
    P ( semaphore );
    global ++;
    assert ( global == 1 );
   global --;
    V ( semaphore );
 
}