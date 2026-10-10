#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#define MAXKONTO 1000
#define FILNAMN  100
#define MAXNAME  15
#define SIFFROR  6

typedef struct
{
    int  kontonummer;
    char agare[(2*MAXNAME)+2];                      // Ägarens hela namn med maximalt 32 karaktärer (inklusive mellanslag och NULL)
    char fornamn  [MAXNAME+1];                          // 16 karaktärer (inklusive NULL)
    char efternamn[MAXNAME+1];                          // 16 karaktärer (inklusive NULL)
    int  saldo;
} Register;

void upperCase(char theString[]);
void huvudMeny();

void openFILE       (Register mittKonto[], int *mittIndex, char filnamn[]);
void saveFILE       (Register mittKonto[], int *mittIndex, char filnamn[]);

void registrera     (Register mittKonto[], int *mittIndex);
    int  regKontoNr         (Register ettKonto[], int *ettIndex, int *pAvsluta);
    void regAgare           (Register ettKonto[], int *ettIndex);
    void regSaldo           (Register ettKonto[], int *ettIndex);
        
void visa           (Register myAccount[], int *myIndex);
    void visaMeny();

void sortera        (Register myAccount[], int *myIndex);
    void sorteraMeny();
    void sorteraKontoNr     (Register anAccount[], int *anIndex);
    void sorteraAgare       (Register anAccount[], int *anIndex);
    void sorteraSaldo       (Register anAccount[], int *anIndex);

void soka           (Register mittKonto[], int *mittIndex, int *mittElement, Register minLista[]);
    void sokaMeny();
    void sokaKontoNr        (Register ettKonto[], int *ettIndex, int *ettElement, Register enLista[]);
    void sokaAgare          (Register ettKonto[], int *ettIndex, int *ettElement, Register enLista[]);
    void sokaSaldo          (Register ettKonto[], int *ettIndex);

void andraSaldo     (Register mittKonto[], int *mittIndex, int *mittElement, Register minLista[]);
    void andraSaldoMeny();
    void andraSaldoKontoNr  (Register ettKonto[], int *ettIndex, int *ettElement, Register enLista[]);
    void andraSaldoAgare    (Register ettKonto[], int *ettIndex, int *ettElement, Register enLista[]);

void avregistrera   (Register mittKonto[], int *mittIndex, int *mittElement, Register minLista[]);
    void avregistreraMeny();
    void avregKontoNr       (Register ettKonto[], int *ettIndex);
    void avregAgare         (Register ettKonto[], int *ettIndex, int *ettElement, Register enLista[]);

void statistik      (Register mittKonto[], int *mittIndex);
    void averageFunction    (Register ettKonto[], int *ettIndex);
    void meanFunction       (Register ettKonto[], int *ettIndex, Register tempKonto[]);
    void typevalueFunction  (Register ettKonto[], int *ettIndex, Register tempKonto[]);

void overforing     (Register mittKonto[], int *mittIndex);

int main(void)
{
    Register bankkonto[MAXKONTO];                                       // Alla bankkonton
    int antalBankkonton, *bankkontoIndex=&antalBankkonton;              // Antal bankkonton (bankkontonummer)
    Register lista[MAXKONTO];                                           // Temporär lista (array) med bankonton
    int listaElement=-1, *element=&listaElement;                        // Antal element i lista (bankkontonummer)
    
    printf("\n");
    printf("======= MINA BANKKONTON =======\n\n");
    
    // Öppnar fil - eventuellt med redan registrerade bankkonton
    char textfil[FILNAMN+1];
    printf("Skriv namnet pa filen som du vill oppna : ");
    scanf("%s", &textfil);
    openFILE(bankkonto, bankkontoIndex, textfil);
    
    // Menyval
    int choice=0;
    do
    {
        huvudMeny();
        printf("Ange val : ");
        scanf("%d", &choice);
        switch (choice)
        {
            case 1: registrera      (bankkonto, bankkontoIndex); break;
            case 2: visa            (bankkonto, bankkontoIndex); break;
            case 3: sortera         (bankkonto, bankkontoIndex); break;
            case 4: soka            (bankkonto, bankkontoIndex, element, lista); break;
            case 5: andraSaldo      (bankkonto, bankkontoIndex, element, lista); break;
            case 6: avregistrera    (bankkonto, bankkontoIndex, element, lista); break;
            case 7: statistik       (bankkonto, bankkontoIndex); break;
            case 8: overforing      (bankkonto, bankkontoIndex); break;
            case 9: break;
            default: printf("- Inte ett giltigt val!\n"); break;
        }
    } while (choice!=9);
    printf("\n");
    saveFILE(bankkonto, bankkontoIndex, textfil);
    printf("\n");
    printf("=== Avslutar MINA BANKKONTON ===\n\n");
    return 0;
}

