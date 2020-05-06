close all;
clear;
clc;

C = 10; % Choose C = 0.01, 0.1, 1, 10, 100, 1000, 10000

load('C:\Users\user\Desktop\exercises_2\exercise2_7/twofeature1.txt');
n = size(twofeature1, 1) ; % leave out the last example
y = twofeature1(1:n, 1);
X = twofeature1(1:n, 2:3);

Xpos = X(y == 1, :); % positive examples
Xneg = X(y == -1, :); % negative examples

%  Visualize the example dataset
hold on
plot(Xpos(:, 1), Xpos(:, 2), 'b.');
plot(Xneg(:, 1), Xneg(:, 2), 'r.');
hold off
axis square;

% Form the matrices for the quadratic optimization. See the matlab manual for "quadprog"
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
H = zeros(n, n);

for i = 1 : n
    for j = i : n
        H(i,j) = y(i)*y(j)*X(i,:)*X(j,:)';
        H(j,i) = H(i,j);
    end
end

f = -ones(n,1);

A = [];

b = [];

Aeq = y';

beq = 0;

lb = zeros(n,1);

ub = C*ones(n,1);

lambda = quadprog(H, f, A, b, Aeq, beq,lb,ub); % Find the Lagrange multipliers
indices = find(lambda > 0.0001 & C>=lambda); % Find the support vectors

Xsup = X(indices , :) ; % The support vectors only 
ysup = y(indices ,:);
lambdasup = lambda(indices);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Find the bias term w0
w0 = y(indices(1)) - sum((lambda.*y).*(X*X(indices(1),:)'));

% Find the weights
w = sum(((lambda.*y)*ones(1,size(X,2))).*X);

% Plot support vectors
Xsup_pos = Xsup(ysup == 1, :);
Xsup_neg = Xsup(ysup == -1, :);

hold on
plot(Xsup_pos(:, 1), Xsup_pos(:, 2), 'bo');
plot(Xsup_neg(:, 1), Xsup_neg(:, 2), 'ro');

maxnorm = max(norm(w(1)),norm(w(2)));
x  = 0:0.000001:5;

width1 = -w0 / maxnorm; 
sv1 = x * (-1 .* w(1) / w(2)) + width1;

width2 = (-w0 + 1) / maxnorm;
sv2 = x * (-1 .* w(1) / w(2)) + width2;

width3 = (-w0 - 1) / maxnorm;
sv3 = x * (-1 .* w(1) / w(2)) + width3;


%plotting "hyperplane" and support vectors
plot(x, sv1, 'k-')
plot(x, sv2, 'k--')
plot(x, sv3,'k--')


