#include <stdio.h>
#include <string.h>
#define MAXCHAR  21
#define MAXWORDS 20

typedef struct
{
    char svenska[MAXCHAR];
    char english[MAXCHAR];
} Words;

int  enter(Words theWords[], int *WordPairs);
int  view (Words theWords[], int *WordPairs);
void reset(Words theWords[], int *nbWords);
int  quit ();

int main(void)
{
    printf("\n");
    printf("Welcome to Vocabulary.\n");
    
    Words myWords[MAXWORDS];
    int option=0;
    int numberOfWords=0, *ptrNbWords = &numberOfWords;

    while (option!=4)
    {
        printf("\n");
        printf("(1) Enter | (2) View | (3) Reset | (4) Avsluta\n");
        printf("Choose option : "); scanf("%d", &option);
        switch (option)
        {
            case 1: enter(myWords, ptrNbWords); break;
            case 2: view (myWords, ptrNbWords); break;
            case 3: reset(myWords, ptrNbWords); break;
            case 4: quit (); break;
            default: printf("ERROR. Enter a valid option!\n\n"); break;
        }
    }
}

int enter(Words theWords[], int *WordPairs)
{
    printf("\n");
    printf("-- Opening Enter --\n\n");

    if(*WordPairs==MAXWORDS)
    {
        printf("STOP. Can't add any more words!\n\n");
        printf("-- Closing Enter --\n\n");
        return 0;
    }

    for (*WordPairs; *WordPairs < MAXWORDS; (*WordPairs)++)
    {
        printf("Word #%d\n", *WordPairs+1);
        printf("Svenska : "); scanf("%s", &(theWords[*WordPairs]).svenska);
            if (strcmp(theWords[*WordPairs].svenska, "q")==0) return *WordPairs;
        printf("English : "); scanf("%s", &(theWords[*WordPairs]).english);
        printf("\n");
    }
    
    printf("-- Closing Enter --\n\n");
}

int view(Words theWords[], int *WordPairs)
{
    printf("\n");
    printf("-- Opening View --\n\n");

    if(*WordPairs==0)
    {
        printf("NO WORDS HAVE BEEN ENTERED!\n\n");
        printf("-- Closing View --\n\n");
        return 0;
    }

    for (int i = 0; i < *WordPairs; i++) printf("%s - %s\n", theWords[i].svenska, theWords[i].english);

    printf("\n");
    printf("-- Closing View --\n\n");
}

void reset(Words theWords[], int *nbWords)
{
    printf("\n");
    printf("-- Opening Reset --\n\n");

    for (int i = 0; i < *nbWords; i++)
    {
        printf("%s\n", theWords[i].svenska);
    }
    

    printf("\n");
    printf("-- Closing Reset --\n\n");
}

int quit ()
{
    printf("\n");
    printf("-- Exiting program --\n\n");
    return 0;
}