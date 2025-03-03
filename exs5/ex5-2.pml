/* Extend the previous model so that the server sends an acknowledgment
message back to the process (client) that sent the message. The client
process should wait for the acknowledgment and only terminate after hav-
ing received it. You may need to perform significant modifications to the
previous model. */

#define N 3
chan message_channel = [2] of {int, int, chan};

active [N] proctype A() {
    int a = 0;
    int b = 0;
    chan ack = [1] of {int};
    select(a : 0..10);
    select(b : 0..10);
    
    printf("Sending message: %d, %d\n", a, b);
    message_channel!a,b, ack ;

    ack?1;
    printf("Received acknowledgment\n");
}

active proctype B() {
    int x = 0;
    int y = 0;
    chan ack;
    do
    :: message_channel?x, y, ack -> printf("Received message: %d, %d\n", x, y);
        ack!1;
    :: timeout -> break
    od
}
