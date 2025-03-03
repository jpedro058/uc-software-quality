/* Create a model where 3 client processes send a message to a message
channel. Each message should include two integer values, which are chosen
at random when sending the message. One (server) process should listen
for new messages and print the two integer values whenever it receives
a message. The message channel should have space to keep at most 2
messages. */

#define N 3
chan message_channel = [2] of {int, int};

active [N] proctype A() {
    int a = 0;
    int b = 0;
    select(a : 0..10);
    select(b : 0..10);
    message_channel!a, b;
}

active proctype B() {
    int x = 0;
    int y = 0;
    do
    :: message_channel?x, y -> printf("Received message: %d, %d\n", x, y)
    :: timeout -> break
    od
}
