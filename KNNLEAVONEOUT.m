clc
clear all

%%%%%%%%%%%%%%%%%%KNN%%%%%%%%%%%%%%%%%%%%
%Hold-out
 %valor da quantidade de vizinhos(SELECIONAR)
 K=4;
M=load('iris_log.dat');
M = M(randperm(size(M,1)),:); %mistura aleatoriamente as linhas da matriz
%matriz dos K vizinhos mais pr�ximos 
 %auxiliar que ir� ajudar no teste do vizinho mais pr�ximo
 conf=zeros(6,6); %matriz de confus�o
for k=1:150      
 %verifica a matriz de testes K vezes para encontrar os K-NN
    Teste=M(k,:);%matrix de testes, pega 15 amostras
    aux=M;
    aux(k,:)=[];
    Treino=aux;    %treino, pega o restante das amostras 
    p=1;
    Vizinhos=zeros(K,7);
    for g=1:K     
    aux=17000; %auxiliar muito grande para n�o haver problema na hora da primeira subtra��o
    for i=1:149 %repete 135 vezes(n�mero de amostras de treino)        
        c=sum(abs(Teste-Treino(i,:))); %faz uma soma para ver o qu�o pr�ximo est� 
        if c<aux
            aux=c; %esse if pega o valor da linha'd' mais pr�ximo da amostra de teste ecolhida
            d=i;  %d vira o �ndice do vetor mais pr�ximo
        end                     
    end
            Vizinhos(p,:)=Treino(d,:);  %pega a linha de vetores mais pr�xima
            Treino(d,:)=zeros;          %zera a linha pega, para n�o correr o risco de peg�-la novamente
            p=p+1;                      %repete o processo para a pr�xima linha de 'Vizinhos'    
   end
 Vizinhos;
 Amostra=Teste;      %plota os resultados
Rotulo_da_amostra_calculado=[mean(Vizinhos(:,5)) mean(Vizinhos(:,6)) mean(Vizinhos(:,7))];
conf(Teste(5)*4+Teste(6)*2+Teste(7),Rotulo_da_amostra_calculado(1)*4+Rotulo_da_amostra_calculado(2)*2+Rotulo_da_amostra_calculado(3))=conf(Teste(5)*4+Teste(6)*2+Teste(7),Rotulo_da_amostra_calculado(1)*4+Rotulo_da_amostra_calculado(2)*2+Rotulo_da_amostra_calculado(3))+1;
end


