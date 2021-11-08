clc
clear all

%%%%%%%%%%%%%%%%%%KNN%%%%%%%%%%%%%%%%%%%%
%Hold-out
K=4; %valor da quantidade de vizinhos(SELECIONAR)
M=load('iris_log.dat');
%faz-se uma matriz de treino e uma de testes
%usando 70% para treino São 35 amostradas de cada classe, usa-se as 35 primeira de cada
Treino=zeros(105,7);
Treino(1:35,:)=M(1:35,:);
Treino(36:70,:)=M(51:85,:);
Treino(71:end,:)=M(101:135,:);

Teste=zeros(45,7);      %matriz para teste
Teste(1:15,:)=M(36:50,:);
Teste(16:30,:)=M(86:100,:);
Teste(31:end,:)=M(136:150,:);

Vizinhos=zeros(K,7);%matriz dos K vizinhos mais próximos

 
p=1; %auxiliar que irá ajudar no teste do vizinho mais próximo
    
 %Digite aqui o índice da linha da amostra de teste desejada

%Essa parte do programa é responsável por: Pegar a Linha desejada da matriz
%de teste, pegar os KNN e colocar na matriz 'Vizinhos'.
for k=1:45
    p=1;
    Treino=zeros(105,7);
Treino(1:35,:)=M(1:35,:);              %atribui-se a matriz TReino novamente, para não haver linhas zeradas
Treino(36:70,:)=M(51:85,:);
Treino(71:end,:)=M(101:135,:);
    Vizinhos=zeros(K,7);%matriz dos K vizinhos mais próximos
for g=1:K %verifica a matriz de testes K vezes para encontrar os K-NN
    aux=17000; %auxiliar muito grande para não haver problema na hora da primeira subtração
    for i=1:105 %repete 105 vezes(número de amostras de treino)        
        c=sum(abs(Teste(k,:)-Treino(i,:))); %faz uma soma para ver o quão próximo está 
        if c<aux
            aux=c; %esse if pega o valor da linha'd' mais próximo da amostra de teste ecolhida
            d=i;  %d vira o índice do vetor mais próximo
        end
                     
    end
           Vizinhos(p,:)=Treino(d,:);  %pega a linha de vetores mais próxima
            Treino(d,:)=zeros;         %zera a linha pega, para não correr o risco de pegá-la novamente
            p=p+1;                     %repete o processo para a próxima linha de 'Vizinhos'
            
end 
[mean(Vizinhos(:,5)) mean(Vizinhos(:,6)) mean(Vizinhos(:,7))] %A análise das colunas 5,6 e 7 dará o resultado. 
                                                              %aí compara-se com o rótulo da matriz de treino
end


        
        