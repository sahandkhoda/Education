#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#define MAXACCOUNT 1000
#define MAXNAME 15
#define ACCOUNTNUMBER 6
#define MAXFILE 100

typedef struct{
    int number;
    char name[MAXNAME+1];
    int value; 
}Bank;

// Account list package

void printAccount(Bank *pAccount);

void registerAccount(Bank aAccount[], int *pused);

void saveBank(Bank aAccount[], int used, char input[]);

void loadBank(Bank aAccount[], int *pused, char input[]);

void printBank(Bank aAccount[], int *pused);

// Search Package

void searchAccnmr(Bank aAccount[], int *pused);

void searchStr(Bank aAccount[], int *pused);

void searchVal(Bank aAccount[], int *pused);

void searchAcc(Bank aAccount[], int *pused);

// Sort Package

void sortAccnmr(Bank aAccount[], int *pused);

void sortAccname(Bank aAccount[], int *pused);

void sortAccvalue(Bank aAccount[], int *pused);

void sortBank(Bank aAccount[], int *pused);

// Change value package

void changeValaccnmr(Bank aAccount[], int *pused);

void changeValue(Bank aAccount[], int *pused);

// Remove Package

void removeAccnmr(Bank aAccount[], int *pused);

void remAcc(Bank aAccount[], int *pused);

int main(void){
    
    char choice;
    Bank account[MAXACCOUNT];
    int used = 0;
    char text[MAXFILE];
    //Bank account1=initAccount(1, "AFSHIN FARDI", 1900);
    

    printf("Bank start\n");

    printf("Skriv ett filnamn du vill oppna: ");
    scanf("%s", text);

    loadBank(account, &used, text);

    do{
        printf("(1) Registera nya konton\n");
        printf("(2) Skriva ut alla konton\n");
        printf("(3) Sortera konton\n");
        printf("(4) Soka efter konto\n");
        printf("(5) Andra saldot pa ett konto\n");
        printf("(6) Avregistrera ett konto\n");
        printf("(7) Avsluta\n");
        printf("\n");
        printf("Ange val: ");
        
        scanf(" %c", &choice); 

        switch(choice){
            case '1': registerAccount(account, &used); break;
            case '2': printBank(account, &used); break;
            case '3': sortBank(account, &used); break;
            case '4': searchAcc(account, &used); break;
            case '5': changeValue(account, &used); break;
            case '6': remAcc(account, &used); break;
            case '7': break;

            default: printf("Ange ett giltig val\n");
        }
    }while(choice!='7');

    saveBank(account, used, text);

    printf("Bank done!\n");

    return 0;
}   

Bank initAccount(int number, char name[], int value){
    Bank newAccount;
    newAccount.number = number;
    strcpy(newAccount.name, name);
    newAccount.value = value;

    return newAccount;
}

void printAccount(Bank *pAccount){
    printf("%06d   %-15s%7d\n", pAccount->number, pAccount->name, pAccount->value);
}

void registerAccount(Bank aAccount[], int *pused){
    int accnmr;
    int check;
    char input[ACCOUNTNUMBER+1];
    char namein[MAXNAME+1];
    printf("Registrera nya konton\n");
    if(*pused<MAXACCOUNT){
        do{
            printf("Ange Kontonummer (q for att avsluta) :");
            scanf("%s", input);
            accnmr = atoi(input);
            for(int i=0; i<(*pused+1); i++){
                if(accnmr==aAccount[i].number){
                    check = accnmr;
                }
            }
            if((accnmr==check) && input[0]!='q'){
                printf("Kontonummret finns redan\n");
            }else if(input[0]!='q'){
                aAccount[*pused].value = 0;
                aAccount[*pused].number=accnmr;
                printf("Ange agare: ");
                scanf(" %[^'\n']%*c", namein);
                strcpy(aAccount[*pused].name, namein);
                *pused=*pused+1;
            }
        }while(input[0]!='q');
    }else{
        printf("Max Antal Konto har natts!\n");
    }
}

