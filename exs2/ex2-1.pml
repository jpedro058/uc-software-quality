//Write a model that randomly initializes two variables with values in the interval [0; 10] and prints the highest value among the two variables.
active proctype P() {
    byte x, y;
    select(x : 0..10);
    select(y : 0..10);

    if
        :: x > y -> printf("x = %d is greater than y = %d\n", x, y)
        :: x < y -> printf("y = %d is greater than x = %d\n", y, x)
        :: x == y -> printf("x = y = %d\n", x)
    fi
}