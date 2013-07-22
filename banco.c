/*
banco.c

A lógica utilizada busca computar o minuto em que o próximo caixa ficará
livre, e, ao comparar com o tempo em que o próximo cliente entrou no banco,
verificar se o cliente sairá satisfeito ou não.

A complexidade do algoritmo é O(C*N), C igual ao número de caixas abertos,
N igual ao número total de clientes.

*/

#include <stdlib.h>
#include <stdio.h>

/* Definição do tipo Client, seguindo o enunciado do problema */
typedef struct {
    int t;
    int d;
} *Client;

/* Função que recebe dois inteiros (número de caixas e clientes) e devolve um vetor de Client  */
Client *readData(int numCaixas, int numClientes){
    int i;

    Client *clientes;

    clientes = malloc(numClientes * sizeof(Client));

    for (i = 0; i < numClientes; i++){
        clientes[i] = malloc(sizeof(Client));
        scanf(" %d", &(clientes[i]->t));
        scanf(" %d", &(clientes[i]->d));
    }

    return clientes;
}

/* Função que recebe o número de caixas, número de clientes, um vetor de clientes e um tempo limite,
e devolve o número de clientes insatisfeitos */
int calculateData(int numCaixas, int numClientes, Client* clientes, int tempoLimite){
    int i, j;
    int indexCaixa;
    int *tempos;
    int resultado;

    resultado = 0;

    tempos = calloc(numCaixas, sizeof(int));
    
    for(i = 0; i < numCaixas; i++){
        tempos[i] = 0;
    }

    for(i = 0; i < numClientes; i++){
        indexCaixa = 0;

        for(j = 0; j < numCaixas; j++){
            if(tempos[j] < tempos[indexCaixa]){
                indexCaixa = j;
            }
        }

        if(tempos[indexCaixa] > clientes[i]->t + tempoLimite){
            resultado++;
        }

        if(tempos[indexCaixa] < clientes[i]->t){
            tempos[indexCaixa] += clientes[i]->t - tempos[indexCaixa];
        }

        tempos[indexCaixa] += clientes[i]->d;
    }

    free(tempos);

    return resultado;
}

/* Função de entrada do programa
   Também libera os recursos da memória */
int main(){
    int i, numCaixas, numClientes;
    Client *clientes;

    scanf(" %d", &numCaixas);
    scanf(" %d", &numClientes);

    printf("%d\n", calculateData(numCaixas, numClientes, clientes = readData(numCaixas, numClientes), 20));
    for (i = 0; i < numClientes; i++){    
        free(clientes[i]);
    }
    free(clientes);
    return 0;
}
