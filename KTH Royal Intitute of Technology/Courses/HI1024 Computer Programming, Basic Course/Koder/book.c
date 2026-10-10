#include <stdio.h>
#include <string.h>

// A Book Package ------------------------------
#define TITLESIZE 20+1
#define AUTHORSIZE 30+1
#define WHERESIZE 30+1
#define LIBSIZE 100

typedef struct {
   char title[TITLESIZE];
   char author[AUTHORSIZE];
   float price;
   char where[WHERESIZE];
   int id;
} Book;

void printBook(Book *pBook){
    printf("TITLE  : %s\n", pBook->title);
    printf("AUTHOR : %s\n", pBook->author);
    printf("PRICE  : %.2f\n", pBook->price);
    printf("WHERE  : %s\n", pBook->where);
    printf("(ID    : %d)\n", pBook->id);
}

Book initBook(char theTitle[], char theAuthor[],
              float thePrice, char theLocation[]){
   Book newBook;
   strcpy(newBook.title, theTitle);
   strcpy(newBook.author, theAuthor);
          newBook.price=thePrice;
   strcpy(newBook.where, theLocation);
          newBook.id=0;
   return newBook;
}

Book enterBook(){
    char theTitle[TITLESIZE];
    char theAuthor[AUTHORSIZE];
    float thePrice;
    char theLocation[WHERESIZE];

    printf("Title  ? ");
    scanf("%[^'\n']%*c",theTitle);
    printf("Author ? ");
    scanf("%[^'\n']%*c",theAuthor);
    printf("Price  ? ");
    scanf("%f%*c",&thePrice);
    printf("Where  ? ");
    scanf("%[^'\n']%*c",theLocation);

    return initBook(theTitle, theAuthor, thePrice, theLocation);
}

// A Library Package --------------------------

void printLibrary(Book aLibrary[], int size){
  for (int i=0; i<size; i++)
      printBook(&aLibrary[i]);
}

void addBookToLibrary(Book aLibrary[], int *pUsed, Book aBook) {
    aLibrary[(*pUsed)++]=aBook;
}

int main(void){

   Book myLibrary[LIBSIZE];
   int used=0;
   char cmd;

   printf("Library 1.0\n");

   //addBookToLibrary(myLibrary, &used, enterBook());
   //                 initBook("Winnie the Pooh", "A. A. Milnes", 0.75, "Library"));
   //addBookToLibrary(myLibrary, &used, enterBook());
   //                 initBook("Donald Duck", "Carl Barks", 0.75, "Library"));

   //printLibrary(myLibrary, used);

   do {
       printf("avq>");
       scanf(" %c%*c", &cmd);

       switch (cmd) {
           case 'a' : addBookToLibrary(myLibrary, &used, enterBook()); break;
           case 'v' : printLibrary(myLibrary, used); break;
           case 'q' : break;
           default  : printf("Unknown command, please use a/v/q!\n");
       }
   } while (cmd!='q');
 
   printf("Library done, bye!\n");
}