function dists = CosineSimilarity_Distance(testX, trainX)
%     Compute the Cosine Similarity distance between the 
%     current test sample and all training samples
%
% 	  testX: a single feature vector (test)
% 	  trainX: a matrix containing the set of training samples
%     dists: vector of the distances from the training samples

% ADD your code here
testX = repmat(testX,size(trainX,1),1);
xy   = dot(testX,trainX);
nx   = norm(testX);
ny   = norm(trainX);
nxny = nx*ny;
dists   = xy/nxny;
end
