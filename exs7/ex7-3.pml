short max_pumped = 75;
short reservoir;
short pumped = 0;
bool filling = false;

inline refilling(){
    filling = true;

    do
    :: reservoir < 50  -> reservoir = reservoir + 5;
    :: reservoir >= 50 -> break
    od

    filling = false
}

inline pump(){
    do
    :: atomic{ (max_pumped > 0 && reservoir >= 5 && filling == false) ->     
        reservoir = reservoir - 5;   
        max_pumped = max_pumped - 5; 
       }   
    :: reservoir < 5 -> refilling();
    :: max_pumped <= 5 -> break;
    od
}

init{
    select(reservoir : 35..40);

    pump()
}