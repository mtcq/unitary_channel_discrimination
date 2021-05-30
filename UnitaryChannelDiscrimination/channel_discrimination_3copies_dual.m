function  [lambda,Wbar] = channel_discrimination_3copies_dual(C,protocol,varargin)
% This function implements the primal SDP for discriminating a set of N
% quantum channels {C_i}_i when k=2 copies are available.
%
% The function outputs the optimal succes probability lambda,
% the affine dual process Wbar such that p_i C_i <= lambda Wbar
% 
% If causally separable protocols are considered, Wbar is a tensor which
% stores extra variable H such that p_i C_i <= H
% The dual process Wbar12 such that H <= lambda Wbar12
% The dual process Wbar21 such that H <= lambda Wbar21
% That is, W(:,:,1)=H, W(:,:,2)=Wbar12, and W(:,:,3)=Wbar21.
%
% The set of channels shoud be storered in a variable C
% For instance: C(:,:,1)=C1, C(:,:,2)=C2, ..., C(:,:,N)=CN  
%
% When protocol==1, Paralel protocols are considered
% When protocol==2, Sequential protocols are considered
% When protocol==3, Separable protocols are considered
% When protocol==4, General protocols are considered
%
% If the channels have different input/output dimension, one should write
% channel_discrimination_2copies_primal(C,protocol,[dIn dOut])
% If the distribution of the channels is not the uniform one, i.e., p_i=1/N, one should write
% channel_discrimination_2copies_primal(C,protocol,[dIn dOut], p_i)
% where p_i is an array with the distribution p_i
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

N=size(C,3); %Obtain the number of channels N
k=3; %Set the number of uses k equals 2

% Switch that analyses the extra inputs varargin
switch length(varargin)
    case 0  %If no extra input is given, assume dIn=dOut and uniform p_i
        d=sqrt(size(C(:,:,1),1));
        dIn=d;
        dOut=d;
        DIM=[d d d d d d];
        p_i=ones(1,N)/N;
    case 1 %If one extra input is given, assume uniform p_i
        dIn=varargin{1}(1);
        dOut=varargin{1}(2);
        DIM=[dIn dOut dIn dOut dIn dOut];
        p_i=ones(1,N)/N;
    case 2 %If two extra inputs are given, use information from extra inptus
        dIn=varargin{1}(1);
        dOut=varargin{1}(2);
        DIM=[dIn dOut dIn dOut dIn dOut];
        p_i=varargin{2};
end

% Switch that treats the 4 possible different protocols
switch protocol   
%%%%%%%%%%%%%%%%%%%%% PARALLEL TESTERS %%%%%%%%%%%%%%%%%%%%%
    case 1
cvx_begin SDP
%cvx_solver sedumi
     variable Wbar(dIn^(2*k) dOut^(2*k)) complex semidefinite
     
     minimise trace(Wbar)/dOut^k;
     
     for i=1:N
         p_i(i)*Tensor(C(:,:,i),k) <= Wbar;
     end     
     
     TR(Wbar,[2 4 6],DIM)==TR(Wbar,[1 2 3 4 5 6],DIM);
     
cvx_end
lambda=trace(Wbar)/dOut^k;
Wbar=Wbar/lambda;
%%%%%%%%%%%%%%%%%%%%% SEQUENTIAL TESTERS %%%%%%%%%%%%%%%%%%%%%
    case 2
cvx_begin SDP
%cvx_solver sedumi
     variable Wbar(dIn^(2*k) dOut^(2*k)) complex semidefinite
     
     minimise trace(Wbar)/dOut^k;
     
     for i=1:N
         p_i(i)*Tensor(C(:,:,i),k) <= Wbar;
     end     
     
     TR(Wbar,[6],DIM)==TR(Wbar,[6 5],DIM);
     TR(Wbar,[6 5 4],DIM)==TR(Wbar,[6 5 4 3],DIM);
     TR(Wbar,[6 5 4 3 2],DIM)==TR(Wbar,[6 5 4 3 2 1],DIM);
     
cvx_end
lambda=trace(Wbar)/dOut^k;
Wbar=Wbar/lambda;

%%%%%%%%%%%%%%%%%%%%% GENERAL TESTERS %%%%%%%%%%%%%%%%%%%%%
    case 4
cvx_begin SDP
%cvx_solver sedumi
     variable Wbar(dIn^(2*k) dOut^(2*k)) complex semidefinite
     
     minimise trace(Wbar)/dOut^k;
     
     for i=1:N
         p_i(i)*Tensor(C(:,:,i),k) <= Wbar;
     end
     
     TR(Wbar,[6],DIM)==TR(Wbar,[6 5],DIM);
     TR(Wbar,[4],DIM)==TR(Wbar,[3 4],DIM);
     TR(Wbar,[2],DIM)==TR(Wbar,[1 2],DIM);
     
cvx_end
lambda=trace(Wbar)/dOut^k;
Wbar=Wbar/lambda;   
%%%%%%%%%%%%%%%%%%%%% ERROR MESSAGE %%%%%%%%%%%%%%%%%%%%%
    otherwise
        'ERROR!!'
        'Set protocol equals 1 for PAR, and 4 for GEN'
        pause
end

end