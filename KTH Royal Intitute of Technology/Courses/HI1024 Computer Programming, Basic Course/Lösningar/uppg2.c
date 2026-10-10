#include <stdio.h>
#include <time.h>
#include <stdlib.h>
#include <string.h>

#define MAXCHAR 21
#define MAX 20

struct wordPair{
        char swedish[MAXCHAR];
        char english[MAXCHAR];
};
typedef struct wordPair WordPair;

int  addWordPairs(WordPair wordPairs[],int nrOfWordPairs);
void printWordPairs(WordPair wordPairs[],int nrOfWordPairs);
void practice(WordPair wordPairs[],int nrOfWordPairs);
void copyArray(WordPair destination[],WordPair source[],int length);
void randomize(WordPair v[],int length);
void swap(WordPair v[],int i1, int i2);

int main()
{
        int selection,keepOn=1,nrOfWordPairs=0;
        WordPair wordPairs[MAX];
        srand(time(NULL));

        while(keepOn){
                printf("(1) Skriva in (2) Skriva ut (3) Radera (4) Trana (5) Avsluta: ");
                scanf("%d",&selection);
                switch(selection){
                        case 1: nrOfWordPairs = addWordPairs(wordPairs,nrOfWordPairs);
                        break;
                        case 2:printWordPairs(wordPairs,nrOfWordPairs);
                        break;
                        case 3:nrOfWordPairs=0;
                        break;
                        case 4:practice(wordPairs,nrOfWordPairs);
                        break;
                        case 5: keepOn=0;
                        break;
                }
        }
        printf("Avslutar\n");
        return 0;
}

void practice(WordPair wordPairs[],int nrOfWordPairs){
        if(nrOfWordPairs==0){
                printf("Gloslistan ar tom\n");
                return;
        }
        WordPair copy[MAX];
        char answer[MAXCHAR];
        copyArray(copy,wordPairs,nrOfWordPairs);
        randomize(copy,nrOfWordPairs);
        int points=0;
        for(int i=0;i<nrOfWordPairs;i++){
                printf("%s: ",copy[i].swedish);
                scanf("%s",answer);
                if(strcmp(answer,copy[i].english)==0){
                        points++;
                }
        }
        printf("Du fick %d poang\n",points);
}

void randomize(WordPair v[],int length){
        for(int i=0;i<length;i++){
                swap(v,i,rand()%length);
        }
}

void swap(WordPair v[],int i1, int i2){
        WordPair tmp;
        tmp=v[i1];
        v[i1]=v[i2];
        v[i2]=tmp;
}

void copyArray(WordPair destination[],WordPair source[],int length){
        for(int i=0;i<length;i++){
                destination[i]=source[i];
        }
}

void printWordPairs(WordPair wordPairs[],int nrOfWordPairs){
        if(nrOfWordPairs==0){
                printf("Gloslistan ar tom\n");
                return;
        }
        for(int i=0;i<nrOfWordPairs;i++){
                printf("%s - %s\n",wordPairs[i].swedish,wordPairs[i].english);
        }
}

int addWordPairs(WordPair wordPairs[],int nrOfWordPairs){
        for(;nrOfWordPairs<MAX;nrOfWordPairs++){
                printf("Svenska: ");
                scanf("%s",&(wordPairs[nrOfWordPairs].swedish));
                if(strcmp(wordPairs[nrOfWordPairs].swedish,"q")==0){
                        return nrOfWordPairs;
                }
                printf("Engelska: ");
                scanf("%s",&(wordPairs[nrOfWordPairs].english));
        }
        return nrOfWordPairs;
}