void huvudMeny()
{
    printf("\n");
    printf("_____________________________\n\n");
    printf("          HUVUDMENY\n");
    printf("_____________________________\n\n");
    printf("(1) Registrera nya konton       \n");
    printf("(2) Skriva ut alla konton       \n");
    printf("(3) Sortera konton              \n");
    printf("(4) Soka efter konto            \n");
    printf("(5) Andra saldot pa ett konto   \n");
    printf("(6) Avregistrera ett konto      \n");
    printf("(7) Statistik                   \n");
    printf("(8) Overforing                  \n");
    printf("(9) Avsluta                     \n");
    printf("______________________________\n");
    printf("\n");
}
void upperCase(char theString[])
{
    // Konverterar strängen till stora bokstäver
    for (int i = 0; i < strlen(theString); i++)
        if ('a'<=theString[i] && theString[i]<='z')
            theString[i] = theString[i]-'a'+'A';
}

void openFILE       (Register mittKonto[], int *mittIndex, char filnamn[])
{
    FILE *pFILE;
    if(pFILE=fopen(filnamn, "r"))
    {
        //fscanf(pFILE, "Antal bankkonton : %d\n", *mittIndex);
        while (fscanf(pFILE, "%d%*c", &mittKonto[*mittIndex].kontonummer)==1)
        {
            fscanf(pFILE, "%[^'\n']%*c", mittKonto[*mittIndex].agare);
            fscanf(pFILE, "%d%*c", &mittKonto[(*mittIndex)++].saldo);
        }
    } else printf("ERROR: Kunde inte lasa filen!\n");
    fclose(pFILE);

}
void saveFILE       (Register mittKonto[], int *mittIndex, char filnamn[])
{
    FILE *pFILE;
    printf("\n");
    printf("Sparar... KLART\n");
    if (pFILE=fopen(filnamn, "w"))
    {
        //fprintf(pFILE, "Antal bankkonton : %d\n", *mittIndex);
        for (int i = 0; i < *mittIndex; i++)
        {
            fprintf(pFILE, "%06d\n", mittKonto[i].kontonummer);
            fprintf(pFILE, "%s\n", mittKonto[i].agare);
            fprintf(pFILE, "%d\n", mittKonto[i].saldo);
        }
    } else printf("ERR: could not create backup file!\n");
    fclose(pFILE);
}

