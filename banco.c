#include <stdlib.h>
#include <stdio.h>

#define MAXTIME 301

typedef struct client {
    int t;
    int d;
} *Client;

int numCaixas;
int numClientes;

Client *clientes;

void readData(){    
    int i;
    
    scanf(" %d", &numCaixas);
    
    scanf(" %d", &numClientes);
    
    clientes = malloc(numClientes * sizeof(Client));
    
    for (i = 0; i < numClientes; i++){
        clientes[i] = malloc(sizeof(Client));
        
        scanf(" %d", &(clientes[i]->t));
        
        scanf(" %d", &(clientes[i]->d));
    }
}

int calculateData(){
    int i, j;
    int indexCaixa;
    int *tempos;
    int resultado;
    
    resultado = 0;
    
    tempos = malloc(numCaixas * sizeof(int));
    
    for(i = 0; i< numCaixas; i++){
        tempos[i] = 0;
    }
    
    for(i = 0; i < numClientes; i++){
        indexCaixa = 0;
        
        for(j = 0; j < numCaixas; j++){
            if(tempos[j] < tempos[indexCaixa]){
                indexCaixa = j;
            }
        }
        
        if(tempos[indexCaixa] > clientes[i]->t + 20){
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

int main(){
    int i;
    readData();
    printf("%d\n", calculateData());
    for (i = 0; i < numClientes; i++){    
        free(clientes[i]);
    }
    free(clientes);
    return 0;
}
