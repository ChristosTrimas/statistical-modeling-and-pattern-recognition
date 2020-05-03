clear;
clc;
close all;
load('C:\Users\user\Desktop\exercises_2\exercise2_4\digits.mat');
A = reshape(train9(55, :), 28, 28);
figure;
imagesc(A);
%train0 --> y0

n = size(train0,1);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%the MLE pr
p0 = (1/n)*sum(train0);

p1 = (1/n)*sum(train1);

p2 = (1/n)*sum(train2);

p3 = (1/n)*sum(train3);

p4 = (1/n)*sum(train4);

p5 = (1/n)*sum(train5);

p6 = (1/n)*sum(train6);

p7 = (1/n)*sum(train7);

p8 = (1/n)*sum(train8);

p9 = (1/n)*sum(train9);

p = [p0;p1;p2;p3;p4;p5;p6;p7;p8;p9];

for i=1:784
    if p0(1,i)==0
        p0(1,i)=0.00001;
    end
end

for i=1:500
    lpxp0(i,:) = train0(i,:)*log(p0)'+(1-train0(i,:))*log(1-p0)';
end

for i=1:784
    if p1(1,i)==0
        p1(1,i)=0.00001;
    end
end

for i=1:500
    lpxp1(i,:) = train1(i,:)*log(p1)'+(1-train1(i,:))*log(1-p1)';
end

for i=1:784
    if p2(1,i)==0
        p2(1,i)=0.00001;
    end
end

for i=1:500
    lpxp2(i,:) = train2(i,:)*log(p2)'+(1-train2(i,:))*log(1-p2)';
end

for i=1:784
    if p3(1,i)==0
        p3(1,i)=0.00001;
    end
end

for i=1:500
    lpxp3(i,:) = train3(i,:)*log(p3)'+(1-train3(i,:))*log(1-p3)';
end

for i=1:784
    if p4(1,i)==0
        p4(1,i)=0.00001;
    end
end

for i=1:500
    lpxp4(i,:) = train4(i,:)*log(p4)'+(1-train4(i,:))*log(1-p4)';
end

for i=1:784
    if p5(1,i)==0
        p5(1,i)=0.00001;
    end
end

for i=1:500
    lpxp5(i,:) = train5(i,:)*log(p5)'+(1-train5(i,:))*log(1-p5)';
end

for i=1:784
    if p6(1,i)==0
        p6(1,i)=0.00001;
    end
end

for i=1:500
    lpxp6(i,:) = train6(i,:)*log(p6)'+(1-train6(i,:))*log(1-p6)';
end

for i=1:784
    if p7(1,i)==0
        p7(1,i)=0.00001;
    end
end

for i=1:500
    lpxp7(i,:) = train7(i,:)*log(p7)'+(1-train7(i,:))*log(1-p7)';
end

for i=1:784
    if p8(1,i)==0
        p8(1,i)=0.00001;
    end
end

for i=1:500
    lpxp8(i,:) = train8(i,:)*log(p8)'+(1-train8(i,:))*log(1-p8)';
end

for i=1:784
    if p9(1,i)==0
        p9(1,i)=0.00001;
    end
end

for i=1:500
    lpxp9(i,:) = train9(i,:)*log(p9)'+(1-train9(i,:))*log(1-p9)';
end

eikona0 = lpxp0'*train0;
figure;
B = reshape(eikona0,28,28);
imagesc(B)

eikona1 = train1'*lpxp1;
figure;
B = reshape(eikona1,28,28);
imagesc(B)

eikona2 = train2'*lpxp2;
figure;
B = reshape(eikona2,28,28);
imagesc(B)

eikona3 = train3'*lpxp3;
figure;
B = reshape(eikona3,28,28);
imagesc(B)

eikona4 = train4'*lpxp4;
figure;
B = reshape(eikona4,28,28);
imagesc(B)

eikona5 = train5'*lpxp5;
figure;
B = reshape(eikona5,28,28);
imagesc(B)

eikona6 = train6'*lpxp6;
figure;
B = reshape(eikona6,28,28);
imagesc(B)

eikona7 = train7'*lpxp7;
figure;
B = reshape(eikona7,28,28);
imagesc(B)

eikona8 = train8'*lpxp8;
figure;
B = reshape(eikona8,28,28);
imagesc(B)

eikona9 = lpxp9'*train9;
figure;
B = reshape(eikona9,28,28);
imagesc(B)