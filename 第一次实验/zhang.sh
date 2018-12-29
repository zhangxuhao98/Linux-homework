#!/bin/sh   
#FileName:proj.sh
#Function:create project directory quckily   
#Version:V0.1   
#Author:Zhang 
#Date:2018-12-20
#Shell脚本中变量赋值等号两边均不能有空格存在
CURRPATH=$PWD  
mkdir -p $1/inc 
mkdir -p $1/src 
mkdir -p $1/build 

touch  $1/src/main.c
echo "#include<stdio.h>" >> $1/src/main.c
echo '#include "print2.h"' >> $1/src/main.c
echo "void main()" >> $1/src/main.c
echo "{" >> $1/src/main.c
echo 'printf("hello Linux!");' >> $1/src/main.c
echo "File2Print();" >> $1/src/main.c
echo "}" >> $1/src/main.c

touch  $1/src/$2.c
echo '#include "print2.h"'>> $1/src/$2.c
echo "void File2Print()" >> $1/src/$2.c
echo "{" >> $1/src/$2.c
echo 'printf("Print file2*********");' >> $1/src/$2.c
echo "}" >> $1/src/$2.c

touch  $1/src/print2.h
echo "#ifndef FILE2_H_" >> $1/src/print2.h
echo "#define FILE2_H_" >> $1/src/print2.h
echo "void File2Print();" >> $1/src/print2.h
echo "#endif" >> $1/src/print2.h



touch  $1/src/Makefile
echo "helloworld:main.o $2.o" >> $1/src/Makefile
echo "	gcc main.o $2.o -o helloworld" >> $1/src/Makefile
echo "main.o:main.c print2.h" >> $1/src/Makefile
echo "	gcc -c main.c -o main.o" >> $1/src/Makefile
echo "$2.o:$2.c print2.h" >> $1/src/Makefile
echo "	gcc -c $2.c -o $2.o" >> $1/src/Makefile
echo "clean:" >> $1/src/Makefile
echo "	rm -rf*.o" >> $1/src/Makefile


cd $1/src
make
./helloworld

 
 
