//#include <Logger.h>
#include <syslog.h>
#include <string.h>
#define PRINTER_STARTUP_MSG "Autodesk Ember 3D Printer" 
int MAX_ERROR_MSG_LEN = 1024;
//constexpr int MAX_ERROR_MSG_LEN = 1024;
char buf[1024];
void LogMessage(int priority, const char* msg);
int main(int argc, char** argv)
{
	LogMessage(LOG_INFO,PRINTER_STARTUP_MSG);
	return 0;
}
// Log a message with the given priority
void LogMessage(int priority, const char* msg)
{
    int len = strlen(msg);
    if (len > MAX_ERROR_MSG_LEN)
    {
        // break up large messages into smaller ones, 
        // so that syslog won't truncate them
        do
        {
            buf[MAX_ERROR_MSG_LEN - 1] = 0;
            strncpy(buf, msg, MAX_ERROR_MSG_LEN - 1);
            syslog(priority, "%s", buf);
            msg += MAX_ERROR_MSG_LEN - 1;
            len -= MAX_ERROR_MSG_LEN - 1;
        }
        while(len > 0);
    }
    else
        syslog(priority, "%s", msg);
}

