%% Random number generation

%% == Tossing 2 coins ==
disp("== Tossing 2 coins ==");
n = 10000;
u1 = rand(n,1);
u2 = rand(n,1);
m1 = 1*(u1<=1/2); % generate n tosses of coins 1 and 2,
m2 = 1*(u2<=1/2); % with equal probability
x = m1 + m2; % x is the sum of tails of both coins
tabulate(x)
tab=tabulate(x); % save the table in variable tab
bar(tab(:,3)) % represent the bar diagram of relative frequencies


% Theoretical values
theoretical_mean = 0*1/4 + 1*1/2 + 2*1/4; % sum(xi*p(xi))
disp("Theoretical mean: " + theoretical_mean);
disp("Simulated mean: " + mean(x));
theoretical_var = (0-1)^2*1/4 + (1-1)^2*1/2 + (2-1)^2*1/4; % sum((xi-m)^2*p(xi))
disp("Theoretical variance: " + theoretical_var);
disp("Simulated variance: " + var(x));
disp(" ");

% == Inverse transform ==
disp("== Inverse transform ==");
% a) Simulate X for: F(x) = 1-e^(-x) if x>=0
% u = 1-e^(-2x) => e^(-2x) = 1-u => -2x = log(1-u) => x = -log(1-u)/2
% F^-1(u) = -log(1-u)/2
n = 1000;
u = rand(n,1);
x = -log(1-u)/2;
histogram(x);

% b) Compute E(X) and Var(X)
disp("E(X) = " + mean(x));
disp("Var(X) = " + var(x));
disp(" ");

% == Rayleigh variable ==
disp("== Rayleigh variable ==");
% a) Simulate 50 values for: f(x) = alpha*x*exp(-alpha*x^2/2) if x>0
% F(x) = 1-exp(-alpha*x^2/2)
% u = 1-exp(-alpha*x^2/2) => exp(-alpha*x^2/2) = 1-u => -alpha*x^2/2 = log(1-u) => x^2 = -2*log(1-u)/alpha => x = sqrt(-2*log(1-u)/alpha)
% F^-1(u) = sqrt(-2*log(1-u)/alpha)
n = 50;
alpha = 0.17;
u = rand(n,1);
x = sqrt(-2/alpha*log(1-u));
theoretical_mean = sqrt(pi/(2*alpha));
disp("Theoretical mean: " + theoretical_mean);
disp("Simulated mean: " + mean(x)); % should approach 3.0397
theoretical_var = (4-pi)/(2*alpha);
disp("Theoretical variance: " + theoretical_var);
disp("Simulated variance: " + var(x)); % should approach 2.5497
disp(" ");


% == Gompertz random variable ==
disp("== Gompertz random variable ==");
% TRUE or FALSE: to simulate 100 values for: F(x) = 1-exp(-exp(x)+1) if x > 0 we can use the following code:
% u = rand(100,1);
% x = -log(1-u);

% u = 1-exp(-exp(x)+1) => exp(-exp(x)+1) = 1-u => exp(x) = 1-log(1-u) => x = log(1-log(1-u))
% So this is FALSE, the correct inverse is x = log(1-log(1-u))
n = 100;
u = rand(n,1);
x = log(1-log(1-u));
disp(" ");


% == Dice game ==
disp("== Dice game ==");
n = 1000;

total = 0;
for i=1:n
    result = numel(intersect(unidrnd(6,1,3), unidrnd(6,1,3)));
    result = result - 1*(result == 0);
    total = total + result;
end

disp("Total money earned: " + total);

