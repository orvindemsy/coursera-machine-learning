function [J, grad] = linearRegCostFunction(X, y, theta, lambda)
%LINEARREGCOSTFUNCTION Compute cost and gradient for regularized linear 
%regression with multiple variables
%   [J, grad] = LINEARREGCOSTFUNCTION(X, y, theta, lambda) computes the 
%   cost of using theta as the parameter for linear regression to fit the 
%   data points in X and y. Returns the cost in J and the gradient in grad

% Initialize some useful values
m = length(y); % number of training examples
n = length(theta); %number of features

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost and gradient of regularized linear 
%               regression for a particular choice of theta.
%
%               You should set J to the cost and grad to the gradient.
%

%Regularized Linear Regression Cost Function
h = X * theta; %hyphothesis
J = 1/(2*m) * (sum((h - y).^2)) + lambda/(2*m) * (sum(theta(2:end).^2));


%Regularized Linear Regression Gradient
grad(1) = 1/m * sum((h - y) .* X(:,1));

%Without for loop
%2 Aug 2019, cannot submit error using '+', why??
%grad(2:end) = (1/m * (h' * X(:,2:end) - y' * X(:,2:end))) + (lambda/m * theta(2:end));


for j = 2:n
    grad(j) = (1/m * sum((h - y)' * X(:,j))) + (lambda/m * theta(j));
end

% =========================================================================

grad = grad(:);

end
