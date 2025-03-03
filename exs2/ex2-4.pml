//Write a model that initializes an array of size 5 with values between 1 and 40 and then finds and prints the lowest value in the array and its position.

active proctype P() {
    byte array[5];
    byte i;
    byte min = 40;
    byte pos = 0;
    byte aux;

    for (i : 0..4) {
         select(aux : 1..40);
        array[i] = aux;
        printf("array[%d] = %d\n", i, array[i]);
    }

    for (i : 0..4) {
        if
            :: array[i] < min -> min = array[i]; pos = i
            :: else -> skip
        fi
    }

    printf("Lowest value in the array = %d\n", min);
    printf("Position of the lowest value in the array = %d\n", pos);
}