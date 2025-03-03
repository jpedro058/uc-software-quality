//Write a model that counts and displays the amount of even numbers in the interval [10; 200]

active proctype P() {
    byte count = 0;
    byte i;

    for (i : 10..200) {
        if
            :: i % 2 == 0 -> count++
            :: else -> skip
        fi
    }

    printf("Amount of even numbers in the interval [10; 200] = %d\n", count);
}