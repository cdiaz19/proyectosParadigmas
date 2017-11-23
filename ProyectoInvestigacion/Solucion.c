#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>

int main()
{
    int idLetter, arrayLetter[125], totalLetters;
    char line[100005];

    while(scanf("%s", line) != EOF)
    {
        for(idLetter=97; idLetter<=122; idLetter++)
            arrayLetter[idLetter] = 0;

        totalLetters = 0;
        for(idLetter=0; line[idLetter] != '\0'; idLetter++)
        {
            if(arrayLetter[line[idLetter]] == 0)
            {
                totalLetters++;
                arrayLetter[line[idLetter]] = totalLetters;
                if(totalLetters == 2)
                    arrayLetter[line[idLetter]] = 5;
                if(totalLetters == 5)
                    arrayLetter[line[idLetter]] = 2;
                if(totalLetters == 6)
                    arrayLetter[line[idLetter]] = 9;
                if(totalLetters == 9)
                    arrayLetter[line[idLetter]] = 6;
                if(totalLetters == 12)
                    arrayLetter[line[idLetter]] = 15;
                if(totalLetters == 15)
                    arrayLetter[line[idLetter]] = 12;
                if(totalLetters == 16)
                    arrayLetter[line[idLetter]] = 19;
                if(totalLetters == 19)
                    arrayLetter[line[idLetter]] = 16;
                if(totalLetters == 20)
                    arrayLetter[line[idLetter]] = 50;
                if(totalLetters == 21)
                    arrayLetter[line[idLetter]] = 51;
                if(totalLetters == 22)
                    arrayLetter[line[idLetter]] = 55;
                if(totalLetters == 23)
                    arrayLetter[line[idLetter]] = 53;
                if(totalLetters == 24)
                    arrayLetter[line[idLetter]] = 54;
                if(totalLetters == 25)
                    arrayLetter[line[idLetter]] = 52;
                if(totalLetters == 26)
                    arrayLetter[line[idLetter]] = 59;
            }
            printf("%d", arrayLetter[line[idLetter]]);
        }
        printf("\n");
    }

    return 0;
}

