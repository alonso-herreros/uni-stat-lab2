%% == 1000 coin tosses, Heads 40% ==
disp('== 1000 coin tosses, Heads 40% ==');
n = 1000; p = 0.4;
u = rand(n,1);
m = 1*(u <= p);
disp("Mean value: " + mean(m));

disp(" ");


%% == 10 coin tosses, Heads 40%, locate the heads ==
disp('== 10 coin tosses, Heads 40%, locate the heads ==');
n = 10; p=0.4;
u = rand(n,1);
m = 1*(u<=p)+0*(u>p);
toss = (1:n)';
data = [toss m];
heads_locations = data(data(:,2)==1);
disp("Heads locations: ");
disp(heads_locations);

disp(" ");


%% == Rain probability ==
disp('== Rain probability ==');
p=0.5;
prob_theoretical = p+p-p^2;
disp("By calculation: " + prob_theoretical);
% By simulation:
n=10000;
u=rand(n,2) ; % simulate 2 columns (saturday and sunday)
x=(u<=p); % if u<=p, takes the value 1 and 0 otherwise
w=(x(:,1)==1 | x(:,2)==1); % if it rains on saturday, sunday, or both then w=1. w=0 otherwise
prob=sum(w)/n;
disp("By simulation: " + prob);% should be approx 0.75

disp(" ");


%% == Serial system reliability ==
disp('== Serial system reliability ==');
p=1-0.05;
prob_theoretical = p^5;
disp("By calculation: " + prob_theoretical);
% By simulation:
n=10000;
u=rand(n,5);
x=(u<=p);
w=(x(:,1)==1 & x(:,2)==1 & x(:,3)==1 & x(:,4)==1 & x(:,5)==1);
prob = sum(w)/n; % should be aprox. 0.7738
disp("By simulation: " + prob);% should be approx 0.75

disp(" ");


%% == Conditional probability: defective phones ==
disp('== Conditional probability: defective phones ==');

% 1. Simulate n mobile phones (for example: n = 10000). We know that the 30 % are defective (and 70 % are not defective).
n=10000;
n_def=0.3*n; % nº of defective
n_no_def=0.7*n; % nº of non defective

% 2. We create a vector M, constructed by DEF and NDEF, which takes values 1 if the phone is defective and 0 otherwise.
DEF=ones(n_def,1);
NDEF=zeros(n_no_def,1);
M=[DEF ; NDEF];

% 3. Generate random numbers by means of command rand, of size n_def and n_no_def.
u_def=rand(n_def,1);
u_no_def=rand(n_no_def,1);

% 4. Using a boolean condition, and provided the probabilities P(R|D) = 0.9 and P(R|D¯) = 0.2, we create the vector R,
% which indicates whether the robot detects the failure and it actually is (1) and 0 if it detects a failure when it is not.
R_DEF=1*(u_def<=0.9) + 0*(u_def>0.9);
R_NDEF=1*(u_no_def<=0.2) + 0*(u_no_def>0.2);
R=[R_DEF ; R_NDEF];

% 5. Finally, we create the matrix datos, which contains in the first column the vector M and the vector R in the second. 
% Therefore we can approximate the probability P(D¯|R¯), counting how many times R = 0 and M = 0, we can use command find.
datos = [ M R ];
AIKON = datos(datos(:,2)==0);
tabulate(AIKON)

disp(" ");


