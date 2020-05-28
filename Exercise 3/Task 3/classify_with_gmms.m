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
    tmp(j) = log(sum(Pm(j)*mvnpdf(x,M,S)));
end

index = max(tmp);
[~,y] = find(tmp==index);

end

