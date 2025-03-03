/* The following model details an algorithm to ensure mutual exclusion between two processes. Despite being simpler, this solution does not possess the same properties as those of the algorithm seen in the previous exercise. What are the differences between them? Verify whether this solution also ensures that the processes are never simultaneously inside the critical region. */
    
int count = 0;
bool wants [2];
active[2] proctype P() {  
    do
    :: wants [ _pid ] = true ;
        ( ! wants [( _pid +1)%2] );
        
        // Critical section
        count++;
        assert(count == 1)
        count--;
        wants [ _pid ] = false
    od
}

init {
    wants[0] = false;
    wants[1] = false;
    run P();
    run P();
}