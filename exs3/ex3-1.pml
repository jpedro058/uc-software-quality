//Verify (using the assert instruction) that the following equation is always true for n = 5.
active proctype P() {
    int n = 5;  
    byte i = 1;

    i = ((n * n) + n) / 2

    assert(i == 15);
}