void registrera     (Register mittKonto[], int *mittIndex)
{
    printf("\n");
    printf("Registrera nya konton\n\n");
    int quit=0, *avsluta=&quit;
    while (*mittIndex<MAXKONTO)
    {
        regKontoNr  (mittKonto, mittIndex, avsluta); if (*avsluta!=0) return;
        regAgare    (mittKonto, mittIndex);
        regSaldo    (mittKonto, mittIndex);
        printf("\n");
    }
    printf("FULLT REGISTER! Kan ej registrera fler bankkonton.\n");
}
    int  regKontoNr         (Register ettKonto[], int *ettIndex, int *pAvsluta)
    {
        int villkor;
        do
        {
            villkor=1;
            char input[SIFFROR+1];                                      // OBS! NULL-karaktär
            printf(" Kontonummer ('q' for att avsluta) : ");
            scanf("%s", &input);
            
            if (strcmp(input, "q")==0)                                  // Avsluta med 'q'
            {
                *pAvsluta=1;
                return *pAvsluta;
            }
            
            if (strlen(input)!=SIFFROR)                                 // Sexsiffrigt kontonummer
            {
                printf(" - Ange ett sexsiffrigt kontonummer!\n\n");
                villkor=0;
                continue;                                                   // Hoppar över resterande satser
            }

            for (int i = 0; i < SIFFROR; i++)                           // Kontrollerar om input innehåller exakt 6 "char-siffror"
            {
                if (isdigit(input[i])==0)                                   // Om karaktären inte är en siffra, skriv om hela kontonumret.
                {
                    printf(" - Ange ett sexsiffrigt kontonummer!\n\n");
                    villkor=0;
                    break;
                }
            } if (villkor==0) continue;                                     // Hoppar över resterande satser
            
            int accountnumber=atoi(input);                              // Konverterar från "char-siffror" till "int-siffror"

            for (int i = 0; i < *ettIndex; i++)                         // Kontrollerar om kontonumret redan existerar.
            {
                if (accountnumber==ettKonto[i].kontonummer)
                {
                    printf("-- Kontonumret finns redan --\n\n");
                    villkor=0;
                    break;
                }
            } if (villkor==0) continue;                                     // Hoppar över resterande satser
            
            ettKonto[*ettIndex].kontonummer=accountnumber;

        } while (villkor!=1);
    }
    void regAgare           (Register ettKonto[], int *ettIndex)
    {
        int villkor;
        do
        {
            villkor=1;
            char namn[100]="\0", tempFornamn[100]="\0", tempEfternamn[100]="\0";        // Temporära namn (nollställda)
            printf(" Agare : ");
            scanf(" %[^\n]%*c", &namn);
            upperCase(namn);                                                            // Konverterar till stora bokstäver

            // Kontrollerar om namnet innehåller enbart karaktärer
            for (int i = 0; i < strlen(namn); i++)                  
            {
                if (isdigit(namn[i]))                               // Om siffra (ej karaktär), skriv om hela namnet.
                {
                    printf(" - Ange endast giltiga karaktarer!\n");
                    villkor=0;
                    break;
                }
            } if (villkor==0) continue;                             // Hoppar över resterande satser
            
            // Bygger på för- respektive efternamnet beroende på antalet mellanslag
            int space=0, j=0, k=0;
            for (int i = 0; i < strlen(namn); i++)
            {
                if (isspace(namn[i]))                                // Om karaktär är mellanslag, öka space med ett.
                {
                    space++;
                    continue;                                               // Hoppar över resterande satser, så att inte mellanslaget räknas med i efternamnet.
                }
                
                if (space==0) tempFornamn[j++]   = namn[i];             // Innan mellanslag, bygg på förnamn.
                if (space==1) tempEfternamn[k++] = namn[i];             // Efter mellanslag, bygg på efternamn. 
                if (space>1)                                            // Om fler än ett mellanslag, bryt ut ur for-loop.
                {
                    printf(" - Ange ETT for- och efternamn!\n");
                    villkor=0;
                    break;
                }
            } if (villkor==0) continue;                                 // Hoppar över resterande satser

            // Kontrollerar längden på namnen
            if (strlen(tempFornamn)>MAXNAME && strlen(tempEfternamn)>MAXNAME)       
            {
                printf(" - Ange ett kortare for- och efternamn (max 15 karaktarer per namn)\n\n");
                villkor=0;
                continue;
            } else
            {
                if (strlen(tempFornamn)==0 || strlen(tempFornamn)>MAXNAME)              // Om förnamnet är för kort/långt...
                {
                    printf(" - Ange ett giltigt fornamn (0-15 karaktarer)\n\n");
                    villkor=0;
                    continue;
                }
                    
                if (strlen(tempEfternamn)==0 || strlen(tempEfternamn)>MAXNAME)          // Om efternamnet är för kort/långt...
                {
                    printf(" - Ange ett giltigt efternamn (0-15 karaktarer)\n\n");
                    villkor=0;
                    continue;
                }
                
            } if (villkor==0) continue;                                                 // Hoppar över resterande satser

            // Ansätter respektive namn i struct ettKonto
            strcpy(ettKonto[*ettIndex].agare, namn);
            strcpy(ettKonto[*ettIndex].fornamn, tempFornamn);
            strcpy(ettKonto[*ettIndex].efternamn, tempEfternamn);

        } while (villkor!=1);
    }
    void regSaldo           (Register ettKonto[], int *ettIndex)
    {
        ettKonto[(*ettIndex)++].saldo = 0;
    }

void visa           (Register myAccount[], int *myIndex)
{
    printf("\n");
    printf("Alla konton\n\n");
    visaMeny();
    for (int i = 0; i < *myIndex; i++)
        printf("#%06d         %-34s %d\n\n", myAccount[i].kontonummer, myAccount[i].agare, myAccount[i].saldo);
    
    if (*myIndex==0) printf("- Inga registrerade bankkonton. Vanligen registrera.\n\n");
}
    void visaMeny()
    {
        printf("Konto-nr        Agare                              Saldo [kr]\n");
        printf("_____________________________________________________________\n\n");
    }

