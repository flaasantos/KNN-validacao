clc
clear all

%%%%%%%%%%%%%%%%%%KNN%%%%%%%%%%%%%%%%%%%%
%Hold-out
K=4; %valor da quantidade de vizinhos(SELECIONAR)
M=load('iris_log.dat');
%faz-se uma matriz de treino e uma de testes
%usando 70% para treino S�o 35 amostradas de cada classe, usa-se as 35 primeira de cada
Treino=zeros(105,7);
Treino(1:35,:)=M(1:35,:);
Treino(36:70,:)=M(51:85,:);
Treino(71:end,:)=M(101:135,:);

Teste=zeros(45,7);      %matriz para teste
Teste(1:15,:)=M(36:50,:);
Teste(16:30,:)=M(86:100,:);
Teste(31:end,:)=M(136:150,:);

Vizinhos=zeros(K,7);%matriz dos K vizinhos mais pr�ximos

 
p=1; %auxiliar que ir� ajudar no teste do vizinho mais pr�ximo
    
 %Digite aqui o �ndice da linha da amostra de teste desejada

%Essa parte do programa � respons�vel por: Pegar a Linha desejada da matriz
%de teste, pegar os KNN e colocar na matriz 'Vizinhos'.
for k=1:45
    p=1;
    Treino=zeros(105,7);
Treino(1:35,:)=M(1:35,:);              %atribui-se a matriz TReino novamente, para n�o haver linhas zeradas
Treino(36:70,:)=M(51:85,:);
Treino(71:end,:)=M(101:135,:);
    Vizinhos=zeros(K,7);%matriz dos K vizinhos mais pr�ximos
for g=1:K %verifica a matriz de testes K vezes para encontrar os K-NN
    aux=17000; %auxiliar muito grande para n�o haver problema na hora da primeira subtra��o
    for i=1:105 %repete 105 vezes(n�mero de amostras de treino)        
        c=sum(abs(Teste(k,:)-Treino(i,:))); %faz uma soma para ver o qu�o pr�ximo est� 
        if c<aux
            aux=c; %esse if pega o valor da linha'd' mais pr�ximo da amostra de teste ecolhida
            d=i;  %d vira o �ndice do vetor mais pr�ximo
        end
                     
    end
           Vizinhos(p,:)=Treino(d,:);  %pega a linha de vetores mais pr�xima
            Treino(d,:)=zeros;         %zera a linha pega, para n�o correr o risco de peg�-la novamente
            p=p+1;                     %repete o processo para a pr�xima linha de 'Vizinhos'
            
end 
[mean(Vizinhos(:,5)) mean(Vizinhos(:,6)) mean(Vizinhos(:,7))] %A an�lise das colunas 5,6 e 7 dar� o resultado. 
                                                              %a� compara-se com o r�tulo da matriz de treino
end


        
        