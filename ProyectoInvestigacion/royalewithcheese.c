#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#define LET 26
#define MAX 100005

/* Variables Globales */
char *var;
int cnt, j;
int vecAux[LET];
char vecOut[MAX];


/* Declaracion de Metodos */
int parseo();

/* Implementacion de Metodos */
int parseo() {
    for (int i = 0; i < j; i++) {
        if (vecOut[i] == '5') {
            vecOut[i] = '2';
        } else if (vecOut[i] == '2') {
            vecOut[i] = '5';
        } else if (vecOut[i] == '6') {
            vecOut[i] = '9';
        } else if (vecOut[i] == '9') {
            vecOut[i] = '6';
        }
    }
}

int main() {
	var = (char*) malloc(sizeof (char));
	
	while (scanf("%s", var)) {
		cnt = 0;
		
		for (int i = 0; i < LET; i++) {
			vecAux[i] = 0;
		}

		j = 0;
		for (int i = 0; i < strlen(var); i++) {
			if (!vecAux[var[i]-'a']) {
				vecAux[var[i]-'a'] = ++cnt;
			}

			if (vecAux[var[i]-'a'] < 10) {
				vecOut[j++] = vecAux[var[i]-'a'] + '0';
			} else {
				vecOut[j++] = vecAux[var[i]-'a']/10 + '0';
				vecOut[j++] = vecAux[var[i]-'a']%10 + '0';
			}
		}
		vecOut[j] = '\0';
		parseo();
		printf("%d \n", vecOut);
	}
	
	return 0;
}
