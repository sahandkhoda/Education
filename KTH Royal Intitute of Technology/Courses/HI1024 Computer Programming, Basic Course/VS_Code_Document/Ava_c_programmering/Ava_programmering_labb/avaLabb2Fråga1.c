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
	int i;
	for (i = 0; passDigits[i] != '\0'; i++)
	{
		if (isdigit(passDigits[i]) >= 1)
		{
			return 1;
		}
	}
	return 0;
}

int passwordHasMixedCase(char *passMixed)
{
	int i, lower = 0, upper = 0;
	for (i = 0; passMixed[i] != '\0'; i++)
	{
		if (islower(passMixed[i]) > 0)
		{
			lower++;
		}
		if (isupper(passMixed[i]) > 0)
		{
			upper++;
		}
	}
	if (lower > 0 && upper > 0)
	{
		return 1;
	}
	return 0;
}

int ifSafePassword(char password[])
{
	if (passwordIsLongEnough(password) == 0)
		printf("Password it too short. Please enter at least 8 characters.\n");

	if (passwordContainDigit(password) == 0)
	printf("Password does not contain digit\n");

	if( passwordHasMixedCase(password) == 0)
	printf("Password need to have both big letters and small letters.\n");

    if (passwordIsLongEnough(password) == 1 && passwordContainDigit(password) == 1 && passwordHasMixedCase(password) == 1)
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
		printf("How many user accounts? ");
		scanf("%d", &amount);
		userAccounts = (struct account*)malloc(sizeof(struct account) * amount);
		
        if (userAccounts == NULL) printf("This data is not available. Could not allocate %d elements", amount);
		else loop = 1;
	}

	char passwordConfirm[100];
	int i;
	for (i = 0; i < amount; i++)
	{
		passwordConfirm[0] = '\0';

		printf("Enter a username : ");
		scanf("%s", userAccounts[i].username);
		printf("\n");

		char admin[50]={"admin"}, adminpassword[100]={"adm000"};
		if (strcmp(userAccounts[i].username, admin)==0)
			{
				strcpy(userAccounts[i].password, adminpassword);
				printf("Userpassword is : %s\n\n", userAccounts[i].password);
			}
		else
		{
			printf("Enter a password : ");
			while (strcmp(userAccounts[i].password, passwordConfirm) != 0)
			{
				scanf("%s", userAccounts[i].password);
				while (ifSafePassword(userAccounts[i].password) == 0)
				{
					printf("\nEnter a new password : ");
					scanf("%s", userAccounts[i].password);
				}
				printf("Confirm by entering again.\n");
				printf("Confirm password : ");
				scanf("%s", passwordConfirm);
				if (strcmp(userAccounts[i].password, passwordConfirm) == 0)
				{
					printf("\n\nPassword is now associated with user: %s. \n\n\n", userAccounts[i].username);
				}
				if (strcmp(userAccounts[i].password, passwordConfirm) != 0)
				{
					passwordConfirm[0] = '\0';
					printf("This password differs from the one you entered. Password not confirmed, \n Enter a new password:");
				}
			}
		}
	}


	if (amount != 0)
		printf("\nHere are all users and passwords:\n");
	for (i = 0; i < amount; i++)
	{
		printf("%s\t\t", userAccounts[i].username);
		printf("%s\n", userAccounts[i].password);
	}
	free(userAccounts);
	return 0;
}