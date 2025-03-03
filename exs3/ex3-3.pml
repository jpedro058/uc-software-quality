//Insert a defect (i.e., a software bug) in the code of the previous algorithm. This defect should make the assertion fail when a==5 and b==10. Test to see the assertion catch the defect.
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
    a = b + a ; // error here, should be (-)

    assert(a == tempB && b == tempA);
    printf("a = %d, b = %d\n", a, b);
    printf("tempA = %d, tempB = %d\n", tempA, tempB);
}