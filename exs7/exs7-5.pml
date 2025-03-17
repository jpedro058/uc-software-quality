mtype = {Shutdown, Starting, Running, Failed}
short cost = 0;

active proctype P(){
    mtype state = Shutdown;

    do
    :: state == Shutdown -> 
        if
        :: state = Starting;
        :: skip;
        :: break;
        fi
    
    :: state == Starting -> 
        state = Running;

    :: state == Running ->
        cost++;
        
        if
        :: state = Failed; 
           printf("VM has failed!\n");
           break;
        :: state = Shutdown;
           printf("VM has been shut down by the owner.\n");
           break;
        :: skip
        fi
    od 

    printf("Cost: %d\n", cost)
}
