clc
clear all;
close all;

load fisheriris.mat
iris_labels = 1*cellfun(@(x)isequal(x,'versicolor'),species)+2*cellfun(@(x)isequal(x,'virginica'),species);
X = meas;
N = size(X, 1); % number of examples

K = 3; % Number of classes

[Pm, M, S] = fitGMMs(X, K);
Y_hat = zeros(N, 1);

for i = 1:N
    Y_hat(i, 1) = classify_with_gmms(X(i, :), Pm, M, S)-1;
end

tmp = length(find(Y_hat==iris_labels));
accuracy_GMM = tmp/size(Y_hat,1)

Y_hat_2 = zeros(N,1);
Y_hat_2 = kmeans(X,K);

tmp_2 = length(find(Y_hat_2==iris_labels));
accuracy_kmeans = tmp_2/size(Y_hat,1)