void sortera        (Register myAccount[], int *myIndex)
{
    if (*myIndex==0)              // Om inget konto är registrerat, återgå till huvudmenyn.
    {
        printf("\n");
        printf("- Inga registrerade bankkonton. Vanligen registrera.\n\n");
        return;
    }

    int input;
    sorteraMeny();
    do
    {
        printf("Ange val : ");
        scanf("%d", &input);
        switch (input)
        {
            case 1: sorteraKontoNr  (myAccount, myIndex); break;
            case 2: sorteraAgare    (myAccount, myIndex); break;
            case 3: sorteraSaldo    (myAccount, myIndex); break;
            case 4: return;  
            default: printf("- Inte ett giltigt val!\n"); break;
        }
    } while (input<0 || input>4);
}
    void sorteraMeny()
    {
        printf("\n");
        printf("Sortera konton\n\n");
        printf("Vill du sortera efter\n");
        printf(" (1) Konto-nr\n");
        printf(" (2) Agare\n");
        printf(" (3) Saldo\n");
        printf(" (4) Huvudmeny\n");
    }
    void sorteraKontoNr     (Register anAccount[], int *anIndex)
    {
        // Tillämpar "Bubble sort"
        for (int i = 0; i < *anIndex; i++)
            for (int j = i+1; j < *anIndex; j++)
                if (anAccount[i].kontonummer > anAccount[j].kontonummer)              // Om föregående kontonummer är större än nästföljande, byt plats på innehållen.
                {
                    Register tempBankkonto = anAccount[i];
                    anAccount[i] = anAccount[j];
                    anAccount[j] = tempBankkonto;
                }
    }
    void sorteraAgare       (Register anAccount[], int *anIndex)
    {
        // Bygger på för- respektive efternamn för varje konto eftersom vi kan ha läst in en fil!
        for (int i = 0; i < *anIndex; i++)
        {
            int space=0, k=0, l=0;
            char tempFornamn[100]="\0", tempEfternamn[100]="\0";                        // Temporära namn (nollställda)
            for (int j = 0; j < strlen(anAccount[i].agare); j++)
            {
                if (isspace(anAccount[i].agare[j])) space++;                            // Om karaktär är mellanslag, öka space med ett.
                else
                {
                    if (space==0) tempFornamn[k++]   = anAccount[i].agare[j];               // Innan mellanslag, bygg på förnamn.
                    if (space==1) tempEfternamn[l++] = anAccount[i].agare[j];               // Efter mellanslag, bygg på efternamn.
                }
            }

            // Ansätter respektive namn i struct anAccount
            strcpy(anAccount[i].fornamn, tempFornamn);
            strcpy(anAccount[i].efternamn, tempEfternamn);
        }

        // Tillämpar "Bubble sort"
        for (int i = 0; i < *anIndex; i++)
            for (int j = i+1; j < *anIndex; j++)
                if (strcmp(anAccount[i].efternamn, anAccount[j].efternamn) > 0)         // Om nästaföljande efternamn är "mindre" (ASCII-värde), byt plats på innehållen.
                {
                    Register tempBankkonto = anAccount[i];
                    anAccount[i] = anAccount[j];
                    anAccount[j] = tempBankkonto;
                }
    }
    void sorteraSaldo       (Register anAccount[], int *anIndex)
    {
        // Tillämpar "Bubble sort"
        for (int i = 0; i < *anIndex; i++)
            for (int j = i+1; j < *anIndex; j++)
                if (anAccount[i].saldo < anAccount[j].saldo)                            // Om nästföljande saldo är större än föregående, byt plats på innehållen.
                {
                    Register tempBankkonto = anAccount[i];
                    anAccount[i] = anAccount[j];
                    anAccount[j] = tempBankkonto;
                }
    }

