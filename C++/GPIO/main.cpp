#include "GPIO.h"
#include "Hardware.h"
#include <iostream>

//constexpr int FAN_1_PIN = 23;
int main(int argc,char** argv)
{
try
{
    GPIO fan1GPIO(FAN_1_PIN);
    GPIO fan2GPIO(FAN_2_PIN);
    GPIO fan3GPIO(FAN_3_PIN);

    fan1GPIO.SetDirectionOut();
    fan2GPIO.SetDirectionOut();
    fan3GPIO.SetDirectionOut();

    fan1GPIO.SetOutputHigh();
    fan2GPIO.SetOutputHigh();
    fan3GPIO.SetOutputHigh();
while(1);
    return 0;
}
catch (const std::exception& e)
{
    std::cerr << "Fatal error: "<< e.what() << std::endl;
    return 1;
}
}
