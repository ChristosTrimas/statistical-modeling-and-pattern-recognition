function A = myLDA(Samples, Labels, NewDim)
% Input:    
%   Samples: The Data Samples 
%   Labels: The labels that correspond to the Samples
%   NewDim: The New Dimension of the Feature Vector after applying LDA
% NumFeatures=n1,2,3
% 	A=zeros(NumFeatures,NewDim);

	[NumSamples NumFeatures] = size(Samples);
    NumLabels = length(Labels);
    if(NumSamples ~= NumLabels) 
        fprintf('\nNumber of Samples are not the same with the Number of Labels.\n\n');
        exit
    end
    Classes = unique(Labels);
    NumClasses = length(Classes);  %The number of classes
    %init
    m0 = 0;
    Sw = zeros(size(Samples,2),size(Samples,2));
    St = cov(Samples); %total covariance matrix or total Scatter
    %For each class i
	%Find the necessary statistics
    for i=1:NumClasses
        %Calculate the Class Prior Probability
        P = sum(Labels==i-1)/NumSamples; %the probability of each class 
        %Calculate the Class Mean 
        mu(i,:) = mean(Samples(Labels==i-1,:));
        %Calculate the Within Class Scatter Matrix
        Sw = Sw + (P*cov(Samples(Labels==i-1,:)));
        %Calculate the Global Mean
        m0 = mean(NumFeatures*mu(i,:))+m0;
    end
    %Calculate the Between Class Scatter Matrix
    Sb = St - Sw;
    
    %Eigen matrix EigMat=inv(Sw)*Sb
    EigMat = inv(Sw)*Sb;
    
    %Perform Eigendecomposition
    [evec,eval] = eig(EigMat);
    
    %Select the NewDim eigenvectors corresponding to the top NewDim
    %eigenvalues (Assuming they are NewDim<=NumClasses-1)
	% You need to return the following variable correctly.
	A=zeros(NumFeatures,NewDim);  % Return the LDA projection vectors
    
    if NewDim<=NumClasses-1
        lambda = diag(eval);
        [~,SortOrder] = sort(lambda,'descend');
        A = evec(:,SortOrder);
    else
        error('ERROR')
    end

    

