clear A H W Q
neurons=[1:1:30 100:1:129];
neurons=neurons';
[A,W,H,Q]=fitForFilter(trainX1,trainY1,neurons);

%% test Data
T=size(testX1,2);
Xt1=[testX1(1:6,:)];%;ones(1,T)];
Yt1=testY1(neurons,:);
[D,T]=size(Xt1);
%%
initX=Xt1(:,1);
initP = eye(D);

xp=initX;
Pp=initP;

xr1=zeros(D,T);

for i=1:T
   [xp,Pp,Kk,Pk_]=filterForHand(xp,Pp,Yt1(:,i),A,H,W,Q);
   xr1(:,i)=xp;
end

%% 绘制
plotV=[1:70];%绘制向量
subplot(221)
hold on
plot(xr1(1,plotV),'r--','LineWidth',2);
plot(Xt1(1,plotV),'b-','LineWidth',2);
subplot(222)
hold on
plot(xr1(2,plotV),'r--','LineWidth',2);
plot(Xt1(2,plotV),'b-','LineWidth',2);
subplot(223)
hold on
plot(xr1(3,plotV),'r--','LineWidth',2);
plot(Xt1(3,plotV),'b-','LineWidth',2);
subplot(224)
hold on
view(3)
plot3(xr1(1,plotV),xr1(2,plotV),xr1(3,plotV),'r--','LineWidth',2);
plot3(Xt1(1,plotV),Xt1(2,plotV),Xt1(3,plotV),'b-','LineWidth',2);

%% performance
for i=1:D
    cc(i)=CalCC(Xt1(i,:),xr1(i,:));
end

