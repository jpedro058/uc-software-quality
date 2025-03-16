
active proctype P() {
    byte v1;
    byte v2;
    select(v1 : 0..10);
    select(v1: 0..10);
}


active proctype p(){
    short n = 30;
    short i, result;

    for(i : i..n){
        result =  result + (i * i / 4)
    }
}

active proctype p3() {
    short even;
    short i = 10;

    for(i : i..200){
        if
        :: (i % 2) == 0 -> even++;
        :: else -> skip;
        fi
    }
}


active proctype p4(){
    short arr[5];
    short i, aux, lowest, position;
    for (i : i..5){
        select(aux : i..40);
        arr[i] = aux;
    }

    for(i : i..5){
        if
        :: (arr[i] < lowest) -> lowest == arr[i]; position = i 
        :: else -> skip
        fi
    }
}


active proctype p5(){
    short arr[8];
    short i, aux;

    for(i : i..8){
        select(aux : 10..40);
        arr[i] = aux;
    }

    for(i: i..8){
        if
        :: (arr[i] < arr[i + 1]) -> 
        aux = arr[i]; 
        arr[i] = arr[i + 1]; 
        arr[i + 1] = aux;
        :: else -> skip;
        fi
    }
}


active proctype p31(){
    short n = 5;
    short i;

    assert(i == ((n * n + n) / 2))
}


active proctype p32(){
    short a, b, lastA, lastB;

    select(a : 1..20);
    lastA = a;
    select(b : 1..20);
    lastB = b;

    a = a - b;
    b = a + b;
    a = b - a;

    assert(a == lastB && b == lastA);
}


bool flag[2] = {false, false};
short checkProc;
short turn;
active proctype px(){
    do 
    ::( flag [1] == true && turn == 1)
    :: break;
    od;
    // critical section check
    checkProc++;
    assert(checkProc <= 1 );
    checkProc--;
    flag [0] = false ;
}

active proctype py(){
    do
    :: ( flag [1] == true && turn == 1)
    ::break;
    od

    // critical section check
    checkProc++;
    assert(checkProc <= 1 );
    checkProc--;
    flag [0] = false ;

}

bool wants [2];
active [2] proctype pz () {
    do
    :: wants [ _pid ] = true ;
    ( ! wants [( _pid +1)%2] );
    // Critical section check
    checkProc++;
    assert(checkProc <= 1)
    checkProc--;
    wants [ _pid ] = false
    od
}

