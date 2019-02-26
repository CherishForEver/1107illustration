function [xk,Pk,Kk,Pk_] = filterForHand( xk_1,Pk_1,yk,A,H,W,Q )
d=size(xk_1,1);
xk_=A*xk_1;
Pk_=A*Pk_1*A'+W;

Kk=Pk_*H'*pinv(H*Pk_*H'+Q);

xk=xk_+Kk*(yk-H*xk_);
Pk=(eye(d)-Kk*H)*Pk_;
end
