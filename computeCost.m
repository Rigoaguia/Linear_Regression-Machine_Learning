 function J = computeCost(X, y, theta)
%COMPUTECOST Calcula o Custo da regressão com o parâmetro theta
%   J = COMPUTECOST(X, y, theta) computes the cost of using theta as the
%   parameter for linear regression to fit the data points in X and y

% 
m = length(y); % numero de examplos de treinamento 

% Voce deve preencher a variável J adequadamente
J = 0;
h = X*theta;
eq = (h-y).^2;

J = (1/(2*m))*sum(eq);

%
% =========================================================================

end
