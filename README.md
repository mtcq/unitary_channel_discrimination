## Code to accompany: *[Unitary operation discrimination beyond group representation:Advantages of adaptive and indefinite-causal-order strategies](https://arxiv.org/abs/xxx)*
#### Jessica Bavaresco, Mio Murao, and Marco Túlio Quintino

This is a repository for the code used to calculate the numerical results presented in the article "*Unitary operation discrimination beyond group representation:Advantages of adaptive and indefinite-causal-order strategies*, Jessica Bavaresco, Mio Murao, and Marco Túlio Quintino, [arXiv:xxxx.xxxx](https://arxiv.org/abs/xx.xxxx)".

 MATLAB code requires:
- [cvx](http://cvxr.com/) - a free MATLAB toolbox for rapid prototyping of optimization problems
- [QETLAB](http://www.qetlab.com/) - a free MATLAB toolbox for quantum entanglement theory

 MATHEMATICA code requires:
- [QI](https://github.com/rogercolbeck/QI) - a free quantum information Mathematica package

The MATLAB code of this repository is: 


- [channel_discrimination_2copies_primal.m](https://github.com/mtcq/channel_discrimination/blob/main/ChannelDiscrimination/channel_discrimination_2copies_primal.m):
Primal SDP to calculate maximal success probability of discriminating a set of quantum channels when two copies of the channel are available.
The user may impose the restrictions of Parallel, Sequential, Separable, or General strategies.

- [channel_discrimination_2copies_dual](https://github.com/mtcq/channel_discrimination/blob/main/ChannelDiscrimination/channel_discrimination_2copies_dual.m):
Dual SDP to calculate maximal success probability of discriminating a set of quantum channels when two copies of the channel are available.
The user may impose the restrictions of Parallel, Sequential, Separable, or General strategies.

- [TR.m](https://github.com/mtcq/channel_discrimination/blob/main/ChannelDiscrimination/TR.m):
Function that implements the trace-and-replace map on matrices.


The MATLAB code of this repository is: 

- [LoadVariables.nb](https://github.com/mtcq/channel_discrimination/blob/main/ChannelDiscrimination/LoadVariables.nb):
Notebook used to load important variables.

- [LoadFunctions.nb](https://github.com/mtcq/channel_discrimination/blob/main/ChannelDiscrimination/LoadFunctions.nb):
Notebook used to load important functions.

- [ComputerAssisted.nb](https://github.com/mtcq/channel_discrimination/blob/main/ChannelDiscrimination/ComputerAssisted.nb):
Notebook used to certify a computer assited proof which ensures exact upper and lower bounds for the maximal probability of success in a taks of channel discrimination.

This repository also includes the folder MatlabChannelDiscriminationVariables, which contains important variables used in the computer assited proof written in MATHEMATICA notebooks. Note that the MATLAB script run_channel_discrimination.m will creates this folder and all the variables included on it.
