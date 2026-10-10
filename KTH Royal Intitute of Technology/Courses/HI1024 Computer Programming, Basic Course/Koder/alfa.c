#include <stdio.h>
#include <string.h>
#define SIZE 10

void viewBoard(char aB[][SIZE], int rows){
   printf("  0 1 2 3 4 5 6 7 8 9\n");
   for (int row=0; row<rows; row++){
       printf("%c ",'A'+row);
       for (int col=0; col<SIZE; col++)
           printf("%c ", aB[row][col]);
       printf("\n");
   }
}

int main(void){
   char board[SIZE][SIZE]=
    {{'+','+','+','+','+','+','+','+','+','+'},
     {'+','+','+','+','+','+','+','+','+','+'},
     {'+','+','+','+','+','+','+','+','+','+'},
     {'+','+','+','+','+','+','+','+','+','+'},
     {'+','S','C','R','A','B','B','L','E','+'},
     {'+','+','+','+','+','+','+','+','+','+'},
     {'+','+','+','+','+','+','+','+','+','+'},
     {'+','+','+','+','+','+','+','+','+','+'},
     {'+','+','+','+','+','+','+','+','+','+'},
     {'+','+','+','+','+','+','+','+','+','+'}};

    char r='e';
    char c='1';
    char d='v';
    char word[]="SPORT";

   printf("Scrabble 0.1\n");

   while (1){
      viewBoard(board, SIZE);       //     Visa spelplanen

      printf("RowletterColDigitDirecton WORD ? ");
      scanf(" %c%c%c %s",&r,&c,&d,word);

      switch (d) {                         //     Lägg in ord
         case 'v': 
            for(int row=(r-'a'); row<r-'a'+strlen(word); row++)
                board[row][c-'0']=word[row-(r-'a')];
            break;

         case '>':
            for(int col=(c-'0'); col<c-'0'+strlen(word); col++)
                board[r-'a'][col]=word[col-(c-'0')];
            break;

         default : printf("Illegal direction!\n");
      }

   }
   printf("Scrabble done. bye!\n");
}