#include "HardwareFactory.h"

int main(int argc, char** argv)
{
I2C_DevicePtr pMotorControllerI2cDevice = HardwareFactory::CreateMotorControllerI2cDevice();
}
