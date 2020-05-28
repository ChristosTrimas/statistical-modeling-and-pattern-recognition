function [Px,Xshift] = gaussian(N,X,pMiu,pSigma,d)
%returns the pdf value of point x, where m determines the mean and
%S determines the covariance of the multivariate normal distribution.
% your code here

%Gaussian posterior probability 
%N(x|pMiu,pSigma) = 1/((2pi)^(D/2))*(1/(abs(sigma))^0.5)*exp(-1/2*(x-pMiu)'pSigma^(-1)*(x-pMiu))

Px = zeros(N, 1);

Xshift = X-repmat(pMiu(1, :), N, 1); %X-pMiu

inv_pSigma = (pSigma(:, :, 1));

tmp = sum((Xshift/inv_pSigma) .* Xshift, 2);

coef = (2*pi)^(-d/2) * sqrt(det(inv_pSigma));

Px(:, 1) = coef * exp(-0.5*tmp);

end