function cc=CalCC(x1,x2)
% x1是输入值，x2是估计值
x1m=mean(x1);
x2m=mean(x2);

temp1=x1-x1m;
temp2=x2-x2m;

nominator=sum(temp1.*temp2);

d1=sum(temp1.^2);
d2=sum(temp2.^2);

denominator=sqrt(d1*d2);

cc=nominator/denominator;

