clear A W H Q
neurons=1:1:30;
neurons=neurons';
[A,W,H,Q]=fitForFilter(trainX2,trainY2,neurons);

%% test Data
T=size(testX2,2);
Xt2=[testX2(1:6,:)];%;ones(1,T)];
Yt2=testY2(neurons,:);
[D,T]=size(Xt2);
%%
initX=Xt2(:,1);
initP = eye(D);

xp=initX;
Pp=initP;

xr=zeros(D,T);

for i=1:T
   [xp,Pp,Kk,Pk_]=filterForHand(xp,Pp,Yt2(:,i),A,H,W,Q);
   xr2(:,i)=xp;
end

%% 绘制
plotV=[18:36];%绘制向量

plot3(xr2(1,plotV),xr2(2,plotV),xr2(3,plotV),'r--','LineWidth',2);
hold on
plot3(Xt2(1,plotV),Xt2(2,plotV),Xt2(3,plotV),'b-','LineWidth',2);

%% performance
for i=1:D
    cc(i)=CalCC(Xt2(i,:),xr2(i,:));
end
