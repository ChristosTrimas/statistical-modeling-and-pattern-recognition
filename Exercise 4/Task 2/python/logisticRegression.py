# from __future__ import print_function

import numpy as np
import matplotlib.pyplot as plt

# Load data
fid = open('exam_scores_data1.txt', 'r')
lines = fid.readlines()
fid.close()

input_list = []
target_list = []

for line in lines:
    fields = line.rstrip().split(',')
    input_list.append([float(fields[0]), float(fields[1])])
    target_list.append([float(fields[2])])

# Matrix of input features. shape = (num_examples, num_features)
X_all = np.array(input_list, dtype=np.float32)
# Vector of target values. shape = (num_examples, )
Y_all = np.array(target_list, dtype=np.float32)

ones = np.argwhere(Y_all==1)
zeros = np.argwhere(Y_all==0)

plt.figure()
plt.scatter(X_all[ones,0],X_all[ones,1])
plt.scatter(X_all[zeros,0],X_all[zeros,1])
plt.xlabel("Grade 1")
plt.ylabel("Grade 2")
plt.show()

N = X_all.shape[0]  # Number of examples

# Normalize input data
# your code here
m = np.mean(X_all)
s = np.std(X_all)

X_all = (X_all-m)/s
# print(X_all) #works fine
# Define the model
num_features = 2
output_depth = 1
batch_size = 8
learning_rate = 0.001


def sigmoid(z):
    return 1 / (1 + np.exp(-z))

def sigmoid_derivative(z):
	sig = sigmoid(z)
	return sig*(1-sig)


class NeuralNetwork:
    def __init__(self, input_depth, output_depth, learning_rate):
        self.W = np.sqrt(2.0/(input_depth + output_depth)) * \
            np.random.rand(input_depth, output_depth).astype(np.float32)
        self.b = np.zeros((output_depth, ), dtype=np.float32)
        self.learning_rate = learning_rate

    def forward(self, x):
        tmp = np.dot(x,self.W) + self.b
        output = sigmoid(tmp) #calling activation function
        return output

    def backward(self, X, Y, Y_predicted):
        # your code here

        m = X.shape[0]
        dZ = Y_predicted - Y
        dW = 1/m * np.dot(dZ.T,X)
        db = 1/m * np.sum(dZ,axis=1,keepdims=True)
        # Y_predicted_delta = self.loss * sigmoid_derivative(Y_predicted)

        # h_layer_error = Y_predicted_delta.dot(self.W.T) #input to hidden 
        # h_layer_delta_W = h_layer_error * sigmoid_derivative(Y_predicted)
        
        # d_CE_d_W = [X.T.dot(h_layer_delta_W), Y_predicted.T.dot(Y_predicted_delta)]

        # d_CE_d_b = Y_predicted_delta

        # inputs = X.T

        # d_CE_d_W = self.learning_rate * np.dot(inputs, Y_predicted_delta)

        # d_CE_d_b = Y_predicted_delta

        return dW , db

        # m = X.shape[0]

        # dA = -(np.divide(Y,Y_predicted) - np.divide(1-Y,1-Y_predicted))
        # dZ = sigmoid_derivative(dA,X)

        # dW = np.dot(dZ,Y_predicted.T)*(1/m)
        # dB = np.sum(dZ)/m

        # return dW, dB

    def cross_entropy(self, Y, Y_predicted):
        # your code here
        self.loss = -np.mean(np.multiply(Y, np.log(Y_predicted)) + np.multiply((1-Y), np.log(1-Y_predicted)))
        # print("Loss=",loss)
        return self.loss

    def update_weights(self, d_CE_d_W, d_CE_d_b):
        self.W = self.W - self.learning_rate * d_CE_d_W
        self.b = self.b - self.learning_rate * d_CE_d_b

        # self.W = self.W - d_CE_d_W
        # for i in d_CE_d_b:
        # 	self.b = self.b - self.learning_rate * d_CE_d_b



nn = NeuralNetwork(num_features, output_depth, learning_rate)
# print("Weight0=",nn.W)
num_epochs = 55
num_batches = N - batch_size + 1

for epoch in range(num_epochs):
    epoch_loss = 0
    for i in range(num_batches):  # Sliding window of length = batch_size and shift = 1
        X = X_all[i:i+batch_size, :]
        Y = Y_all[i:i+batch_size, :]

        Y_predicted = nn.forward(X)
        batch_loss = nn.cross_entropy(Y, Y_predicted)
        epoch_loss += batch_loss

        d_CE_d_W, d_CE_d_b = nn.backward(X, Y, Y_predicted)
        nn.update_weights(d_CE_d_W, d_CE_d_b)
    epoch_loss /= num_batches
    print('epoch_loss = ', epoch_loss)

# print('wieghts=',nn.W)

# Using the trained model to predict the probabilities of some examples and the compute the accuracy

# Predict the normalized example [45, 85]
# example = (np.array([[45, 85]], dtype=np.float32) - m)/s

# print('Predicting the probabilities of example [45, 85]')
# your code here

# Predict the accuracy of the training examples
# accuracy_np = .... # your code here

# print('accuracy = ', accuracy_np)
