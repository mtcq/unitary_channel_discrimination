% Script that performs the SDPs related in Example2
clear

%Define useful operators
Id=eye(2);
X=[0 1;1 0];
Y=[0 -sqrt(-1);sqrt(-1) 0];
Z=[1 0;0 -1];
H=[1 1; 1 -1]/sqrt(2);
%Define the set of unitary operators {U_i}
U1=Id;
U2=X;
U3=Y;
U4=Z;
U5=H;
U6=X*H;
U7=Y*H;
U8=Z*H;
%   pi=~3.1415926
%Define the unnormalised distribution
p(1)=3;
p(2)=1;
p(3)=4;
p(4)=1;
p(5)=5;
p(6)=9;
p(7)=2;
p(8)=6;
%Normalise the distribution p
p=p/sum(p);

% Stores the Choi operator of the Chanels into a tensor
C(:,:,1)=ChoiMatrix({U1});
C(:,:,2)=ChoiMatrix({U2});
C(:,:,3)=ChoiMatrix({U3});
C(:,:,4)=ChoiMatrix({U4});
C(:,:,5)=ChoiMatrix({U5});
C(:,:,6)=ChoiMatrix({U6});
C(:,:,7)=ChoiMatrix({U7});
C(:,:,8)=ChoiMatrix({U8});


%Declare the dimension of input and output spaces as qubits
DIM=[2 2 2 2];
% Run all primal SDPs
[pLowerPar,TPar,WPar] = channel_discrimination_2copies_primal(C,1,DIM,p);
[pLowerSeq,TSeq,WSeq] = channel_discrimination_2copies_primal(C,2,DIM,p);
%[pLowerSep TSep WSep] = channel_discrimination_2copies_primal(C,3);
%[pLowerGen TGen WGen] = channel_discrimination_2copies_primal(C,4);

% Run all dual SDPs
[pUpperPar,WbarPar] = channel_discrimination_2copies_dual(C,1,DIM,p);
[pUpperSeq,WbarSeq] = channel_discrimination_2copies_dual(C,2,DIM,p);
%[pUpperSep WbarSep] = channel_discrimination_2copies_dual(C,3);
%[pUpperGen WbarGen] = channel_discrimination_2copies_dual(C,4);

% Display the success probabilities obtained with the primal
disp('The maximal sucess probabilities obtained by the primal are:');
%p_Primal=[pLowerPar pLowerSeq pLowerSep pLowerGen]
p_Primal=[pLowerPar pLowerSeq]


% Display the success probabilities obtained with the dual
disp('The maximal sucess probabilities obtained by the dual are:');
%p_Dual = [pUpperPar pUpperSeq pUpperSep pUpperGen]
p_Dual = [pUpperPar pUpperSeq]



mkdir MatlabExample2 %Creates the folder there the variables will be saved
cd MatlabExample2/   %Accesses the folder there the variables will be saved
    save 'TPar' TPar
    save 'pUpperPar' pUpperPar
    save 'WbarPar' WbarPar
    
    save 'TSeq' TSeq
    save 'pUpperSeq' pUpperSeq
    save 'WbarSeq' WbarSeq
cd .. % Returns to the original folder
disp('The useful variables were saved in the folder MatlabExample2');