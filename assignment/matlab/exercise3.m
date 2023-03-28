%% Inverse transformation
disp('== 3. Inverse transformation ==');
% Distribution function F(x) is given by
%        { 0              if x < 0
% F(x) = { x^2/2          if 0 <= x <= 1
%        { 1 - (2-x)^2/2  if 1 < x <= 2
%        { 1              if x > 2
F = @(x) (x.^2/2).*(x>=0 & x<=1) + (1-(2-x).^2/2).*(x>1 & x<=2);

% Density function f(x) is dF(x)/dx
%        { 0               if x < 0
% f(x) = { x               if 0 <= x <= 1
%        { 2 - x           if 1 < x <= 2
%        { 0               if x > 2
f = @(x) (x).*(x>=0 & x<=1) + (2-x).*(x>1 & x<=2);

disp("a) Analytical expression for the density function");
disp("(This will be done in the report, it's not worth it to try and get matlab to do it...)");
disp(" ");

disp("b) Pseudocode for the inverse transformation method");
disp("Each random number will be generated the following way:");
disp("1. Generate a random number u in the interval [0,1]");
disp("2. Calculate x = F^-1(u)");
disp("3. Return x");
disp(" ");

disp("c) Matlab code for the inverse transformation method");
% Simulate X for F(x)
% u1 = x^2/2 => x = sqrt(2*u1)
% u2 = 1 - (2-x)^2/2 => x = 2 - sqrt(2*(1-u2))
%           { 0                  if u <= 0
% F^-1(u) = { sqrt(2*u)          if u <= 1/2
%           { 2 - sqrt(2*(1-u))  if u > 1/2
%           { 0                  if u > 1
F_1 = @(x) (x<=0.5).*sqrt(2*x) + (x>0.5).*(2-sqrt(2*(1-x)));
n = 1000;
u = rand(n,1);
x = F_1(u);
disp(" ");

disp("d) Compute E(X) and Var(X)");
mean_theor = integral(@(x) x.*f(x), -100, 100);
var_theor = integral(@(x) ((x-mean_theor).^2).*f(x), -100, 100);

disp("Theoretical: mean = " + mean_theor + ", variance = " + var_theor);
disp("Simulated: mean = " + mean(x) + ", variance = " + var(x));

