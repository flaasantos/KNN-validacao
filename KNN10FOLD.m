clc
clear all

%%%%%%%%%%%%%%%%%%KNN%%%%%%%%%%%%%%%%%%%%
%Hold-out
 %valor da quantidade de vizinhos(SELECIONAR)
 K=4;
M=load('iris_log.dat');
M = M(randperm(size(M,1)),:); %mistura aleatoriamente as linhas da matriz
%matriz dos K vizinhos mais próximos 
 %auxiliar que irá ajudar no teste do vizinho mais próximo
for k=0:14      
 %verifica a matriz de testes K vezes para encontrar os K-NN
    Teste=M(k*10+1:10*(k+1),:);%matrix de testes, pega 10 amostras
    aux=M;
    aux(k*10+1:10*(k+1),:)=[];
    Treino=aux;    %treino, pega o restante das amostras 
   for b=1:10
       p=1;
        Vizinhos=zeros(K,7);
       for g=1:K       
      
    aux=17000; %auxiliar muito grande para não haver problema na hora da primeira subtração
    for i=1:135 %repete 135 vezes(número de amostras de treino)        
        c=sum(abs(Teste(b,:)-Treino(i,:))); %faz uma soma para ver o quão próximo está 
        if c<aux
            aux=c; %esse if pega o valor da linha'd' mais próximo da amostra de teste ecolhida
            d=i;  %d vira o índice do vetor mais próximo
        end                     
    end
            Vizinhos(p,:)=Treino(d,:);  %pega a linha de vetores mais próxima
            Treino(d,:)=zeros;          %zera a linha pega, para não correr o risco de pegá-la novamente
            p=p+1;                      %repete o processo para a próxima linha de 'Vizinhos'    
   end
 Vizinhos
 Amostra=Teste(b,:)        %plota os resultados
Rotulo_da_amostra_calculado=[mean(Vizinhos(:,5)) mean(Vizinhos(:,6)) mean(Vizinhos(:,7))]                            
end 

end





















% M1=zeros(15,7);
% M2=zeros(15,7);
% M3=zeros(15,7);
% M4=zeros(15,7);
% M5=zeros(15,7);
% M6=zeros(15,7);
% M7=zeros(15,7);
% M8=zeros(15,7);
% M9=zeros(15,7);
% M10=zeros(15,7);
% 
% M1(1:5,:)=M(1:5,:);
% M1(6:10,:)=M(51:55,:);
% M1(11:15,:)=M(101:105,:);
% 
% 
% M2(1:5,:)=M(6:10,:);
% M2(6:10,:)=M(56:60,:);
% M2(11:15,:)=M(106:110,:);
% 
% M3(1:5,:)=M(11:15,:);
% M3(6:10,:)=M(61:65,:);
% M3(11:15,:)=M(111:115,:);
% 
% M4(1:5,:)=M(16:20,:);
% M4(6:10,:)=M(66:70,:);
% M4(11:15,:)=M(116:120,:);
% 
% M5(1:5,:)=M(21:25,:);
% M5(6:10,:)=M(71:75,:);
% M5(11:15,:)=M(121:125,:);
% 
% M6(1:5,:)=M(26:30,:);
% M6(6:10,:)=M(76:80,:);
% M6(11:15,:)=M(126:130,:);
% 
% M7(1:5,:)=M(31:35,:);
% M7(6:10,:)=M(81:85,:);
% M7(11:15,:)=M(131:135,:);
% 
% M8(1:5,:)=M(36:40,:);
% M8(6:10,:)=M(86:90,:);
% M8(11:15,:)=M(136:140,:);
% 
% M9(1:5,:)=M(41:45,:);
% M9(6:10,:)=M(91:95,:);
% M9(11:15,:)=M(141:145,:);
% 
% M10(1:5,:)=M(46:50,:);
% M10(6:10,:)=M(96:100,:);
% M10(11:15,:)=M(146:150,:);


