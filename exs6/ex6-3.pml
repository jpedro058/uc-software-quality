/*Create a model of a traffic light that obeys the following diagram. Using
LTL verify that:
(a) The light eventually becomes red (liveness)
(b) The light can always become yellow (recurrent behaviour):
(c) After a red, the light always changes to green
*/
string last_color ;
string semaphore ;

ltl red { <> (semaphore == red) }
ltl yellow { []<> (semaphore == yellow) }
ltl green {[](semaphore == red) -> (semaphore == green && last_color = red) }


