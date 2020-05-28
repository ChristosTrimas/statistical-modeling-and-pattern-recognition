function [newVocabulary, newTermEntropy, new_f] = GetNewVocabulary(r, Vocabulary, e, f)
    %Return the top r words in the Vocabulary (newVocabulary) 
    %    based on their entropy value
    %Also return 
    %   newTermEntropy: their corresponding Entropy value
    %   new_f: the new Term Document Matrix based on the
    %                newVocabulary

    % ADD Your Code Here
%all entropies
[entropies,idx_e] = sort(e(:),'descend');
[~,c] = ind2sub(size(e),idx_e(1:r));

%the new 300 words vocabulary
for i=1:r
    newVocabulary(i,:) = Vocabulary(c(i),:)';
end

%best 300 entropies
newTermEntropy = entropies(1:r,1);
for i=1:r
    new_f(:,i) = f(:,c(i));
end

new_f = tfidf(new_f,1);

end