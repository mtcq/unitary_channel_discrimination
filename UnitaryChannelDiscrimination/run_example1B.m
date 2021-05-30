% Script that performs the SDPs related in Example1B
clear

%Define the set of unitary operators {U_i}
U1=eye(2);
U2=[0 1;1 0];
U3=[0 -sqrt(-1);sqrt(-1) 0];
U4=sqrtm([1 0;0 -1]);

% Stores the Choi operator of the Chanels into a tensor
C(:,:,1)=ChoiMatrix({U1});
C(:,:,2)=ChoiMatrix({U2});
C(:,:,3)=ChoiMatrix({U3});
C(:,:,4)=ChoiMatrix({U4});

% Run all primal SDPs
[pLowerPar,TPar,WPar] = channel_discrimination_2copies_primal(C,1);
[pLowerSeq,TSeq,WSeq] = channel_discrimination_2copies_primal(C,2);
%[pLowerSep TSep WSep] = channel_discrimination_2copies_primal(C,3);
%[pLowerGen TGen WGen] = channel_discrimination_2copies_primal(C,4);

% Run all dual SDPs
[pUpperPar,WbarPar] = channel_discrimination_2copies_dual(C,1);
[pUpperSeq,WbarSeq] = channel_discrimination_2copies_dual(C,2);
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



mkdir MatlabExample1B %Creates the folder there the variables will be saved
cd MatlabExample1B/   %Accesses the folder there the variables will be saved
    save 'TPar' TPar
    save 'pUpperPar' pUpperPar
    save 'WbarPar' WbarPar
cd .. % Returns to the original folder
disp('The useful variables were saved in the folder MatlabExample1B');