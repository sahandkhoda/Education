#include <stdio.h>
#include <string.h>

#define titleSIZE 100
#define authorSIZE 100
#define locationSIZE 100

//void printBook(Book *aBook);

typedef struct
    {
        char title[titleSIZE+1];
        char author[authorSIZE+1];
        int price;                      // Something is wrong. The scanned value isn't stored here...
        char location[locationSIZE+1];
    } Book;

void getBook(Book *GetBook)
{
    printf("Enter book credentials.\n");
    printf("Title     : ");  scanf("%[^\n]%*c", (*GetBook).title);
    printf("Author    : ");  scanf("%[^\n]%*c", (*GetBook).author);
    printf("Price     : $"); scanf("%d"       , (*GetBook).price);
    printf("Location  : ");  scanf("%[^\n]%*c", (*GetBook).location);
}

void printBook(Book *PrintBrook)
{
    printf("\n");
    printf("You have entered:\n");
    printf("TITLE    : %s\n", (*PrintBrook).title);
    printf("AUTHOR   : %s\n", (*PrintBrook).author);
    printf("PRICE    : $%d\n", &((*PrintBrook).price));
    printf("LOCATION : %s\n", (*PrintBrook).location);
}

int main(void)
{
    printf("\n");
    printf("Welcome to Library Organizer (0.1)\n");

    Book myBook;
    getBook(&myBook);
    
    printf("HELLO %s", (myBook).title);
    
    printBook(&myBook);

    printf("Library done!\n");
    return 0;
}