void soka           (Register mittKonto[], int *mittIndex, int *mittElement, Register minLista[])
{
    if (*mittIndex==0)              // Om inget konto är registrerat, återgå till huvudmenyn.
    {
        printf("\n");
        printf("- Inga registrerade bankkonton. Vanligen registrera.\n\n");
        return;
    }

    int input;
    printf("\n");
    printf("Soka efter konton\n\n");
    do
    {
        sokaMeny();
        printf("Ange val : ");
        scanf("%d", &input);
        switch (input)
        {
            case 1: sokaKontoNr (mittKonto, mittIndex, mittElement, minLista); break;
            case 2: sokaAgare   (mittKonto, mittIndex, mittElement, minLista); break;
            case 3: sokaSaldo   (mittKonto, mittIndex);                        break;
            case 4: return;
            default: printf("- Inte ett giltigt val!\n\n");                    break;
        }
        printf("\n\n");
    } while (input!=4);
}
    void sokaMeny()
    {
        printf("Vad vill du soka efter?\n");
        printf(" (1) Konto-nr\n");
        printf(" (2) Agare\n");
        printf(" (3) Saldo\n");
        printf(" (4) Huvudmeny\n");
    }
    void sokaKontoNr        (Register ettKonto[], int *ettIndex, int *ettElement, Register enLista[])
    {
        
        for (int i = 0; i < *ettElement; i++)               // Nollställer struct (lista)
        {
            enLista[i].kontonummer=0;
            strcpy(enLista[i].agare, "\0");
            enLista[i].saldo=0;

        } *ettElement=-1;                                   // Återställer till ursprungligt värde (reset)

        int accountnumber, counter=0;
        printf("Ange kontonummer : ");
        scanf("%d", &accountnumber);
        printf("\n");
        visaMeny();
        for (int i = 0; i < *ettIndex; i++)                 // Kontrollerar om input matchar existerande kontonummer
        {
            if (ettKonto[i].kontonummer==accountnumber)
            {
                printf("#%06d         %-34s %0.1d\n\n\n", ettKonto[i].kontonummer, ettKonto[i].agare, ettKonto[i].saldo);
                *ettElement=i;
                break;                                          // Break ut så att programmet inte kör onödiga iterationer.
            }
        } if (*ettElement==-1) printf("- Kontonumret saknas!\n\n");
    }
    void sokaAgare          (Register ettKonto[], int *ettIndex, int *ettElement, Register enLista[])
    {
        for (int i = 0; i < *ettElement; i++)               // Nollställer struct (lista)
        {
            enLista[i].kontonummer=0;
            strcpy(enLista[i].agare, "\0");
            enLista[i].saldo=0;

        } *ettElement=-1;                                   // Återställer till ursprungligt värde (reset)

        int counter=0;
        char sokstrang[2*MAXNAME+2];                        // Hela namnet med maximalt 32 karaktärer (inklusive mellanslag och NULL)
        printf("Ange sokstrang : ");
        scanf(" %[^\n]%*c", &sokstrang);
        upperCase(sokstrang);                               // Konverterar sokstrang till stora bokstäver      
        printf("\n");
        visaMeny();
        for (int i = 0; i < *ettIndex; i++)                 // Kontrollerar om sokstrang matchar existerande agare
        {
            if (strstr(ettKonto[i].agare, sokstrang)!=0)
            {
                printf("#%06d         %-34s %0.1d\n\n", ettKonto[i].kontonummer, ettKonto[i].agare, ettKonto[i].saldo);
                enLista[counter++]=ettKonto[i];
                *ettElement=i;
            }
        } if (*ettElement==-1) printf("- Sokstrang saknas!\n\n");
        if (counter==1) *ettElement=0;                      // Om strängen bara hittas en gång i ettKonto, ansätt *ettElement som första index i enLista. 
    }
    void sokaSaldo          (Register ettKonto[], int *ettIndex)
    {
        int min, max, villkor=0;
        printf("\n");
        printf("Intervallgranser\n");
        do
        {
            printf(" Minimum : "); scanf("%d", &min);
            printf(" Maximum : "); scanf("%d", &max);
            if (min>max) printf(" - Ange giltiga invervallgranser!\n");
            printf("\n");
        } while (min>max);
        printf("Alla konton\n\n");
        visaMeny();
        for (int i = 0; i < *ettIndex; i++)
        {
            if (min<=ettKonto[i].saldo && ettKonto[i].saldo<=max)
            {
                printf("#%06d         %-34s %0.1d\n\n", ettKonto[i].kontonummer, ettKonto[i].agare, ettKonto[i].saldo);
                villkor=1;
            }
        } if (villkor==0) printf("- Inget saldo inom valt intervall.\n\n");
        printf("\n");
    }

