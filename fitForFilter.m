function [A,W,H,Q]=fitForFilter(trainX,trainY,neurons)
%neurons为选择的神经元序号的向量
T=size(trainX,2);
X=[trainX(1:6,:)];%;ones(1,T)];
Y=trainY(neurons,:);
X1=X(:,1:T-1);
X2=X(:,2:T);
A=X2*X1'*inv(X1*X1');
W=(X2-A*X1)*transpose(X2-A*X1)/(T-1);
H=Y*X'*inv(X*X');
Q=(Y-H*X)*transpose(Y-H*X)/T;

