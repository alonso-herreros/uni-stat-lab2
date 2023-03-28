%% Random variable 3
disp('== 4. Random variable 3 ==');
% Density function f(x) of X is given by
% f(x) = { αβx^(β-1) * exp(-αx^β)  if x > 0
%        { 0                       otherwise

disp("a) Generate 100000 values of X for α = 0.2 and β = 0.5");
% Find the distribution function F(x) of X using the inverse transform method
% F(x) = 1 - exp(-αx^β)  if x > 0 
% u = 1 - exp(-αx^β) => -αx^β = ln(1-u) => x^β = -ln(1-u)/α => x = (-ln(1-u)/α)^(1/β)
% F^-1(u) = (-ln(1-u)/α)^(1/β) = (-ln(1-u)/0.2)^(1/0.5) = (-ln(1-u)*5)^2 = 25*ln(1-u)^2
alpha = 0.2;
beta = 0.5;
F_1 = @(u) (-log(1-u)/alpha).^(1/beta);
%F_1 = @(u) 25.*log(1-u).^2;
n = 100000;
u = rand(n,1);
x = F_1(u);
disp(" ");

disp("b) Check if the simulation is correct");
% μ   = E[X]   = α^(-1/β)*Γ(1+1/β)                = 0.2^(-1/0.5)*Γ(1+1/0.5) = 0.2^(-2)*Γ(3) = 1/0.2^2*(2!) = 5^2*2 = 50
% σ^2 = Var[X] = α^(-2/β)*(Γ(1+2/β) - Γ(1+1/β)^2) = 0.2^(-2/0.5)*(Γ(1+2/0.5) - Γ(1+1/0.5)^2) = 0.2^(-4)*(Γ(5) - Γ(3)^2) = 1/0.2^4*(4! - 2^2) = 5^4*(24 - 4) = 625*20 = 12500
theoretical_mean = alpha^(-1/beta)*gamma(1+1/beta);
theoretical_variance = alpha^(-2/beta)*(gamma(1+2/beta) - gamma(1+1/beta)^2);
disp("Theoretical: mean = " + theoretical_mean + ", variance = " + theoretical_variance);
disp("Simulation: mean = " + mean(x) + ", variance = " + var(x));
disp(" ");