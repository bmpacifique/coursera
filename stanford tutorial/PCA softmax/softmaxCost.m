function [cost, grad] = softmaxCost(theta, numClasses, inputSize, lambda, data, labels)

% numClasses - the number of classes 
% inputSize - the size N of the input vector
% lambda - weight decay parameter
% data - the N x M input matrix, where each column data(:, i) corresponds to
%        a single test set
% labels - an M x 1 matrix containing the labels corresponding for the input data
%

% Unroll the parameters from theta
theta = reshape(theta, numClasses, inputSize);

numCases = size(data, 2);

groundTruth = full(sparse(labels, 1:numCases, 1));
cost = 0;

thetagrad = zeros(numClasses, inputSize);

%% ---------- YOUR CODE HERE --------------------------------------
%  Instructions: Compute the cost and gradient for softmax regression.
%                You need to compute thetagrad and cost.
%                The groundTruth matrix might come in handy.


M=theta*data;
sumexp = bsxfun(@minus, M, max(M));
M=exp(sumexp);
%sumexp=sum(sumexp);
M = bsxfun(@rdivide, M, sum(M));
%log(tmp./repmat(sumexp,size(tmp,1),1)))
cost=-sum(sum(groundTruth.*log(M)))/numClasses+lambda/2*sum(sum(theta.^2));


% for i=1:numCases
%     for j=1:numClasses
%         cost=cost-sum(groundTruth(j,i)*log(exp(theta(j,:)*data(:,i))./sumexp(i,j)));
%     end
% end
% cost=cost/numClasses;

thetagrad=


% ------------------------------------------------------------------
% Unroll the gradient matrices into a vector for minFunc
grad = [thetagrad(:)];
end

