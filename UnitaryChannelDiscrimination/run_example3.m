% Script that performs the SDPs related in Example3
clear
tic

%Define useful operators
Id=eye(2);
X=[0 1;1 0];
Y=[0 -sqrt(-1);sqrt(-1) 0];
Z=[1 0;0 -1];
H=[1 1; 1 -1]/sqrt(2);
HY=[1 1;1i -1i]/sqrt(2);
UP=[3 4; 4 -3]/5;
%Define the set of unitary operators {U_i}
U1=X^(1/2);
U2=Z^(1/2);
U3=UP^(1/2);
U4=HY^(1/2);  


% Stores the Choi operator of the Chanels into a tensor
C(:,:,1)=ChoiMatrix({U1});
C(:,:,2)=ChoiMatrix({U2});
C(:,:,3)=ChoiMatrix({U3});
C(:,:,4)=ChoiMatrix({U4});
%C(:,:,4)=[1 0 0 1i;0 0 0 0;0 0 0 0;-1i 0 0 1]


%Declare the dimension of input and output spaces as qubits

% Run all primal SDPs
%[pLowerPar,TPar,WPar] = channel_discrimination_2copies_primal(C,1);
%[pLowerSeq,TSeq,WSeq] = channel_discrimination_2copies_primal(C,2);
%[pLowerSep TSep WSep] = channel_discrimination_2copies_primal(C,3);
%[pLowerGen TGen WGen] = channel_discrimination_2copies_primal(C,4);

% Run all dual SDPs
%[pUpperPar,WbarPar] = channel_discrimination_2copies_dual(C,1);
%[pUpperSeq,WbarSeq] = channel_discrimination_2copies_dual(C,2);
%[pUpperSep WbarSep] = channel_discrimination_2copies_dual(C,3);
%[pUpperGen WbarGen] = channel_discrimination_2copies_dual(C,4);

[pLowerPar,TPar,WPar] = channel_discrimination_3copies_primal(C,1);
pLowerPar=pLowerPar
if abs(pLowerPar-1)<.0001
    error('pPar=1');
end
[pLowerSeq,TSeq,WSeq] = channel_discrimination_3copies_primal(C,2);
pLowerSeq=pLowerSeq
if abs(pLowerSeq-1)<.0001
    error('pSeq=1');
end
[pLowerGen,TGen,WGen] = channel_discrimination_3copies_primal(C,4);
if abs(pLowerGen-pLowerSeq)<.0001
    error('NO GAP');
end

% Display the success probabilities obtained with the primal
disp('The maximal sucess probabilities obtained by the primal are:');
%p_Primal=[pLowerPar pLowerSeq pLowerSep pLowerGen]
p_Primal=[pLowerPar pLowerSeq pLowerGen]


[pUpperPar,WbarPar] = channel_discrimination_3copies_dual(C,1);
[pUpperSeq,WbarSeq] = channel_discrimination_3copies_dual(C,2);
[pUpperGen,WbarGen] = channel_discrimination_3copies_dual(C,4);



% 
% % Display the success probabilities obtained with the primal
 disp('The maximal sucess probabilities obtained by the primal are:');
% %p_Dual = [pUpperPar pUpperSeq pUpperSep pUpperGen]
 p_Dual = [pUpperPar pUpperSeq pUpperGen]
% 
% 
% 
mkdir MatlabExample3 %Creates the folder there the variables will be saved
cd MatlabExample3/   %Accesses the folder there the variables will be saved
    save 'TPar' TPar
    save 'pUpperPar' pUpperPar
    save 'WbarPar' WbarPar
    
    save 'TSeq' TSeq
    save 'pUpperSeq' pUpperSeq
    save 'WbarSeq' WbarSeq

    save 'TGen' TGen
    save 'pUpperGen' pUpperGen
    save 'WbarGen' WbarGen

cd .. % Returns to the original folder
disp('The useful variables were saved in the folder MatlabExample3');

total_time_in_minutes=toc/60