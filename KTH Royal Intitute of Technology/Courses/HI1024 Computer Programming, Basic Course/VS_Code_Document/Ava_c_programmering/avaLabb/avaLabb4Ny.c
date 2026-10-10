#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>

struct account
{
    char username[50];
    char password[100];
};

int passwordIsLongEnough(char* passLen)
{
    if (strlen(passLen) < 8) return 0;
    else return 1;
}

int passwordContainDigit(char *passDigits)
{
    for (int i = 0; passDigits[i] != '\0'; i++)
        if (isdigit(passDigits[i]) >= 1)
            return 1;
    return 0;
}

int passwordHasMixedCase(char *passMixed)
{
    int lower = 0, upper = 0;
    for (int i = 0; passMixed[i] != '\0'; i++)
    {
        if (islower(passMixed[i]) > 0) lower++;
        if (isupper(passMixed[i]) > 0) upper++;
    }
    
    if (lower > 0 && upper > 0) return 1;
    return 0;
}

int passwordIsDifferent(char *userDiff, char *passDiff)
{
    if (strcmp(userDiff, passDiff) == 0) return 0;
    else return 1;
    
}

int ifSafePassword(char username[], char password[])
{
    if (passwordIsLongEnough(password) == 0)
        printf("Password it too short. Please enter at least 8 characters.\n");

    if (passwordContainDigit(password) == 0)
        printf("Password does not contain digit\n");
    
    if (passwordHasMixedCase(password) == 0)
        printf("Password need to have both big letters and small letters.\n");

    if (passwordIsDifferent(username, password) == 0)
        printf("Password can not be the same as the username.\n");
    
    if (passwordIsLongEnough(password) == 1 && passwordContainDigit(password) == 1 && passwordHasMixedCase(password) == 1 && passwordIsDifferent(username, password) == 1)
    {
        printf("This is a safe password.\n");
        return 1;
    }
    return 0;
}

int main(void)
{
    int amount, loop = 0;
    struct account* userAccounts;
    while (loop != 1)
    {
        printf("\n");
        printf("How many user accounts? ");
        scanf("%d", &amount);
        userAccounts = (struct account*)malloc(sizeof(struct account) *amount);             // Vad gör den här?
        if (userAccounts == NULL) printf("This data is not available. Could not allocate %d elements", amount);
        else loop = 1;
    }

    char passwordConfirm[100] = {0};
    for (int i = 0; i < amount; i++)                               // Jag skriver "int i" innan för for-loopen istället för utanför 
    {
        passwordConfirm[0] = '\0';
        printf("Enter a username : ");
        scanf("%s", userAccounts[i].username);
        while (isdigit(userAccounts[i].username[0]) != 0)           // Kontrollerar första bokstaven i username
        {
            printf("Usernames can not start with a digit!\n\n");
            printf("Enter a new username : ");
            scanf("%s", userAccounts[i].username);
        }

        if (strcmp(userAccounts[i].username, "admin") != 0)
        {
            printf("Enter a password : ");
            while (strcmp(userAccounts[i].password, passwordConfirm) != 0)
            {
                scanf("%s", userAccounts[i].password);
                while (ifSafePassword(userAccounts[i].username, userAccounts[i].password) == 0)
                {
                    printf("\n\nEnter a new password : ");
                    scanf("%s", userAccounts[i].password);
                }

                printf("Confirm by entering it again : ");
                scanf("%s", passwordConfirm);

                if (strcmp(userAccounts[i].password, passwordConfirm) == 0)
                {
                    printf("\n\nPassword [%s] is now associated with user: [%s] \n\n\n", userAccounts[i].password, userAccounts[i].username);
                }
                if (strcmp(userAccounts[i].password, passwordConfirm) != 0)
                {
                    passwordConfirm[0] = '\0';
                    printf("This password differs from the one you entered. Password not confirmed.\n\nEnter a new password : ");
                }
            }
        }
        else
        {
            strcpy(userAccounts[i].password, "adm0000");
            printf("Password [adm0000] is now associated with user [admin].\n\n\n");
        }
    }

    if (amount != 0) printf("Here are all users and passwords:\n");
    for (int i = 0; i < amount; i++)
    {
        printf(" #%d", i+1);
        printf(" %s\t\t", userAccounts[i].username);
        printf(" %s\n", userAccounts[i].password);
    }
    free(userAccounts);                                                 // Vad gör den här?
    printf("\n");
    return 0;
}