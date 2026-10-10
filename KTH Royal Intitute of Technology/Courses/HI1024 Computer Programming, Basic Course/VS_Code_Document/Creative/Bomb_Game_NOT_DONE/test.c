#include <stdio.h>
#define ROWS 5
#define COLUMNS 5
#define MAXCHAR 100
#define BOMBS 3

int main(void)
{
    printf("\n");
    printf("Welcome to Bomb Board 1.0.\n");

    char board[ROWS][COLUMNS];
    for (int i = 0; i < ROWS; i++)
    {
        for (int j = 0; j < COLUMNS; j++)
        {
            board[i][j] = '+';
            printf("%c ", board[i][j]);
        }
        printf("\n");
    }

    printf("Enter locations of %d BOMBS (PLAYER 1).\n", BOMBS);
    char bomb[ROWS][COLUMNS];
    int rowBOMB[BOMBS], columnBOMB[BOMBS];
    for (int i = 0; i < BOMBS; i++)
    {
        printf("-- Bomb #%d --\n", i+1);
        printf("   Row (1-%d) : ", ROWS);
            scanf("%d", &rowBOMB[i]);
        printf("Column (1-%d) : ", COLUMNS);
            scanf("%d", &columnBOMB[i]);
        bomb[rowBOMB[i]-1][columnBOMB[i]-1] = '*';
    }
    printf("\n");
    printf("Bomb locations\n");
    for (int i = 0; i < BOMBS; i++) printf(" Bomb #%d : (%d,%d)\n", i+1, rowBOMB[i], columnBOMB[i]);

    printf("\n");
    printf("Enter guesses of %d BOMBS (PLAYER 2).\n", BOMBS);
    int rowGUESS[BOMBS], columnGUESS[BOMBS];
        for (int i = 0; i < BOMBS; i++)
    {
        printf("-- Guess #%d --\n", i+1);
        printf("   Row (1-%d) : ", ROWS);
            scanf("%d", &rowGUESS[i]);
        printf("Column (1-%d) : ", COLUMNS);
            scanf("%d", &columnGUESS[i]);
    }
    printf("\n");
    printf("The guesses\n");
    for (int i = 0; i < BOMBS; i++) printf(" Guess #%d : (%d,%d)\n", i+1, rowGUESS[i], columnGUESS[i]);

    printf("\n");
    for (int i = 0; i < ROWS; i++)
    {
        for (int j = 0; j < COLUMNS; j++)
        {
            if ( (rowBOMB[i]==rowGUESS[i]) && (columnBOMB[j] == columnGUESS[j]) )
            {
                printf("MATCH at (%d,%d)\n", rowBOMB[i], columnBOMB[j]);
            }
        }
    }
    

    return 0;
}