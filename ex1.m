
%% Inteligencia Artficial - Exercício Prático 1: Regressão Linear

%  Instruções
%  ------------
% 
%  Nesta atividade você alterar os seguintes arquivos:
%
%   
%     plotData.m
%     gradientDescent.m
%     computeCost.m
%     
%
%  Você não deve alterar o código desta atividade.
%
% 

%% Initialization
clear all; close all; clc



%% ======================= Parte 1: Mostrando os dados (plotting) =======================
fprintf('Mostrando os dados ...\n')
data = load('ex1data1.txt');
X = data(:, 1); y = data(:, 2);
m = length(y); % number of training examples

% Plot Data
% Note: Você deve completar o arquivo plotData.m
plotData(X, y);

fprintf('Programa pausado. Aperte enter para continuar.\n');
pause;

%% =================== Parte 2: Descida do Gradiente ===================
fprintf('Rodando Descida do Gradiente ...\n')

X = [ones(m, 1), data(:,1)]; % Adciona uma coluna de 1's em x
theta = zeros(2, 1); % valores iniciais dos parametros

% Parametros internos do algoritmo
iterations = 1500;
alpha = 0.001;

% Calcula e mostra o custo para os valores iniciais dos parametros
computeCost(X, y, theta)

% roda a descida do gradiente
theta = gradientDescent(X, y, theta, alpha, iterations);

% Mostra o resultado
fprintf('Theta encontrado pelo algoritmo de descida do gradiente: ');
fprintf('%f %f \n', theta(1), theta(2));

% Mostrando a reta calculada
hold on; % 
plot(X(:,2), X*theta, '-')
legend('Dados de treinamento', 'Regressão linear')
hold off % 

% Valores previstos para cidades com população de 35,000 e 70,000
predict1 = [1, 3.5] *theta;
fprintf('Para uma cidade com população= 35,000, o modelo preve lucro de %.2f\n',...
    predict1*10000);
predict2 = [1, 7] * theta;
fprintf('Para uma cidade com população= 70,000, o modelo preve lucro de %.2f\n\n',...
    predict2*10000);

fprintf('Programa pausado. Digite enter para continuar.\n');
pause;

%% ============= Parte 3: Visualizando J(theta_0, theta_1) =============
fprintf('Visualizando J(theta_0, theta_1) ...\n')

% Intervalo de valores sobre quais o custo sera calculado
theta0_vals = linspace(-10, 10, 100);
theta1_vals = linspace(-1, 4, 100);

% 
J_vals = zeros(length(theta0_vals), length(theta1_vals));

% Calculando os valores dos custo
for i = 1:length(theta0_vals)
    for j = 1:length(theta1_vals)
	  t = [theta0_vals(i); theta1_vals(j)];    
	  J_vals(i,j) = computeCost(X, y, t);
    end
end


% Because of the way meshgrids work in the surf command, we need to 
% transpose J_vals before calling surf, or else the axes will be flipped
J_vals = J_vals';
% Surface plot
figure;
surf(theta0_vals, theta1_vals, J_vals)
xlabel('\theta_0'); ylabel('\theta_1');

% Contour plot
figure;
% Plot J_vals as 15 contours spaced logarithmically between 0.01 and 100
contour(theta0_vals, theta1_vals, J_vals, logspace(-2, 3, 20))
xlabel('\theta_0'); ylabel('\theta_1');
hold on;
plot(theta(1), theta(2), 'rx', 'MarkerSize', 10, 'LineWidth', 2);
