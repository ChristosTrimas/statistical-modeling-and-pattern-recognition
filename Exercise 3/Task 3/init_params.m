function [pMiu,pPi,pSigma] = init_params(mu,K,d,X,N)
pMiu = mu; 
pPi = zeros(1, K); 
pSigma = zeros(d, d, K); 

distmat = repmat(sum(X.*X, 2), 1, K) + repmat(sum(pMiu.*pMiu, 2)', N, 1) - 2*X*pMiu';
[~, labels] = min(distmat, [], 2);%Return the minimum from each row

for k=1:K
    Xk = X(labels == k, :);
    pPi(k) = size(Xk, 1)/N;
    pSigma(:, :, k) = cov(Xk);
end
end