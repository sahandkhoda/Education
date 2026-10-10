#include <stdio.h>
#define N 0 //This part is not used and value doesn't matter

int findWay(int m[][10], int heigth){
    int level = 0, pos =0, sum =0;
    sum += m[level][pos];
    while(level<heigth-1){
        level++;
        if(m[level][pos]<m[level][pos+1]){
            pos++;
            printf("h, ");
        }else{
            printf("v, ");
        }
        sum += m[level][pos];
    }
    return sum;
}

int main(){

    int m1[4][10] ={  {5,N,N,N,N,N,N,N,N,N},
                      {2,7,N,N,N,N,N,N,N,N},
                      {9,1,0,N,N,N,N,N,N,N},
                      {6,3,4,7,N,N,N,N,N,N}};
    printf("\n%d\n",findWay(m1,4));
    int m2[4][10] ={  {5,N,N,N,N,N,N,N,N,N},
                      {7,7,N,N,N,N,N,N,N,N},
                      {9,1,0,N,N,N,N,N,N,N},
                      {6,3,4,7,N,N,N,N,N,N}};
    printf("\n%d\n",findWay(m2,4));
    int m3[1][10] ={  {5,N,N,N,N,N,N,N,N,N}};
    printf("\n%d\n",findWay(m3,1));
    int m4[2][10] ={  {5,N,N,N,N,N,N,N,N,N},
                      {2,7,N,N,N,N,N,N,N,N}};
    printf("\n%d\n",findWay(m4,2));
    return 0;
}
/*
h, v, h,
17
v, v, v,
27

5
h,
12
*/
