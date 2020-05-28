function [e]=getWordEntropy(f)
    %Calculate the vector of word entropies e 
    %from the Term Frequency matrix f
    %Add your code here
    %nT = 4749, nD = 1369
for i = 1:1369
    for j = 1:4749
        p(i,j) = f(i,j)./sum(f(:,j));
        if p(i,j) == 0
            p(i,j) = 0.0000001;
        else
            p(i,j) = p(i,j)*log(p(i,j));
        end
    end
end

%entropies
for j = 1:4749
    e(1,j) = 1 + sum(p(:,j))/log(1369);
end

end