void andraSaldo     (Register mittKonto[], int *mittIndex, int *mittElement, Register minLista[])
{
    if (*mittIndex==0)              // Om inget konto är registrerat, återgå till huvudmenyn.
    {
        printf("\n");
        printf("- Inga registrerade bankkonton. Vanligen registrera.\n\n");
        return;
    }

    int input;
    printf("\n");
    printf("Andra saldo\n\n");
    do
    {
        andraSaldoMeny();
        scanf("%d", &input);
        switch (input)
        {
            case 1: andraSaldoKontoNr (mittKonto, mittIndex, mittElement, minLista); break;
            case 2: andraSaldoAgare   (mittKonto, mittIndex, mittElement, minLista); break;
            case 3: return;
            default: printf("- Inte ett giltigt val!\n\n");                          break;
        }
    } while (input<1 || input>3);
}
    void andraSaldoMeny()
    {
        printf("Vad vill du ange?\n");
        printf(" (1) Konto-nr\n");
        printf(" (2) Agare\n");
        printf(" (3) Huvudmeny\n");
        printf("Ange val : ");
    }
    void andraSaldoKontoNr  (Register ettKonto[], int *ettIndex, int *ettElement, Register enLista[])
    {
        sokaKontoNr(ettKonto, ettIndex, ettElement, enLista);
        if (*ettElement==-1) return;                // Om *ettElement har sitt ursprungliga värde (-1), hittas inte det sökta kontonumret.
    
        // Insättning eller uttag?
        int input;
        do
        {
            printf("Vill du gora en insattning (1) eller ett uttag (2)? : ");
            scanf("%d", &input);
            if (input!=1 && input!=2) printf("- Inte ett giltigt val!\n\n");
        } while (input!=1 && input!=2);

        // Belopp
        int belopp, villkor;
        do
        {
            villkor=1;
            printf("Ange belopp [kr] : ");
            scanf("%d", &belopp);
            switch (input)
            {
                // Insättning
                case 1:
                {
                    ettKonto[*ettElement].saldo = ettKonto[*ettElement].saldo + belopp;
                    printf("Nytt saldo  [kr] : %d\n", ettKonto[*ettElement].saldo);
                    break;
                }

                // Uttag
                case 2:
                {
                    if (belopp>ettKonto[*ettElement].saldo)
                    {
                        printf("- Uttag nekat! Ange ett mindre belopp.\n\n");
                        villkor=0;
                        break;
                    }
                    ettKonto[*ettElement].saldo = ettKonto[*ettElement].saldo - belopp;
                    printf("Nytt saldo  [kr] : %d\n", ettKonto[*ettElement].saldo);
                    break;
                }
            }
        } while (villkor!=1);
    }
    void andraSaldoAgare    (Register ettKonto[], int *ettIndex, int *ettElement, Register enLista[])
    {
        sokaAgare(ettKonto, ettIndex, ettElement, enLista);
        int accountnumber, tempIndex, condition=0;
        if (*ettElement==-1) return;                                    // Om *ettElement har ursprungligt värde (-1), hittades inte sokstrang i sokaAgare.
        if (*ettElement==0)                                             // Ett konto i enLista
        {
            for (int i = 0; i < *ettIndex; i++)                             // Söker index (tempIndex) tillhörande konto i ettKonto som skall få ändrat saldo
            {
                if (ettKonto[i].kontonummer==enLista[*ettElement].kontonummer)  
                {
                    tempIndex=i;
                    break;                                                      // Hindrar programmet från att köra onödiga iterationer
                }
            }
        }
        if (*ettElement>0)                                              // Flera konton i enLista - välj en!
        {
            do
            {
                printf("Ange kontonummer : ");
                scanf("%d", &accountnumber);
                for (int i = 0; i <= *ettElement; i++)
                {
                    if (enLista[i].kontonummer==accountnumber)
                    {
                        condition=1;
                        break;                                      // Hindrar programmet från att köra onödiga iterationer
                    }
                } if (condition==0) printf("- Inte ett giltigt kontonummer!\n\n");
            } while (condition!=1);

            
            for (int i = 0; i < *ettIndex; i++)                             // Söker index (tempIndex) tillhörande konto som skall få ändrat saldo
            {
                if (ettKonto[i].kontonummer==accountnumber)                     // Eftersom accountnumber finns i enLista, så finns den per automatik i ettKonto.
                {
                    tempIndex=i;
                    break;                                                      // Hindrar programmet från att köra onödiga iterationer
                }
            }
        }

        // Insättning eller uttag?
        int input;
        do
        {
            printf("Vill du gora en insattning (1) eller ett uttag (2)? : ");
            scanf("%d", &input);
            if (input!=1 && input!=2) printf("- Inte ett giltigt val!\n\n");
        } while (input!=1 && input!=2);

        // Belopp
        int belopp, villkor;
        do
        {
            villkor=1;
            printf("Ange belopp [kr] : ");
            scanf("%d", &belopp);
            switch (input)
            {
                // Insättning
                case 1:
                {
                    ettKonto[tempIndex].saldo = ettKonto[tempIndex].saldo + belopp;
                    printf("Nytt saldo  [kr] : %d\n", ettKonto[tempIndex].saldo);
                    break;
                }

                // Uttag
                case 2:
                {
                    if (belopp>ettKonto[tempIndex].saldo)
                    {
                        printf("- Uttag nekat! Ange ett mindre belopp.\n\n");
                        villkor=0;
                        break;
                    }
                    ettKonto[tempIndex].saldo = ettKonto[tempIndex].saldo - belopp;
                    printf("Nytt saldo  [kr] : %d\n", ettKonto[tempIndex].saldo);
                    break;
                }
            }
        } while (villkor!=1);
    }

