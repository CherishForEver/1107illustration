clear A W H Q
neurons=1:1:30;
neurons=neurons';
[A,W,H,Q]=fitForFilter(trainX3,trainY3,neurons);

%% test Data
T=size(testX3,2);
Xt3=[testX3(1:6,:)];%;ones(1,T)];
Yt3=testY3(neurons,:);
[D,T]=size(Xt3);
%%
initX=Xt3(:,1);
initP = eye(D);

xp=initX;
Pp=initP;

xr=zeros(D,T);

for i=1:T
   [xp,Pp,Kk,Pk_]=filterForHand(xp,Pp,Yt3(:,i),A,H,W,Q);
   xr3(:,i)=xp;
end

%% 绘制
plotV=[1:18];%绘制向量

plot3(xr3(1,plotV),xr3(2,plotV),xr3(3,plotV),'r--','LineWidth',2);
hold on
plot3(Xt3(1,plotV),Xt3(2,plotV),Xt3(3,plotV),'b-','LineWidth',2);

%% performance
for i=1:D
    cc(i)=CalCC(Xt3(i,:),xr3(i,:));
end
