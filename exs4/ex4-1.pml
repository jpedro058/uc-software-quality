// Peterson’s solution to the problem of mutual exclusion between two pro-cesses is described in the following pseudocode. 
// Note that theprocesses may execute the algorithm in an infinite loop.
//Using Spin, show that processes P0 and P1 are never inside the critical region at the same time.
	
int count = 0;
bool flag[2] = {false, false};
active proctype P0() {
    int turn = 1;
    flag[0] = true;

    do 
    :: ( flag [1] == true && turn == 1)
    :: else -> break;
    od;

    count++;
    assert (count == 1);
	count--;
   flag [0] = false ;

}

active proctype P1() {
    int turn = 0;
    flag[1] = true;

    do 
    ::( flag [0] == true && turn == 0)
    :: else -> break;
    od;
	
    count++;
    assert (count == 1);
    count--;
    flag [1] = false ;
}