#include <iostream>
using namespace std;
int main()
{
int i;
float canhe,peisong,numpeople,eat[10],total1,total2,persent,eee;
total1=0;
cout<<"how many people eat:";
cin>>numpeople;
cout<<"how much canhe:";
cin>>canhe;
cout<<"how much peisong:";
cin>>peisong;
for (i=0;i<numpeople;i++){
cout<<"pepole"<<i<<"  eat:";
cin>>eat[i];
total1+=eat[i];
}
cout<<"The total price is:";
cin>>total2;
persent=total2/(canhe+peisong+total1);
cout<<"persent is"<<persent<<endl;
eee=(canhe+peisong)*persent/2;
cout<<"eee:"<<eee<<endl;
for (i=0;i<numpeople;i++){
cout<<eat[i]<<"----->"<<eat[i]*persent+eee<<endl;
total1+=eat[i];
}
return 0;
}
