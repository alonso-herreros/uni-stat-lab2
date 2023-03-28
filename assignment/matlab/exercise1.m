%% Circuit reliability
disp('== 1. Circuit reliability ==');

n = 10000;
pA = 0.8; pB = 0.85;pC = 0.75; pD = 0.75; pE = 0.75; pF = 0.75;
x = (rand(n,1)<pA) & (rand(n,1)<pB) & ((rand(n,1)<pC) | (rand(n,1)<pD));

disp("a) Probability of working");
prob_theoretical = pA*pB*(pC+pD-pC*pD);
prob = mean(x);
disp("By calculation: " + prob_theoretical);
disp("By simulation: " + prob);
disp(" ");

disp("b) Components E and F added to subsystem CD"); % I will assume that E and F are added in parallel.
prob2_theoretical = pA*pB*(pC+pD+pE+pF-pC*pD-pC*pE-pC*pF-pD*pE-pD*pF-pE*pF+pC*pD*pE+pC*pD*pF+pC*pE*pF+pD*pE*pF-pC*pD*pE*pF);
prob2_inc_theoretical = prob2_theoretical / prob_theoretical - 1;
disp("Theoretical increase: " + prob2_inc_theoretical*100 + "%");

x2 = (rand(n,1)<pA) & (rand(n,1)<pB) & ((rand(n,1)<pC) | (rand(n,1)<pD) | (rand(n,1)<pE) | (rand(n,1)<pF));
prob2 = mean(x2);
prob2_inc = prob2 / prob - 1;
disp("Simulated increase: " + prob2_inc*100 + "%"); 
disp(" ");


disp("c) Changing the working probabilities of A and B or C and D");
pA_ = pA + 0.1;
pB_ = pB + 0.1;
x3 = (rand(n,1)<pA_) & (rand(n,1)<pB_) & ((rand(n,1)<pC) | (rand(n,1)<pD));
prob3 = mean(x3);
prob3_inc = prob3 / prob - 1;
disp("Simulated increase with working probabilities of A and B increased: " + prob3_inc*100 + "%");

pC_ = pC + 0.2;
pD_ = pD + 0.2;
x4 = (rand(n,1)<pA) & (rand(n,1)<pB) & ((rand(n,1)<pC_) | (rand(n,1)<pD_));
prob4 = mean(x4);
prob4_inc = prob4 / prob - 1;
disp("Simulated increase with working probabilities of C and D increased: " + prob4_inc*100 + "%"); % The increase in probability is smaller than the previous case.

