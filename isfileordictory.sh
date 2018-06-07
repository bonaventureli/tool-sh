#!/bin/bash  
#print the directory and file  
  
for file in *  
do  
if [ -d "$file" ]  
then   
  echo "$file is directory"  
elif [ -f "$file" ]  
then  
  echo "$file is file"  
fi  
done  
