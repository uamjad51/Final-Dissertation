# Final-Dissertation - Muhammad Usman 
Modelling for Prediction of Hydraulic Jumps including Negative Gravity

For grid stretching the $x(Y)$ values are scaled in the subroutine gridy so when are first defined they lie in the range [0,1]. This code runs well with 100 points in range [0,20] for y.Plotting has been removed and put in its own routine. It solves for the Pressure Displacement law $P=(\texttt{pas})A+A_{XX}$ with $\texttt{pas} = -s$, and $gamma = \texttt{pagamma}$. The Pressure Displacement law affects the routines $\texttt{uvinitiblgeneralexp, odedefgeneral}$. The routine $\texttt{uvinitiblgeneralexp}$ allows for the phase of the initial pressure kick to be varied. The phase is pkickphase. The plotting routines have been altered to allow for automatic captioning depending on values of $\texttt{pas}$ and $\texttt{pagamma}$. Also the plotting routines have been altered to save figures and fig files and pdf files. After the calculation has finished, the workspace is saved. These calculations can take some time and we want to avoid having to redo them. \href{https://uk.mathworks.com/help/matlab/ref/save.html}{As referred here.}

The purpose of each function is such that, 

q_solver.m: The code is used to find the values of $q$ for the equation $-s + \gamma q^2 +3c/q^{1/3} = 0$ by varying the values of $s$ and $\gamma$. 

TripleDeckGeneral.m: Calls for NAG routine to solve the system of PDEs and ODEs using refined Keller Box Scheme. 

odedefgeneral.m: Definition of Pressure Displacement law for $P=-sA+\gamma A_{XX}$.

bndaryibl.m: Standard $U=V=0$ at $0, U \rightarrow Y + A$, $A$ is kept in $\texttt{v(1)}$.

pdedefibl.m: Standard initial boundary layer equations and grid stretching implied.

uvinitiblgeneralexp.m: 
             $P=-sA+\gamma A_{XX}$ law with exponential start. 
             Grid stretching. 
             Allow for pkick to be complex for phase variation of pkick.

gridy.m: Code allows for stretched grids in y. This defines the stretching function and its derivatives.

initialprofile.m: This code calculates the initial profiles for exponential departure.

monitf.m: The code is required by NAG routine to monitor errors for possible grid remesh.

flare.m: This ensures implementation of FLARE approximation.

calct.m: The piece of code  calculates $\tau$ in linearised solution.

integt.m: The code integrates $\tau$ to $u$ for linearised solution.

integintegt.m: The code integrates $u$ to find $\psi$ for linearised solutions. 

plotting.m: This section solely focuses on plotting of the solutions found. 

pdfplot.m: The section saves all the figures as pdf.  

tidyafterfail.m: This is to be run after the NAG routine fails with a non zero error indicator. It runs the last few lines of \texttt{TripleDeckGeneral.m} to prepare of plotting and save data.

q_solver.m: 
