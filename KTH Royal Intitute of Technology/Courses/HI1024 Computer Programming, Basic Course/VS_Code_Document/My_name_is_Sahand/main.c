#include <stdio.h>
int main(void)
{
    printf("What's my name and age?\n");
    int name;
    int age;

    printf("Enter your name.\n");
    scanf("%d", &name);

    printf("Enter your age [years].\n");
    scanf("%d", &age);

    printf("My name is %d and I'm %d years old.\n", name, age);

}