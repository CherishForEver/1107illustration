%% LU
trainX1=xLU{1,1}(:,:);
trainY1=xLU{1,2}(:,:);

for i=2:50
    trainX1=[trainX1 xLU{i,1}(:,:)];
    trainY1=[trainY1 xLU{i,2}(:,:)];
end

testX1=xLU{51,1}(:,:);
testY1=xLU{51,2}(:,:);

for i=52:100
    testX1=[testX1 xLU{i,1}(:,:)];
    testY1=[testY1 xLU{i,2}(:,:)];
end

%% RD
trainX2=xRD{1,1}(:,:);
trainY2=xRD{1,2}(:,:);

for i=2:50
    trainX2=[trainX2 xRD{i,1}(:,:)];
    trainY2=[trainY2 xRD{i,2}(:,:)];
end

testX2=xRD{51,1}(:,:);
testY2=xRD{51,2}(:,:);

for i=52:100
    testX2=[testX2 xRD{i,1}(:,:)];
    testY2=[testY2 xRD{i,2}(:,:)];
end

%% S
trainX3=xS{1,1}(:,:);
trainY3=xS{1,2}(:,:);

for i=2:50
    trainX3=[trainX3 xS{i,1}(:,:)];
    trainY3=[trainY3 xS{i,2}(:,:)];
end

testX3=xS{51,1}(:,:);
testY3=xS{51,2}(:,:);

for i=52:100
    testX3=[testX3 xS{i,1}(:,:)];
    testY3=[testY3 xS{i,2}(:,:)];
end


