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
    [~,mu] = kmeans(X,K);
    [pMiu,pPi,pSigma] = init_params(mu,K,d,X,N);
    for its = 1:100
        % E-step. Calculation of likelihood 'G'
        % your code here     
        Px = real(gaussian(N,X,pMiu,pSigma,d));     % size=Px(N, K);
        Px(isnan(Px))=0;
        Px(isnan(Px))=0; 
        G = Px .* repmat(pPi, N, 1); %numerator  = pi(k) * N(xi | pMiu(k), pSigma(k))
        G = G ./ repmat(sum(G, 2), 1, K); %denominator = pi(j) * N(xi | pMiu(j), pSigma(j))sum over j
        % Likelihood normalization (of G)

        % M-step. Parameter updates
        % your code here
        
        Nk = sum(G, 1);    %number of samples in each cluster
        pMiu = diag(1./Nk) * G' * X; %update pMiu through MLE
        pPi = Nk/N;
        
        for t = 1:K 
            Xshift = X-repmat(pMiu(t, :), N, 1);
            pSigma(:,:,t) = (Xshift'*(diag(G(:, t)) * Xshift)) / Nk(t);
        end
        
        Pm = pPi; 
        M = pMiu;
        S = pSigma;
    end
end
