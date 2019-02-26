%% velocity and acceleration
% 1-3 position
% 4-6 velocity
% 7-9 acc
for i=1:120
    trajRD(i).perf(1,4:6)=[0 0 0];
    trajLU(i).perf(1,4:6)=[0 0 0];
    trajS(i).perf(1,4:6)=[0 0 0];
    for j=2:length(trajRD(i).perf)
        trajRD(i).perf(j,4:6)=trajRD(i).perf(j,1:3)-trajRD(i).perf(j-1,1:3);      
    end
    
    for j=2:length(trajLU(i).perf)
         trajLU(i).perf(j,4:6)=trajLU(i).perf(j,1:3)-trajLU(i).perf(j-1,1:3);
    end
    
    for j=2:length(trajS(i).perf)
        trajS(i).perf(j,4:6)=trajS(i).perf(j,1:3)-trajS(i).perf(j-1,1:3);
    end
end
% acc
for i=1:120
    trajRD(i).perf(1,7:9)=[0 0 0];
    trajLU(i).perf(1,7:9)=[0 0 0];
    trajS(i).perf(1,7:9)=[0 0 0];

    trajRD(i).perf(2,7:9)=[0 0 0];
    trajLU(i).perf(2,7:9)=[0 0 0];
    trajS(i).perf(2,7:9)=[0 0 0];

    for j=3:length(trajRD(i).perf)
        trajRD(i).perf(j,7:9)=trajRD(i).perf(j,4:6)-trajRD(i).perf(j-1,4:6);      
    end
    
    for j=3:length(trajLU(i).perf)
         trajLU(i).perf(j,7:9)=trajLU(i).perf(j,4:6)-trajLU(i).perf(j-1,4:6);
    end
    
    for j=3:length(trajS(i).perf)
        trajS(i).perf(j,7:9)=trajS(i).perf(j,4:6)-trajS(i).perf(j-1,4:6);
    end
end
%% RD
Trial=120;
for i=1:Trial
    tLen=length(trajRD(i).perf);
    for k=1:9
        for j=1:tLen
            temp(1,j)=trajRD(i).perf(j,k);
        end
        xRD{i,1}(k,:)=transpose(smooth(temp,6));
        clear temp
    end
end 

N=length(TRD{1, 1}.neurons);
bin=0.0125;

sigma =0.05; %Standard deviation of the kernel 5 15 ms
edges=[-3*sigma:0.0125:3*sigma]; %Time ranges form -3*st. dev. to 3*st. dev.
kernel = normpdf(edges,0,sigma); %Evaluate the Gaussian kernel
kernel = kernel*0.0125; %Multiply by bin width so the probabilities sum to 1

%求bin后的spike数目，并进行卷积
for i=1:Trial
    tLen=length(trajRD(i).perf);
    for j=1:N
        s=TRD{i,1}.CenterHit;
        for k=1:tLen
            e=s+bin;
            temp2=find(TRD{i,1}.neurons{j,2}(:)>s & TRD{i,1}.neurons{j,2}(:)<e);
            temp3(k)=length(temp2);%xRD{i,2}(j,k)=length(temp2);
            s=e;
        end
        temp4=conv(temp3,kernel); %Convolve spike data with the kernel
        center = ceil(length(edges)/2); %Find the index of the kernel center
        xRD{i,2}(j,:)=temp4(center:tLen+center-1); %Trim out the relevant portion of the spike density
    end
end

%% LU
Trial=120;
for i=1:Trial
    tLen=length(trajLU(i).perf);
    for k=1:9
        for j=1:tLen
            temp(1,j)=trajLU(i).perf(j,k);
        end
        xLU{i,1}(k,:)=transpose(smooth(temp,6));
        clear temp
    end
end 

N=length(TLU{1, 1}.neurons);
bin=0.0125;


%求bin后的spike数目，并进行卷积
for i=1:Trial
    tLen=length(trajLU(i).perf);
    for j=1:N
        s=TLU{i,1}.CenterHit;
        for k=1:tLen
            e=s+bin;
            temp2=find(TLU{i,1}.neurons{j,2}(:)>s & TLU{i,1}.neurons{j,2}(:)<e);
            temp3(k)=length(temp2);%xLU{i,2}(j,k)=length(temp2);
            s=e;
        end
        temp4=conv(temp3,kernel); %Convolve spike data with the kernel
        center = ceil(length(edges)/2); %Find the index of the kernel center
        xLU{i,2}(j,:)=temp4(center:tLen+center-1); %Trim out the relevant portion of the spike density
    end
end

%% Static
Trial=120;
for i=1:Trial
    tLen=length(trajS(i).perf);
    for k=1:9
        for j=1:tLen
            temp(1,j)=trajS(i).perf(j,k);
        end
        xS{i,1}(k,:)=transpose(smooth(temp,6));
        clear temp
    end
end 

N=length(TStill{1, 1}.neurons);
bin=0.0125;

%求bin后的spike数目，并进行卷积
for i=1:Trial
    tLen=length(trajS(i).perf);
    for j=1:N
        s=TStill{i,1}.CenterHit;
        for k=1:tLen
            e=s+bin;
            temp2=find(TStill{i,1}.neurons{j,2}(:)>s & TStill{i,1}.neurons{j,2}(:)<e);
            temp3(k)=length(temp2);%xS{i,2}(j,k)=length(temp2);
            s=e;
        end
        temp4=conv(temp3,kernel); %Convolve spike data with the kernel
        center = ceil(length(edges)/2); %Find the index of the kernel center
        xS{i,2}(j,:)=temp4(center:tLen+center-1); %Trim out the relevant portion of the spike density
    end
end






