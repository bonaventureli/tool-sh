#include <string.h>
#include <iostream>
using namespace std;
int main(int argc, char** argv)
{
const char* c;
string s="1234";
c=s.c_str();
cout<<c<<endl;
s="abcd";
cout<<c<<endl;
}
