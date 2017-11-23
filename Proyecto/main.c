#include<stdio.h>
#include<string.h>

int main(){
	char amigo[256], N[256];

	printf("Usuario de Twitter ");
	scanf("%s*", &amigo);
	printf("Cantidad de Tweets ");
	scanf("%s", &N);
	char ejec[100]= "escript ~/Escritorio/Proyecto/Modulo1/ebin/mod1.escript ";
	strcat(&ejec,amigo);
	strcat(&ejec," ");
	strcat(&ejec,N);
	printf("%s \n", ejec);
	system(ejec);
	//system("mv ~/Documentos/UNA/ParadigmasdeProgramacion/Proyecto/Modulo1/ebin/*dat ~/Documentos/UNA/ParadigmasdeProgramacion/Proyecto/Modulo2");
	return 0;
}
