/* Using LTL, verify that the value in the bank account is never negative in the following model:*/

ltl p1 { [] (account >= 0) }
int account = 100;

active [3] proctype Withdraw () {
    int amount ;
    select ( amount : 48 .. 50);
    
    if
    :: account >= amount ->
        account = account - amount ;
    :: else -> skip
fi
}