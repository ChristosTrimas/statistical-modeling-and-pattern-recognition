function [Pm, M, S] = fitGMMs(X, K)
    %
    % INPUT:
    %   X: (N X d) N example vectors of dimension d
    %   K: number of GMM components
    %
    % OUTPUT:
    %   Pm: (K X 1) mixing probabilities
    %   M: (K X d) mean vectors
    %   S: (K X d X d) covariance matrices 
      
    [N, d] = size(X);
    
    % Initialize using kmeans. You may use the matlab kmeans.

    % your code here        
    G = zeros(N, K); % likelihood of classes given features
    [idx,mu] = kmeans(X,K);
    [pMiu,pPi,pSigma] = init_params();
    for its = 1:100
        % E-step. Calculation of likelihood 'G'
        % your code here     
        Px = real(calc_prob());     % size=Px(N, K);
        Px(isnan(Px))=0;
        Px(isnan(Px))=0; 
        G = Px .* repmat(pPi, N, 1); %numerator  = pi(k) * N(xi | pMiu(k), pSigma(k))
        G = G ./ repmat(sum(G, 2), 1, K); %denominator = pi(j) * N(xi | pMiu(j), pSigma(j))sum over j
        % Likelihood normalization (of G)

        % M-step. Parameter updates
        % your code here
        
        Nk = sum(G, 1);    %number of samples in each cluster
        Nk(isnan(Nk))=0;
        Nk(isinf(Nk))=0;
        pMiu = diag(1./Nk) * G' * X; %update pMiu through MLE
        pPi = Nk/N;
        
        for t = 1:K 
            Xshift = X-repmat(pMiu(t, :), N, 1);
            pSigma(:, :, t) = (Xshift' * ...
                (diag(G(:, t)) * Xshift)) / Nk(t);
        end
        
        Pm = pPi; 
        M = pMiu;
        S = pSigma;
    end
        function [pMiu,pPi,pSigma] = init_params()
            pMiu = mu; 
            pPi = zeros(1, K); 
            pSigma = zeros(d, d, K); 


            distmat = repmat(sum(X.*X, 2), 1, K) + ... 
                repmat(sum(pMiu.*pMiu, 2)', N, 1) - ...
                2*X*pMiu';
            [~, labels] = min(distmat, [], 2);%Return the minimum from each row

            for k=1:K
                Xk = X(labels == k, :);
                pPi(k) = size(Xk, 1)/N;
                pSigma(:, :, k) = cov(Xk);
            end
        end
    
    function Px = calc_prob() 
        %Gaussian posterior probability 
        %N(x|pMiu,pSigma) = 1/((2pi)^(D/2))*(1/(abs(sigma))^0.5)*exp(-1/2*(x-pMiu)'pSigma^(-1)*(x-pMiu))
        Px = zeros(N, 1);
        for k = 1:1
            Xshift = X-repmat(pMiu(k, :), N, 1); %X-pMiu
            inv_pSigma = inv(pSigma(:, :, k));
            tmp = sum((Xshift*inv_pSigma) .* Xshift, 2);
            coef = (2*pi)^(-d/2) * sqrt(det(inv_pSigma));
            Px(:, 1) = coef * exp(-0.5*tmp);
        end
    end
end
