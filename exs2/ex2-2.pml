//Write a model that calculates and prints the result of the equation for n=30

active proctype P() {
    short n = 30;
    int i = 1;
    int result = 0;

    for (i : 1..n) {
        
        result = result + (i * i / 4)
    }

    printf("Result = %d\n", result);
}