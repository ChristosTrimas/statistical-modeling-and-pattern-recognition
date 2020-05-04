close all
clear all
clc

C = 10; % Choose C = 0.01, 0.1, 1, 10, 100, 1000, 10000

load('C:\Users\user\Desktop\exercises_2\exercise2_7//twofeature2.txt');
n = size(twofeature2, 1); 
y = twofeature2(1:n, 1);
X = twofeature2(1:n, 2:3);

% Form the augmented dataset. 
for i=1:size(X,1)
    Xa(i,1) = X(i,1);
    Xa(i,2) = X(i,2);
    Xa(i,3) = X(i,1)^2 + X(i,2)^2;
end

Xpos = Xa(y==1, :); % positive examples
Xneg = Xa(y==-1, :); % negative examples

%  Visualize the example dataset
hold on
plot(Xpos(:, 1), Xpos(:, 2), 'b.');
plot(Xneg(:, 1), Xneg(:, 2), 'r.');
hold off
axis square;

% Form the matrices for the quadratic optimization. See the matlab manual for "quadprog"
H = zeros(n, n);

for i = 1 : n
    for j = i : n
        H(i,j) = ((y(i)*y(j))*(Xa(i,:)*Xa(j,:)'));
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

Xsup = Xa(indices , :) ; % The support vectors only 
ysup = y(indices ,:);
lambdasup = lambda(indices);

% Find the bias term w0
w0 = y(indices(1)) - sum((lambda.*y).*(Xa*Xa(indices(1),:)'));

% Find the weights
w = sum(((lambda.*y)*ones(1,size(Xa,2))).*Xa);

% Plot support vectors
Xsup_pos = Xsup(ysup == 1, :);
Xsup_neg = Xsup(ysup == -1, :);

hold on
plot(Xsup_pos(:, 1), Xsup_pos(:, 2), 'bo');
plot(Xsup_neg(:, 1), Xsup_neg(:, 2), 'ro');
hold off


% Plot decision boundary
hold on
for x1 = -1:0.01:1
    for x2 = -1:0.01:1           
        if (abs(w*[x1, x2, (x1^2+x2^2)]' + w0) < 0.01) % fill the 3rd coordinate
           plot(x1, x2, 'k.')
        end
    end
end
hold off


