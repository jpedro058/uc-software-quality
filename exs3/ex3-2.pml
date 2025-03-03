//Verify that the following model that swaps the values of two variables is correct for any value of a and b between 1 and 20.
active proctype P() {
    int a,b;

    select(a : 1..20);
    select(b : 1..20);

    int tempA = a;
    int tempB = b;

    printf("a = %d, b = %d\n", a, b);
    printf("tempA = %d, tempB = %d\n", tempA, tempB);

    a = a - b ;
    b = a + b ;
    a = b - a ;

    assert(a == tempB && b == tempA);
    printf("a = %d, b = %d\n", a, b);
    printf("tempA = %d, tempB = %d\n", tempA, tempB);
}