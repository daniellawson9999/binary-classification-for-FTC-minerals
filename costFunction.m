function [J, grad] = costFunction(theta, X, y)

m = length(y); % number of training examples

J = 0;
grad = zeros(size(theta));

%
h = sigmoid(X*theta);
J = sum( (-y' * log(h)) - ((1 - y') * log(1 - h))) / m;

grad = (X' * (h - y)) / m;




end
