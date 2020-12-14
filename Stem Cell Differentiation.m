close all
clear all
clc 

syms U(t) D(t) g_c g_u g_d 

dU = diff(U) == (g_u*U) - (g_c*U);
dD = diff(D) == (g_d*D) + (g_c*U);
eqs = [dU; dD];

%Solve the system of ODEs
%Find analytical expressions for U(t) and D(t) if U(0) = 20, D(0) = 0
F = dsolve(eqs, U(0)==20, D(0)==0);

U(t) = F.U %U(t) = 20*exp(-t*(g_c - g_u))
D(t) = F.D %D(t) = (20*g_c*exp(g_d*t))/(g_c + g_d - g_u) - (20*g_c*exp(-t*(g_c - g_u)))/(g_c + g_d - g_u)

%Fit the D(t) function to the experimental data below
%Determine the g_c g_u g_d rates for two substrates

t_gelatin = [2 4 6];
num_cells_gelatin = [0 3 14];
t_gelatin_FGF4 = [1 4 6];
num_cells_gelatin_FGF4 = [0 5 20];

%Predict the numbers, U(t = day 8) and D(t = day 8)
t = 8;

%Using values fitted equation for gelatin substate data
g_c = 0.06633;
g_d = 0.8089;
g_u = -11.25;

U_8_gelatin = 20*exp(-t*(g_c - g_u))
D_8_gelatin = (20*g_c*exp(g_d*t))/(g_c + g_d - g_u) - (20*g_c*exp(-t*(g_c - g_u)))/(g_c + g_d - g_u)

%Using values fitted equation for gelatin + FGF4 substate data
g_c = 0.3392;
g_d = 0.711;
g_u = -23.08;

U_8_gelatin_FGF4 = 20*exp(-t*(g_c - g_u))
D_8_gelatin_FGF4 = (20*g_c*exp(g_d*t))/(g_c + g_d - g_u) - (20*g_c*exp(-t*(g_c - g_u)))/(g_c + g_d - g_u)