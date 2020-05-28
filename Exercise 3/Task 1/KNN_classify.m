function [test_z] = KNN_classify(k, train_f, train_y, test_f, dtype)
   % K-NN classification algorithm
   % k: Number of nearest neighbours
   % train_f: The matrix of training feature vectors
   % train_y: The labels of the training data
   % test_f: The matrix of the test feature vectors
   % dtype: Integer which defines the distance metric
   %    dtype=1: Call the function Euclidean_Distance
   %    dtype=2: Call the function CosineSimilarity_Distance
 
   % Add your code here
test_z = 0;
    for i=1:size(test_f,1)
        if dtype == 1
            d = Euclidean_Distance(test_f(i,:),train_f);
        else
            d = CosineSimilarity_Distance(test_f(i,:),train_f);
        end

        % sort 
        [v,idx] = sort(d);
		
        % find labels
        test_z = [test_z; mode(train_y(idx(1:k),1))];
    end
test_z = test_z(2: end);
end
   
 