void saveBank(Bank aAccount[], int used, char input[]){
    FILE *pBF;
    printf("(Saving ");
    if ((pBF=fopen(input, "w"))){
        for(int b=0; b<(used); b++){
            fprintf(pBF, "%06d\n", aAccount[b].number);
            fprintf(pBF, "%s\n", aAccount[b].name);
            fprintf(pBF, "%d\n", aAccount[b].value);
            printf("*");
        }
    }else{
        printf("ERR: could not create backup file!\n");
    }
    fclose(pBF);
    printf(")\n");
}

void printBank(Bank aAccount[], int *pused){
    printf("Alla konton\n");
    printf("Konto-nr   Agare        Saldo\n");
    printf("-------------------------------\n");

    for(int i=0; i<(*pused); i++){
        printAccount(&aAccount[i]);
    }
}

void searchAccnmr(Bank aAccount[], int *pused){
    int input;
    int check;
    printf("Ange kontonummer: ");
    scanf("%d", &input);
    for(int i=0; i<(*pused); i++){
        if(input==aAccount[i].number){
            printf("Konto-nr   Agare        Saldo\n");
            printf("-------------------------------\n");
            printAccount(&aAccount[i]);
            check = input;
        }
        
    }
    if(input!=check){
            printf("Kontonummret saknas\n");
        }
}

void searchStr(Bank aAccount[], int *pused){
    char input[MAXNAME];
    char *check;
    printf("Ange sokstrang: ");
    scanf("%s", input);
    printf("Konto-nr   Agare        Saldo\n");
    printf("-------------------------------\n");
    for(int i=0; i<(*pused); i++){
       check = strstr(aAccount[i].name, input);
       if(check){
            printAccount(&aAccount[i]);
       }
    }
}

void searchVal(Bank aAccount[], int *pused){
    int min;
    int max;
    printf("Ange min: ");
    scanf("%d", &min);
    printf("Ange max: ");
    scanf("%d", &max);
    printf("Konto-nr   Agare        Saldo\n");
    printf("-------------------------------\n");
    for(int i=0; i<(*pused); i++){
        if((aAccount[i].value>=min) && (aAccount[i].value<=max)){
            printAccount(&aAccount[i]);
        }
    }
}

void searchAcc(Bank aAccount[], int *pused){
    char choice;
    int used = *pused;

    do{
        printf("(1) konto-nr\n");
        printf("(2) agare\n");
        printf("(3) saldo\n");
        printf("(4) huvudmeny\n");
        printf("Ange val: ");
        scanf(" %c", &choice);

        switch(choice){
            case '1': searchAccnmr(aAccount, &used); break;
            case '2': searchStr(aAccount, &used); break;
            case '3': searchVal(aAccount, &used); break;
            case '4': break;
            default: printf("Ange en giltig val\n");
        }
    }while(choice!='4');
}

void sortAccnmr(Bank aAccount[], int *pused){
    Bank inter;
    int used = *pused;
    for(int i=0; i<(*pused); i++){
        for(int j=(i+1); j<(*pused); j++){
            if(aAccount[i].number>aAccount[j].number){
                inter = aAccount[i];
                aAccount[i] = aAccount[j];
                aAccount[j] = inter;
            }
        }
    }
    printBank(aAccount, &used);
}

void loadBank(Bank aAccount[], int *pused, char input[]){
    FILE *pBF;
    printf("(Loading ");
    if((pBF=fopen(input, "r"))){
        while (fscanf(pBF, "%d%*c", &aAccount[*pused].number) == 1){
            fscanf(pBF, "%[^'\n']%*c", aAccount[*pused].name);
            fscanf(pBF, "%d%*c", &aAccount[(*pused)++].value);
            printf("*");
        
        }
    } else{
        printf("ERR: could not read backup file!\n");
    }
    fclose(pBF);
    printf(")\n");
}

