data_file = 'C:\Users\user\Desktop\pset_1\exer_1_3_4\scripts\exercise1_4/data/mnist.mat';

data = load(data_file);

images = zeros(size(data.trainX, 1), 28, 28);
labels = zeros(size(data.trainY, 2),1);

for i = 1:size(data.trainX, 1)
    img = data.trainX(i, :);
    images(i, :, :) = reshape(img, 28, 28)';
    labels(i) = data.trainY(i);
end

digit_C1_indices = find(labels == 1); % digit 1
digit_C2_indices = find(labels == 2); % digit 2

digit_C1_images = images(digit_C1_indices, :, :);
digit_C2_images = images(digit_C2_indices, :, :);


 aRatios = zeros(size(img, 1)); % 
 aRatios_2 = aRatios;
% Compute the aspect ratios of all images and store the value of the i-th image in aRatios(i)
for i=1:size(digit_C1_images)
    aRatios(i) = computeAspectRatio(digit_C1_images(i,:,:));
end
a = sort(aRatios,'descend'); %a(1) max ratio and last a is the minimum for C1

for j=1:size(digit_C2_images)
    aRatios_2(j) = computeAspectRatio(digit_C2_images(j,:,:));
end
b = sort(aRatios_2,'descend');%same as before

%now I will find the minimum and the maximum ratio from both C1 and C2
if a(i) > b(j)
    minAspectRatio = b(j);
else
    minAspectRatio = a(i);
end

if a(1)>b(1)
    maxAspectRatio = a(1);
else
    maxAspectRatio = b(1);
end

% %the subspaces 
tmp = ((maxAspectRatio-minAspectRatio)/3); %helping variable
L = [minAspectRatio (tmp+minAspectRatio)];
M = [(tmp+minAspectRatio+0.0001) (2*tmp+minAspectRatio)];
H = [(2*tmp+minAspectRatio+0.0001) (maxAspectRatio)];

numBins = 3;

binEnds = linspace(minAspectRatio, maxAspectRatio, numBins+1);

C1_bins = zeros(numBins, 1);
C2_bins = zeros(numBins, 1);
all_bins = zeros(numBins, 1);

% Use the findBin function to get the counts for the histogram
for i=1:size(digit_C1_images) 
    C1_bins = C1_bins + findBin(aRatios(i), binEnds);
end

for i=1:size(digit_C2_images) 
    C2_bins = C2_bins + findBin(aRatios_2(i), binEnds);
end

all_bins = C1_bins + C2_bins;

% Prior Probabilities
PC1 = size(digit_C1_images) / (size(digit_C1_images)+size(digit_C2_images)) %P(C1)
PC2 = size(digit_C2_images) / (size(digit_C1_images)+size(digit_C2_images)) %P(C2)

% % Likelihoods
PgivenC1_L = C1_bins(1) / size(digit_C1_images,1) %P(L|C1)
PgivenC1_M = C1_bins(2) / size(digit_C1_images,1) %P(M|C1)
PgivenC1_H = C1_bins(3) / size(digit_C1_images,1) %P(H|C1)
PgivenC1 = [PgivenC1_L PgivenC1_M PgivenC1_H]'

PgivenC2_L = C2_bins(1) / size(digit_C2_images,1) %P(L|C2)
PgivenC2_M = C2_bins(2) / size(digit_C2_images,1) %P(M|C2)
PgivenC2_H = C2_bins(3) / size(digit_C2_images,1) %P(H|C2)
PgivenC2 = [PgivenC2_L PgivenC2_M PgivenC2_H]'

% % Evidence 
% Multiplication Rule
P_L = PgivenC1_L*PC1 + PgivenC2_L*PC2
P_M = PgivenC1_M*PC1 + PgivenC2_M*PC2
P_H = PgivenC1_H*PC1 + PgivenC2_H*PC2

% % Posterior Probabilities
% Bayes theorem or posterior = likelihood x prior
PC1givenL = (PgivenC1_L*PC1)/P_L
PC2givenL = (PgivenC2_L*PC2)/P_L