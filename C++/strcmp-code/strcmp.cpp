#include <string.h>
#include <iostream>
using namespace std;
#define AAA "-china"
bool usestdio;
int main (int argc, char** argv){
usestdio = 1;
if (argc>1)
	{
		usestdio=strcmp(argv[1],AAA)!=0;
	}
if(usestdio)
	cout<<"YOU ARE dog"<<endl;
else
	cout<<"YOU ARE "<<AAA<<endl;
	cout<<argc<<endl;

	return 0;
}
