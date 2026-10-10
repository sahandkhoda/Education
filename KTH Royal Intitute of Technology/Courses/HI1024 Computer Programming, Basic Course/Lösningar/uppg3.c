#include <stdio.h>
#include <time.h>
#include <stdlib.h>
#include <limits.h>

#define MAX 5

struct point{
    float x,y;
};
typedef struct point Point;

void fill(Point points[],int length);
void printArray(Point points[],int length);
void print(Point p);
Point furthest(Point points[],int length);

int main()
{
    Point points[MAX];
    srand(time(NULL));

    fill(points,MAX);
    printArray(points,MAX);
    print(furthest(points,MAX));
    printf("\n");
    return 0;
}

Point furthest(Point points[],int length){
    Point p = {INT_MIN,INT_MIN};
    for(int i=0;i<length;i++){
        if(points[i].x>p.x){
            p=points[i];
        }
    }
    return p;
}

void printArray(Point points[],int length){
    for(int i=0;i<length;i++){
        print(points[i]);
        printf(",");
    }
    printf("\n");    
}

void print(Point p){
    printf("(%.2f,%.2f)",p.x,p.y);
}

void fill(Point points[],int length){
    for(int i=0;i<length;i++){
        points[i].x=rand()/(float)RAND_MAX;
        points[i].y=rand()/(float)RAND_MAX;
    }
}