void sortAccname(Bank aAccount[], int *pused){
    Bank inter;
    char space[]=" ";
    int used = *pused;
    char strnmr[MAXNAME+1];
    char str[MAXACCOUNT+1][MAXNAME+1];
    for(int k=0; k<3; k++){
        for(int i=0; i<(*pused); i++){
            strcpy(strnmr, aAccount[i].name);
            char *token=strtok(strnmr, space);
            token=strtok(NULL, space);
            strcpy(str[i], token);
        }
    
        for(int j=0; j<(*pused); j++){
            for(int b=j+1; b<(*pused); b++){

                if(strcmp(str[j], str[b])>0){
                    inter = aAccount[j];
                    aAccount[j] = aAccount[b];
                    aAccount[b] = inter;
                    
                    }
                }
            }
    }
    printBank(aAccount, &used);
    
}

void sortAccvalue(Bank aAccount[], int *pused){
    Bank inter;
    int used = *pused;
    for(int i=0; i<(*pused); i++){
        for(int j=i+1; j<(*pused); j++){
            if(aAccount[i].value>aAccount[j].value){
                inter = aAccount[i];
                aAccount[i] = aAccount[j];
                aAccount[j] = inter;
            }
        }
    }
    printBank(aAccount, &used);
}

void sortBank(Bank aAccount[], int *pused){
    int choice;
    int used = *pused;
    printf("Vill du sortera efter konto-nr (1), agare (2) eller saldo (3): ");
    scanf("%d", &choice);

    switch(choice){
        case 1: sortAccnmr(aAccount, &used); break;
        case 2: sortAccname(aAccount, &used); break;
        case 3: sortAccvalue(aAccount, &used); break;

        default: printf("En giltig val valdes ej\n");
    }
}

void changeValaccnmr(Bank aAccount[], int *pused){
    int input;
    int check;
    int choice;
    int val;
    printf("Ange kontonummer: ");
    scanf("%d", &input);
    for(int i=0; i<(*pused); i++){
        if(input==aAccount[i].number){
            printf("Vill du gora en insattning (1) eller uttag (2): ");
            scanf("%d", &choice);
            switch(choice){
                case 1: printf("Ange belopp: "); scanf("%d", &val); aAccount[i].value = aAccount[i].value + val; break;
                case 2: printf("Ange belopp: "); scanf("%d", &val); 
                    if(aAccount[i].value>=val)
                        aAccount[i].value = aAccount[i].value - val; 
                    else 
                        printf("Pengar saknas!\n"); break;
                default: printf("Ange ett giltig val\n");
            }
            check = input;
        }
        
    }
    if(input!=check){
            printf("Kontonummret saknas\n");
        }
        
}

void changeValue(Bank aAccount[], int *pused){
    int scan;
    int used = *pused;
    printf("Andra saldo\n");
    printf("Vill du ange konto-nr (1) eller soka pa agare (2) eller (3) for huvudmeny: ");
    scanf("%d", &scan);
    switch(scan){
        case 1: changeValaccnmr(aAccount, &used); break;
        case 2: searchStr(aAccount, &used); changeValaccnmr(aAccount, &used); break;
        case 3: break;
        default: printf("Ingen gilitg val valdes\n");
    }

} 

void removeAccnmr(Bank aAccount[], int *pused){

    int input;
    int check;
    Bank tmp;
    printf("Ange kontonummer: ");
    scanf("%d", &input);
    for(int i=0; i<(*pused); i++){
        if(input==aAccount[i].number){
            if(aAccount[i].value==0){
                tmp = aAccount[(*pused-1)];
                aAccount[(*pused-1)] = aAccount[i];
                aAccount[i] = tmp;
                *pused = (*pused-1);
                check = input;
            } else
                printf("Saldo ar inte 0!\n");
        }
        check = input;
    }
    if(input!=check){
            printf("Kontonummret saknas\n");
        }
}

void remAcc(Bank aAccount[], int *pused){
    int input;
    printf("Avregistrera\n");
    printf("Ange kontonummer (1) eller soka pa agare (2): ");
    scanf("%d", &input);
    if(input==1){
        removeAccnmr(aAccount, &*pused);
    }else if(input==2){
        searchStr(aAccount, &*pused);
        removeAccnmr(aAccount, &*pused);
    }else
        printf("Giltig val angavs ej\n");
    
}