void avregistrera   (Register mittKonto[], int *mittIndex, int *mittElement, Register minLista[])
{
    if (*mittIndex==0)              // Om inget konto är registrerat, återgå till huvudmenyn.
    {
        printf("\n");
        printf("- Inga registrerade bankkonton. Vanligen registrera.\n\n");
        return;
    }

    int input;
    printf("\n");
    printf("Avregistrera konto\n\n");
    do
    {
        avregistreraMeny();
        scanf("%d", &input);
        switch (input)
        {
            case 1: avregKontoNr (mittKonto, mittIndex); break;
            case 2: avregAgare   (mittKonto, mittIndex, mittElement, minLista); break;
            case 3: return;
            default: printf("- Inte ett giltigt val!\n\n"); break;
        }
    } while (input<1 || input>3);
}
    void avregistreraMeny()
    {
        printf("Vad vill du ange?\n");
        printf(" (1) Konto-nr\n");
        printf(" (2) Agare\n");
        printf(" (3) Huvudmeny\n");
        printf("Ange val : ");
    }
    void avregKontoNr       (Register ettKonto[], int *ettIndex)
    {
        int accountnumber, villkor=0;
        do
        {
            printf("Ange kontonummer : ");
            scanf("%d", &accountnumber);
            for (int i = 0; i < *ettIndex; i++)
            {
                if (ettKonto[i].kontonummer==accountnumber)
                {
                    if (ettKonto[i].saldo==0)
                    {
                        for (int j=i; j < *ettIndex; j++) ettKonto[j] = ettKonto[j+1];
                        (*ettIndex)--;
                        villkor=1;
                        break;
                    } else
                    {
                        printf("Saldo : %d | Andra saldo innan avregistrering!\n\n", ettKonto[i].saldo);
                        return;
                    }
                }
            } if (villkor!=1) printf("- Inte ett giltigt kontonummer!\n\n");
        } while (villkor!=1);
    }
    void avregAgare         (Register ettKonto[], int *ettIndex, int *ettElement, Register enLista[])
    {
        sokaAgare(ettKonto, ettIndex, ettElement, enLista);
        int accountnumber, count, villkor=0;
        
        if (*ettElement==-1) return;                                    // Om *ettElement har ursprungligt värde (-1), hittades inte sokstrang i funktionen sokaAgare.
        if (*ettElement==0)                                             // Ett konto i enLista
        {
            char agarnamn[MAXNAME+1];
            strcpy(agarnamn, enLista[*ettElement].agare);
            for (int i = 0; i < *ettIndex; i++)
                if (strcmp(ettKonto[i].agare, agarnamn)==0)
                    count=i;
        }
        if (*ettElement>0)                                              // Flera konton i enLista - välj en!
        {
            do                                                              // Ange ETT kontonummer som finns i enLista
            {
                printf("Ange kontonummer : ");
                scanf("%d", &accountnumber);
                for (int i = 0; i <= *ettElement; i++)
                {
                    if (enLista[i].kontonummer==accountnumber)
                    {
                        villkor=1;
                        break;                                              // Hindrar programmet från att köra onödiga iterationer
                    }
                } if (villkor==0) printf("- Inte ett giltgt kontonummer!\n\n");
            } while (villkor!=1);
        
            for (int i = 0; i < *ettIndex; i++)                         // Söker index tillhörande det kontot som skall få ändrat saldo
                if (ettKonto[i].kontonummer==accountnumber)                 // Eftersom accountnumber finns i enLista, så finns den per automatik i ettKonto.
                    count=i;
        }
        
        if (ettKonto[count].saldo==0)                                   // Avregistrering förutsätter att saldot är noll kr
        {
            for (int j=count; j < *ettIndex; j++)
            {
                ettKonto[j] = ettKonto[j+1];
            } (*ettIndex)--;
        } else printf("Saldo : %d | Andra saldo innan avregistrering!\n\n", ettKonto[count].saldo);
    }

