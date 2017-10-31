/* 
 * Proyecto Investigación Paradigmas de Programación
 * royalewithcheese.c
 * 
 * David Lobo Gúzman.
 * Cristian Díaz Jiménez.
 *
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#define TAM 26
#define MAX 100005

/* Variables Globales */
char *var;
int cnt, j;
int vecAux[TAM];
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

int main(int argc, char** argv) {
    var = (char*) malloc(sizeof (char));

    while (scanf("%s", var) != EOF) {
	fflush(stdin);
        fflush(stdout);

        cnt = 0;
        for (int i = 0; i < TAM; i++) {
            vecAux[i] = 0;
        }

        j = 0;
        for (int i = 0; i < strlen(var); i++) {
            if (!vecAux[var[i] - 'a']) {
                vecAux[var[i] - 'a'] = ++cnt;
            }

            if (vecAux[var[i] - 'a'] < 10) {
                vecOut[j++] = vecAux[var[i] - 'a'] + '0';
            } else {
                vecOut[j++] = vecAux[var[i] - 'a'] / 10 + '0';
                vecOut[j++] = vecAux[var[i] - 'a'] % 10 + '0';
            }
        }

        vecOut[j] = '\0';
        parseo();
        printf("%d \n", vecOut);
	free(var);
    }

    free(var);
    return 0;
}
