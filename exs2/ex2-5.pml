//Write a model that randomly initializes an array of size n (you can assume n = 8) and then sorts its contents from the lowest to the highest value.

active proctype P() {
    byte array[8];
    byte i;
    byte aux;

    for (i : 0..4) {
        select(aux : 10..40);
        array[i] = aux;
        printf("array[%d] = %d\n", i, array[i]);
    }

    byte x = 0;
    byte j = 0;
    for (x : 0..4) {
        for ( j : 0..4) {
            if
                :: array[x] < array[j] -> 
                    aux = array[x];
                    array[x] = array[j];
                    array[j] = aux;
                :: else -> skip
            fi
        }
    }

    printf("------------------ \n")

    for (i : 0..4) {
        printf("array[%d] = %d\n", i, array[i]);
    }
}