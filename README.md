## Code to accompany: *[Unitary operation discrimination beyond group representation:Advantages of adaptive and indefinite-causal-order strategies](https://arxiv.org/abs/xxx)*
#### Jessica Bavaresco, Mio Murao, and Marco Túlio Quintino

This is a repository for the code used to calculate the numerical results presented in the article "*Unitary operation discrimination beyond group representation:Advantages of adaptive and indefinite-causal-order strategies*, Jessica Bavaresco, Mio Murao, and Marco Túlio Quintino, [arXiv:xxxx.xxxx](https://arxiv.org/abs/xx.xxxx)".

 MATLAB code requires:
- [cvx](http://cvxr.com/) - a free MATLAB toolbox for rapid prototyping of optimization problems
- [QETLAB](http://www.qetlab.com/) - a free MATLAB toolbox for quantum entanglement theory

 MATHEMATICA code requires:
- [QI](https://github.com/rogercolbeck/QI) - a free quantum information Mathematica package

The MATLAB code of this repository is: 


- [run_example1.m](https://github.com/mtcq/unitary_channel_discrimination/blob/main/UnitaryChannelDiscrimination/run_example1.m):
Script used to calculate the success probabiltiies presented in Example 1 of the paper.

- [run_example2.m](https://github.com/mtcq/unitary_channel_discrimination/blob/main/UnitaryChannelDiscrimination/run_example2.m):
Script used to calculate the success probabiltiies presented in Example 2 of the paper.

- [run_example2.m](https://github.com/mtcq/unitary_channel_discrimination/blob/main/UnitaryChannelDiscrimination/run_example3.m):
Script used to calculate the success probabiltiies presented in Example 3 of the paper.

- [channel_discrimination_2copies_primal.m](hhttps://github.com/mtcq/unitary_channel_discrimination/blob/main/UnitaryChannelDiscrimination/channel_discrimination_2copies_primal.m):
Primal SDP to calculate maximal success probability of discriminating a set of quantum channels when two copies of the channel are available.
The user may impose the restrictions of Parallel, Sequential, Separable, or General strategies.

- [channel_discrimination_2copies_dual](https://github.com/mtcq/unitary_channel_discrimination/blob/main/UnitaryChannelDiscrimination/channel_discrimination_2copies_dual.m):
Dual SDP to calculate maximal success probability of discriminating a set of quantum channels when two copies of the channel are available.
The user may impose the restrictions of Parallel, Sequential, Separable, or General strategies.

- [channel_discrimination_3copies_primal.m](hhttps://github.com/mtcq/unitary_channel_discrimination/blob/main/UnitaryChannelDiscrimination/channel_discrimination_3copies_primal.m):
Primal SDP to calculate maximal success probability of discriminating a set of quantum channels when three copies of the channel are available.
The user may impose the restrictions of Parallel, Sequential, or General strategies.

- [channel_discrimination_3copies_dual](https://github.com/mtcq/unitary_channel_discrimination/blob/main/UnitaryChannelDiscrimination/channel_discrimination_3copies_dual.m):
Dual SDP to calculate maximal success probability of discriminating a set of quantum channels when three copies of the channel are available.
The user may impose the restrictions of Parallel, Sequential, or General strategies.

- [TR.m](https://github.com/mtcq/unitary_channel_discrimination/blob/main/UnitaryChannelDiscrimination/TR.m):
Function that implements the trace-and-replace map on matrices.


The mathematica code of this repository is: 

- [LoadFunctions.nb](https://github.com/mtcq/unitary_channel_discrimination/blob/main/UnitaryChannelDiscrimination/LoadFunctions.nb):
Notebook used to load important functions.

- [LoadVariablesEx1.nb](https://github.com/mtcq/unitary_channel_discrimination/blob/main/UnitaryChannelDiscrimination/LoadVariablesEx1.nb):
Notebook used to load important variables for Example 1.
- [LoadVariablesEx2.nb](https://github.com/mtcq/unitary_channel_discrimination/blob/main/UnitaryChannelDiscrimination/LoadVariablesEx2.nb):
Notebook used to load important variables for Example 2.
- [LoadVariablesEx3.nb](https://github.com/mtcq/unitary_channel_discrimination/blob/main/UnitaryChannelDiscrimination/LoadVariablesEx3.nb):
Notebook used to load important variables for Example 3.

- [ComputerAssistedEx1.nb](https://github.com/mtcq/unitary_channel_discrimination/blob/main/UnitaryChannelDiscrimination/ComputerAssistedEx1.nb):
Notebook used to prove results involved in Example 1.
- [ComputerAssistedEx2.nb](https://github.com/mtcq/unitary_channel_discrimination/blob/main/UnitaryChannelDiscrimination/ComputerAssistedEx2.nb):
Notebook used to prove results involved in Example 2.
- [ComputerAssistedEx3.nb](https://github.com/mtcq/unitary_channel_discrimination/blob/main/UnitaryChannelDiscrimination/ComputerAssistedEx3.nb):
Notebook used to prove results involved in Example 3.

This repository also includes the folders MatlabExample1, MatlabExample3, and MatlabExample3 , which contain important variables used in the computer assited proof written in mathematica notebooks. Note that the MATLAB script creates this folder and all the variables included on it, hence if you run the MATLAB code before the computer assistem mathematica notebook, this folder is not required.