void statistik      (Register mittKonto[], int *mittIndex)
{
    if (*mittIndex==0)              // Om inget konto är registrerat, återgå till huvudmenyn.
    {
        printf("\n");
        printf("- Inga registrerade bankkonton. Vanligen registrera.\n\n");
        return;
    }

    printf("\n");
    printf("Statistik\n\n");
    printf("\n");
    Register kopiaKonto[MAXKONTO];                                                          // Deklarerar ny struct (skall bli kopia av mittKonto)
    for (int i = 0; i < *mittIndex; i++) kopiaKonto[i].saldo=mittKonto[i].saldo;            // Kopierar saldo från mittKonto till tempSaldo
    sorteraSaldo(kopiaKonto, mittIndex);                                                    // Sorterar saldo i storleksordning (från högt till lågt)

    averageFunction   (mittKonto, mittIndex);                         // Beräknar medelvärde
    meanFunction      (mittKonto, mittIndex, kopiaKonto);             // Beräknar median
    typevalueFunction (mittKonto, mittIndex, kopiaKonto);             // Beräknar typvärde

}
    void averageFunction    (Register ettKonto[], int *ettIndex)
    {
        int sum=0;
        float average=0;
        for (int i = 0; i < *ettIndex; i++) sum = sum + ettKonto[i].saldo;
        average = ( (float) sum ) / (*ettIndex);
        printf("Medelvarde  : %0.1f\n", average);
    }
    void meanFunction       (Register ettKonto[], int *ettIndex, Register tempKonto[])
    {
        float mean=0;
        int num = (*ettIndex-1) / 2;
        if ((*ettIndex)%2==0)
        {
            mean = ( (float) tempKonto[num].saldo + tempKonto[num+1].saldo ) / 2;
        } else mean = tempKonto[num].saldo;
        printf("Median      : %0.1f\n", mean);
    }
    void typevalueFunction  (Register ettKonto[], int *ettIndex, Register tempKonto[])
    {
        // Söker typvärde - kan finnas olika saldo med samma typvärde!
        int typevalue[MAXKONTO], counter[MAXKONTO], tempCounter[MAXKONTO];
        for (int i = 0; i < *ettIndex; i++)                                     // För varje konto
        {            
            typevalue[i]=counter[i]=tempCounter[i]=0;                           // Nollställda räknare
            for (int j = 0; j < *ettIndex; j++)                                 // För varje konto
            {
                if (tempKonto[i].saldo==tempKonto[j].saldo)                     // Om samma saldo...
                {
                    (tempCounter[i])++;                                         // ... öka tempCounter[i] med ett.
                    if (tempCounter[i]>counter[i])                              // Ansätt ny räknare och motsvarande typvärde (tillfälliga)
                    {
                        counter[i]=tempCounter[i];
                        typevalue[i]=tempKonto[i].saldo;
                    }
                }
            }
        }

        // Söker största räknare (maxCounter)
        int maxCounter=counter[0];
        for (int i = 1; i < *ettIndex; i++)
            if (counter[i]>maxCounter)
                maxCounter=counter[i];

        // Skriver ut samtliga typvärden    
        printf("Typvarde    : ", maxCounter);
        for (int i = 0; i < *ettIndex; i++)
        {
            if (maxCounter==counter[i])
            {                
                int villkor=1;
                for (int j = 0; j < i; j++)                                     // Skriver inte ut samma saldo flera gånger
                {
                    if (typevalue[i]==typevalue[j])
                    {
                        villkor=0;
                    }
                }
                if (villkor==1) printf("{ %d } ", typevalue[i]);
            }
        }
        printf("\n");
        printf(" - Forkommer %d gang(er) per konto\n", maxCounter);                     // Skriver ut antalet konton med typvärde
    }

void overforing     (Register mittKonto[], int *mittIndex)
{
    if (*mittIndex==0)              // Om inget konto är registrerat, återgå till huvudmenyn.
    {
        printf("\n");
        printf("- Inga registrerade bankkonton. Vanligen registrera.\n\n");
        return;
    }
    
    printf("\n");
    printf("Overforing\n\n");
    int fromAccountnumber, toAccountnumber, fromAccount, toAccount, belopp, villkor;
    
    // Från vilket konto
    villkor=0;
    do
    {
        printf("Fran vilket konto vill du overfora? : ");
        scanf("%d", &fromAccountnumber);
        for (int i = 0; i < *mittIndex; i++)
        {
            if (mittKonto[i].kontonummer==fromAccountnumber)
            {
                fromAccount = i;
                villkor=1;
                break;
            }
        } if (villkor==0) printf("- Kontonumret saknas!\n\n");
    } while (villkor==0);
    
    // Om saldot är noll
    if (mittKonto[fromAccount].saldo==0)
    {
        printf("- Oka saldo innan overforing!\n\n");
        return;
    }
    
    // Till vilket konto
    villkor=0;
    do
    {
        printf("Till vilket konto vill du overfora? : ");
        scanf("%d", &toAccountnumber);
        for (int i = 0; i < *mittIndex; i++)
        {
            if (mittKonto[i].kontonummer==toAccountnumber)
            {
                toAccount=i;
                villkor=1;
                break;
            }
        } if (villkor==0) printf("- Inte ett giltigt kontonummer!\n\n");
    } while (villkor==0);
    
    // Belopp
    villkor=0;
    do
    {
        printf("Hur mycket vill du overfora [kr]?   : ");
        scanf("%d", &belopp);
        if (mittKonto[fromAccount].saldo<belopp) printf("- Ange ett mindre belopp!\n\n");
        else villkor=1;
    } while (villkor==0);
    
    // Verkställer överföringen
    mittKonto[fromAccount].saldo = mittKonto[fromAccount].saldo - belopp;
    mittKonto[toAccount].saldo   = mittKonto[toAccount].saldo   + belopp;
}