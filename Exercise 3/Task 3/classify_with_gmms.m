function y = classify_with_gmms(x, Pm, M, S)
    %
    % INPUT:
    %   x: (1 X d) An example vector of dimension d
    %   Pm: (K X 1) mixing probabilities
    %   M: (K X d) mean vectors
    %   S: (K X d X d) covariance matrices
    %
    % OUTPUT:
    %   y:  The class index  

    % your code here
tmp = size(3,1);
    for j=1:3
%         temp(j) = log(Pm(j)*(mvnpdf(x,M(j,:),S(:,:,j))));
          tmp(j) = log(sum(Pm(j)*mvnpdf(x,M,S)));
    end
%    y = y + log(giorgos); 
index = max(tmp);
[k,y] = find(tmp==index);
end

