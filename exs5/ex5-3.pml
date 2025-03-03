/* To avoid collisions in a railway line, trains must communicate with each
other. Create a model where there are 2 trains (one train can be going
north and the other south) and whenever one of the trains leaves the
railway line, it sends a message to the other train stating that it can enter
the railway line. */

chan permission = [0] of {bit};  // Canal para comunicação entre os trens

active proctype TrainA() {
    printf("Train A: Waiting for permission\n");

    permission?1;
    
    printf("Train A: Entering the railway\n");
    
    printf("Train A: Traveling for %d sec\n", 10);
    
    printf("Train A: Leaving the railway\n");

    // Envia permissão para o outro trem
    permission!1;
    
    printf("Train A: Sent permission to Train B\n");
}

active proctype TrainB() {
    printf("Train B: Waiting for permission\n");

    permission?1;
    
    printf("Train B: Entering the railway\n");
}

init {

    permission!1;

    run TrainA();
    run TrainB();
}
