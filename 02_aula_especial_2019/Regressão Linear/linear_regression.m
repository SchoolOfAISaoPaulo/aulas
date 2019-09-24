clear
clc
# -----------------------Conjunto de  treinamento---------------------
x = [ones(12,1),[1:1:12]'] # 12 linhas X 2 Colunas 
y = load('y.csv')          # 12 linhas X 1 COluna 
# --------------------------------------------------------------------

input("Pressione enter para continuar...");

# -------------Criação dos vetores de armazenamento ------------------
guardar_theta0 = zeros(2000,1); # 2000 linhas x 1 coluna 
guardar_theta1 = zeros(2000,1); # 2000 linhas x 1 coluna 
error= zeros(2000,1);# 2000 linhas x 1 coluna
J = zeros(2000,1);# 2000 linhas x 1 coluna
m=12;
#---------------------------------------------------------------------

#--------------------Chute inicial de theta---------------------------
theta = [0.1;0.1]; 
#---------------------------------------------------------------------

#--------------------Definição do passo-------------------------------
alpha = 0.01; 
#---------------------------------------------------------------------
# ------------------Plotando os dados --------------------------------

plot(y,'o',"markersize",15)
hold on
title("Regressão Linear");
xlabel("X");
ylabel("y");
axis([0,15,0,15])
input("Pressione enter para continuar...");
plot(x*theta)
#----------------------------------------------------------------------

for i = 1:2000
h = x*theta;
J(i) = (sum((h-y).^2))/(2*m);
error(i) = J(i);
temp0 = theta(1)-(alpha/m)*sum(h-y);
temp1 = theta(2)-(alpha/m)*sum(x'*(h-y));
theta(1) = temp0;
theta(2) = temp1;

if (i == 10 || i == 100 || i == 1000 || i == 1500 || i == 2000)
  pause(3);
  plot(h)
endif;
endfor;

input("Pressione enter para continuar...");
figure(2)
plot(error)
title("Função de Custo");
xlabel("Iterações");
ylabel("J(theta)");