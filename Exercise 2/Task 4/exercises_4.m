clear all;
clc;
close all;
load('C:\Users\user\Desktop\exercises_2\exercise2_4\digits.mat');
A = reshape(test9(55, :), 28, 28)';
figure;
imagesc(A);
%train0 --> y0
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
n = size(train0,1);
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
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
eikona0 = train0'*lpxp0;
figure;
B = reshape(eikona0,28,28)';
imagesc(B)

eikona1 = train1'*lpxp1;
figure;
B = reshape(eikona1,28,28)';
imagesc(B)

eikona2 = train2'*lpxp2;
figure;
B = reshape(eikona2,28,28)';
imagesc(B)

eikona3 = train3'*lpxp3;
figure;
B = reshape(eikona3,28,28)';
imagesc(B)

eikona4 = train4'*lpxp4;
figure;
B = reshape(eikona4,28,28)';
imagesc(B)

eikona5 = train5'*lpxp5;
figure;
B = reshape(eikona5,28,28)';
imagesc(B)

eikona6 = train6'*lpxp6;
figure;
B = reshape(eikona6,28,28)';
imagesc(B)

eikona7 = train7'*lpxp7;
figure;
B = reshape(eikona7,28,28)';
imagesc(B)

eikona8 = train8'*lpxp8;
figure;
B = reshape(eikona8,28,28)';
imagesc(B)

eikona9 = train9'*lpxp9;
figure;
B = reshape(eikona9,28,28)';
imagesc(B)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for i=1:500
    tst0 = test0(i,:) * log(p0)' + (1 - test0(i,:)) * log(1 - p0)';
    tst1 = test0(i,:) * log(p1)' + (1 - test0(i,:)) * log(1 - p1)';
    tst2 = test0(i,:) * log(p2)' + (1 - test0(i,:)) * log(1 - p2)';
    tst3 = test0(i,:) * log(p3)' + (1 - test0(i,:)) * log(1 - p3)';
    tst4 = test0(i,:) * log(p4)' + (1 - test0(i,:)) * log(1 - p4)';
    tst5 = test0(i,:) * log(p5)' + (1 - test0(i,:)) * log(1 - p5)';
    tst6 = test0(i,:) * log(p6)' + (1 - test0(i,:)) * log(1 - p6)';
    tst7 = test0(i,:) * log(p7)' + (1 - test0(i,:)) * log(1 - p7)';
    tst8 = test0(i,:) * log(p8)' + (1 - test0(i,:)) * log(1 - p8)';
    tst9 = test0(i,:) * log(p9)' + (1 - test0(i,:)) * log(1 - p9)';
    ltst0(:,i) = [tst0; tst1; tst2; tst3; tst4; tst5; tst6; tst7; tst8; tst9];
end

index = (max(ltst0));
[x0,y0]= find(ltst0==index);

for i=1:500
    tst0 = test1(i,:) * log(p0)' + (1 - test1(i,:)) * log(1 - p0)';
    tst1 = test1(i,:) * log(p1)' + (1 - test1(i,:)) * log(1 - p1)';
    tst2 = test1(i,:) * log(p2)' + (1 - test1(i,:)) * log(1 - p2)';
    tst3 = test1(i,:) * log(p3)' + (1 - test1(i,:)) * log(1 - p3)';
    tst4 = test1(i,:) * log(p4)' + (1 - test1(i,:)) * log(1 - p4)';
    tst5 = test1(i,:) * log(p5)' + (1 - test1(i,:)) * log(1 - p5)';
    tst6 = test1(i,:) * log(p6)' + (1 - test1(i,:)) * log(1 - p6)';
    tst7 = test1(i,:) * log(p7)' + (1 - test1(i,:)) * log(1 - p7)';
    tst8 = test1(i,:) * log(p8)' + (1 - test1(i,:)) * log(1 - p8)';
    tst9 = test1(i,:) * log(p9)' + (1 - test1(i,:)) * log(1 - p9)';
    ltst1(:,i) = [tst0; tst1; tst2; tst3; tst4; tst5; tst6; tst7; tst8; tst9];
end

index = (max(ltst1));
[x1,y1]= find(ltst1==index);

for i=1:500
    tst0 = test2(i,:) * log(p0)' + (1 - test2(i,:)) * log(1 - p0)';
    tst1 = test2(i,:) * log(p1)' + (1 - test2(i,:)) * log(1 - p1)';
    tst2 = test2(i,:) * log(p2)' + (1 - test2(i,:)) * log(1 - p2)';
    tst3 = test2(i,:) * log(p3)' + (1 - test2(i,:)) * log(1 - p3)';
    tst4 = test2(i,:) * log(p4)' + (1 - test2(i,:)) * log(1 - p4)';
    tst5 = test2(i,:) * log(p5)' + (1 - test2(i,:)) * log(1 - p5)';
    tst6 = test2(i,:) * log(p6)' + (1 - test2(i,:)) * log(1 - p6)';
    tst7 = test2(i,:) * log(p7)' + (1 - test2(i,:)) * log(1 - p7)';
    tst8 = test2(i,:) * log(p8)' + (1 - test2(i,:)) * log(1 - p8)';
    tst9 = test2(i,:) * log(p9)' + (1 - test2(i,:)) * log(1 - p9)';
    ltst2(:,i) = [tst0; tst1; tst2; tst3; tst4; tst5; tst6; tst7; tst8; tst9];
end

index = (max(ltst2));
[x2,y2]= find(ltst2==index);

for i=1:500
    tst0 = test3(i,:) * log(p0)' + (1 - test3(i,:)) * log(1 - p0)';
    tst1 = test3(i,:) * log(p1)' + (1 - test3(i,:)) * log(1 - p1)';
    tst2 = test3(i,:) * log(p2)' + (1 - test3(i,:)) * log(1 - p2)';
    tst3 = test3(i,:) * log(p3)' + (1 - test3(i,:)) * log(1 - p3)';
    tst4 = test3(i,:) * log(p4)' + (1 - test3(i,:)) * log(1 - p4)';
    tst5 = test3(i,:) * log(p5)' + (1 - test3(i,:)) * log(1 - p5)';
    tst6 = test3(i,:) * log(p6)' + (1 - test3(i,:)) * log(1 - p6)';
    tst7 = test3(i,:) * log(p7)' + (1 - test3(i,:)) * log(1 - p7)';
    tst8 = test3(i,:) * log(p8)' + (1 - test3(i,:)) * log(1 - p8)';
    tst9 = test3(i,:) * log(p9)' + (1 - test3(i,:)) * log(1 - p9)';
    ltst3(:,i) = [tst0; tst1; tst2; tst3; tst4; tst5; tst6; tst7; tst8; tst9];
end

index = (max(ltst3));
[x3,y3]= find(ltst3==index);

for i=1:500
    tst0 = test4(i,:) * log(p0)' + (1 - test4(i,:)) * log(1 - p0)';
    tst1 = test4(i,:) * log(p1)' + (1 - test4(i,:)) * log(1 - p1)';
    tst2 = test4(i,:) * log(p2)' + (1 - test4(i,:)) * log(1 - p2)';
    tst3 = test4(i,:) * log(p3)' + (1 - test4(i,:)) * log(1 - p3)';
    tst4 = test4(i,:) * log(p4)' + (1 - test4(i,:)) * log(1 - p4)';
    tst5 = test4(i,:) * log(p5)' + (1 - test4(i,:)) * log(1 - p5)';
    tst6 = test4(i,:) * log(p6)' + (1 - test4(i,:)) * log(1 - p6)';
    tst7 = test4(i,:) * log(p7)' + (1 - test4(i,:)) * log(1 - p7)';
    tst8 = test4(i,:) * log(p8)' + (1 - test4(i,:)) * log(1 - p8)';
    tst9 = test4(i,:) * log(p9)' + (1 - test4(i,:)) * log(1 - p9)';
    ltst4(:,i) = [tst0; tst1; tst2; tst3; tst4; tst5; tst6; tst7; tst8; tst9];
end

index = (max(ltst4));
[x4,y4]= find(ltst4==index);

for i=1:500
    tst0 = test5(i,:) * log(p0)' + (1 - test5(i,:)) * log(1 - p0)';
    tst1 = test5(i,:) * log(p1)' + (1 - test5(i,:)) * log(1 - p1)';
    tst2 = test5(i,:) * log(p2)' + (1 - test5(i,:)) * log(1 - p2)';
    tst3 = test5(i,:) * log(p3)' + (1 - test5(i,:)) * log(1 - p3)';
    tst4 = test5(i,:) * log(p4)' + (1 - test5(i,:)) * log(1 - p4)';
    tst5 = test5(i,:) * log(p5)' + (1 - test5(i,:)) * log(1 - p5)';
    tst6 = test5(i,:) * log(p6)' + (1 - test5(i,:)) * log(1 - p6)';
    tst7 = test5(i,:) * log(p7)' + (1 - test5(i,:)) * log(1 - p7)';
    tst8 = test5(i,:) * log(p8)' + (1 - test5(i,:)) * log(1 - p8)';
    tst9 = test5(i,:) * log(p9)' + (1 - test5(i,:)) * log(1 - p9)';
    ltst5(:,i) = [tst0; tst1; tst2; tst3; tst4; tst5; tst6; tst7; tst8; tst9];
end

index = (max(ltst5));
[x5,y5]= find(ltst5==index);

for i=1:500
    tst0 = test6(i,:) * log(p0)' + (1 - test6(i,:)) * log(1 - p0)';
    tst1 = test6(i,:) * log(p1)' + (1 - test6(i,:)) * log(1 - p1)';
    tst2 = test6(i,:) * log(p2)' + (1 - test6(i,:)) * log(1 - p2)';
    tst3 = test6(i,:) * log(p3)' + (1 - test6(i,:)) * log(1 - p3)';
    tst4 = test6(i,:) * log(p4)' + (1 - test6(i,:)) * log(1 - p4)';
    tst5 = test6(i,:) * log(p5)' + (1 - test6(i,:)) * log(1 - p5)';
    tst6 = test6(i,:) * log(p6)' + (1 - test6(i,:)) * log(1 - p6)';
    tst7 = test6(i,:) * log(p7)' + (1 - test6(i,:)) * log(1 - p7)';
    tst8 = test6(i,:) * log(p8)' + (1 - test6(i,:)) * log(1 - p8)';
    tst9 = test6(i,:) * log(p9)' + (1 - test6(i,:)) * log(1 - p9)';
    ltst6(:,i) = [tst0; tst1; tst2; tst3; tst4; tst5; tst6; tst7; tst8; tst9];
end

index = (max(ltst6));
[x6,y6]= find(ltst6==index);

for i=1:500
    tst0 = test7(i,:) * log(p0)' + (1 - test7(i,:)) * log(1 - p0)';
    tst1 = test7(i,:) * log(p1)' + (1 - test7(i,:)) * log(1 - p1)';
    tst2 = test7(i,:) * log(p2)' + (1 - test7(i,:)) * log(1 - p2)';
    tst3 = test7(i,:) * log(p3)' + (1 - test7(i,:)) * log(1 - p3)';
    tst4 = test7(i,:) * log(p4)' + (1 - test7(i,:)) * log(1 - p4)';
    tst5 = test7(i,:) * log(p5)' + (1 - test7(i,:)) * log(1 - p5)';
    tst6 = test7(i,:) * log(p6)' + (1 - test7(i,:)) * log(1 - p6)';
    tst7 = test7(i,:) * log(p7)' + (1 - test7(i,:)) * log(1 - p7)';
    tst8 = test7(i,:) * log(p8)' + (1 - test7(i,:)) * log(1 - p8)';
    tst9 = test7(i,:) * log(p9)' + (1 - test7(i,:)) * log(1 - p9)';
    ltst7(:,i) = [tst0; tst1; tst2; tst3; tst4; tst5; tst6; tst7; tst8; tst9];
end

index = (max(ltst7));
[x7,y7]= find(ltst7==index);

for i=1:500
    tst0 = test8(i,:) * log(p0)' + (1 - test8(i,:)) * log(1 - p0)';
    tst1 = test8(i,:) * log(p1)' + (1 - test8(i,:)) * log(1 - p1)';
    tst2 = test8(i,:) * log(p2)' + (1 - test8(i,:)) * log(1 - p2)';
    tst3 = test8(i,:) * log(p3)' + (1 - test8(i,:)) * log(1 - p3)';
    tst4 = test8(i,:) * log(p4)' + (1 - test8(i,:)) * log(1 - p4)';
    tst5 = test8(i,:) * log(p5)' + (1 - test8(i,:)) * log(1 - p5)';
    tst6 = test8(i,:) * log(p6)' + (1 - test8(i,:)) * log(1 - p6)';
    tst7 = test8(i,:) * log(p7)' + (1 - test8(i,:)) * log(1 - p7)';
    tst8 = test8(i,:) * log(p8)' + (1 - test8(i,:)) * log(1 - p8)';
    tst9 = test8(i,:) * log(p9)' + (1 - test8(i,:)) * log(1 - p9)';
    ltst8(:,i) = [tst0; tst1; tst2; tst3; tst4; tst5; tst6; tst7; tst8; tst9];
end

index = (max(ltst8));
[x8,y8]= find(ltst8==index);

for i=1:500
    tst0 = test9(i,:) * log(p0)' + (1 - test9(i,:)) * log(1 - p0)';
    tst1 = test9(i,:) * log(p1)' + (1 - test9(i,:)) * log(1 - p1)';
    tst2 = test9(i,:) * log(p2)' + (1 - test9(i,:)) * log(1 - p2)';
    tst3 = test9(i,:) * log(p3)' + (1 - test9(i,:)) * log(1 - p3)';
    tst4 = test9(i,:) * log(p4)' + (1 - test9(i,:)) * log(1 - p4)';
    tst5 = test9(i,:) * log(p5)' + (1 - test9(i,:)) * log(1 - p5)';
    tst6 = test9(i,:) * log(p6)' + (1 - test9(i,:)) * log(1 - p6)';
    tst7 = test9(i,:) * log(p7)' + (1 - test9(i,:)) * log(1 - p7)';
    tst8 = test9(i,:) * log(p8)' + (1 - test9(i,:)) * log(1 - p8)';
    tst9 = test9(i,:) * log(p9)' + (1 - test9(i,:)) * log(1 - p9)';
    ltst9(:,i) = [tst0; tst1; tst2; tst3; tst4; tst5; tst6; tst7; tst8; tst9];
end

index = (max(ltst9));
[x9,y9]= find(ltst9==index);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

cor = 0;
for i=1:length(x0)
    if x0(i)==1
        cor = cor+1;
    end
end
accuracy0 = cor / length(x0)

cor = 0;
for i=1:length(x1)
    if x1(i)==2
        cor = cor+1;
    end
end
accuracy1 = cor / length(x1)

cor = 0;
for i=1:length(x2)
    if x2(i)==3
        cor = cor+1;
    end
end
accuracy2 = cor / length(x2)

cor = 0;
for i=1:length(x3)
    if x3(i)==4
        cor = cor+1;
    end
end
accuracy3 = cor / length(x3)

cor = 0;
for i=1:length(x4)
    if x4(i)==5
        cor = cor+1;
    end
end
accuracy4 = cor / length(x4)

cor = 0;
for i=1:length(x5)
    if x5(i)==6
        cor = cor+1;
    end
end
accuracy5 = cor / length(x5)

cor = 0;
for i=1:length(x6)
    if x6(i)==7
        cor = cor+1;
    end
end
accuracy6 = cor / length(x6)

cor = 0;
for i=1:length(x7)
    if x7(i)==8
        cor = cor+1;
    end
end
accuracy7 = cor / length(x7)

cor = 0;
for i=1:length(x8)
    if x8(i)==9
        cor = cor+1;
    end
end
accuracy8 = cor / length(x8)

cor = 0;
for i=1:length(x9)
    if x9(i)==10
        cor = cor+1;
    end
end
accuracy9 = cor / length(x9)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%.
zeros = 0;
ones = 0;
twos = 0;
threes = 0;
fours = 0;
fives = 0;
six = 0;
sevens = 0;
eights = 0;
nines = 0;
for i=1:500    
    if x0(i)==2
        ones = ones+1;
    end   
    if x0(i)==3
        twos = twos+1;
    end    
    if x0(i)==4
        threes = threes+1;
    end
    if x0(i)==5
        fours = fours+1;
    end
    if x0(i)==6
        fives = fives+1;
    end
    if x0(i)==7
        six = six+1;
    end
    if x0(i)==8
        sevens = sevens+1;
    end
    if x0(i)==9
        eights = eights+1;
    end
    if x0(i)==10
        nines = nines+1;
    end
end
        
confusion_matrix_zero = [ones,twos,threes,fours,fives,six,sevens,eights,nines];

zeros = 0;
ones = 0;
twos = 0;
threes = 0;
fours = 0;
fives = 0;
six = 0;
sevens = 0;
eights = 0;
nines = 0;
for i=1:500
    if x1(i)==3
        twos = twos+1;
    end
    if x1(i)==1
        zeros = zeros+1;
    end
    if x1(i)==4
        threes = threes+1;
    end
    if x1(i)==5
        fours = fours+1;
    end
    if x1(i)==6
        fives = fives+1;
    end
    if x1(i)==7
        six = six+1;
    end
    if x1(i)==8
        sevens = sevens+1;
    end
    if x1(i)==9
        eights = eights+1;
    end
    if x1(i)==10
        nines = nines+1;
    end
end

confusion_matrix_one = [zeros,twos,threes,fours,fives,six,sevens,eights,nines];

zeros = 0;
ones = 0;
twos = 0;
threes = 0;
fours = 0;
fives = 0;
six = 0;
sevens = 0;
eights = 0;
nines = 0;
for i=1:500
    
    if x2(i)==1
        zeros = zeros+1;
    end
    if x2(i)==2
        ones = ones+1;
    end
    if x2(i)==4
        threes = threes+1;
    end
    if x2(i)==5
        fours = fours+1;
    end
    if x2(i)==6
        fives = fives+1;
    end
    if x2(i)==7
        six = six+1;
    end
    if x2(i)==8
        sevens = sevens+1;
    end
    if x2(i)==9
        eights = eights+1;
    end
    if x2(i)==10
        nines = nines+1;
    end
end

confusion_matrix_two = [zeros,ones,threes,fours,fives,six,sevens,eights,nines];

zeros = 0;
ones = 0;
twos = 0;
threes = 0;
fours = 0;
fives = 0;
six = 0;
sevens = 0;
eights = 0;
nines = 0;
for i=1:500
    
    if x3(i)==1
        zeros = zeros+1;
    end
    if x3(i)==2
        ones = ones+1;
    end
    if x3(i)==3
        twos = twos+1;
    end
    if x3(i)==5
        fours = fours+1;
    end
    if x3(i)==6
        fives = fives+1;
    end
    if x3(i)==7
        six = six+1;
    end
    if x3(i)==8
        sevens = sevens+1;
    end
    if x3(i)==9
        eights = eights+1;
    end
    if x3(i)==10
        nines = nines+1;
    end
end

confusion_matrix_three = [zeros,ones,twos,fours,fives,six,sevens,eights,nines];

zeros = 0;
ones = 0;
twos = 0;
threes = 0;
fours = 0;
fives = 0;
six = 0;
sevens = 0;
eights = 0;
nines = 0;
for i=1:500
    
    if x4(i)==1
        zeros = zeros+1;
    end
    if x4(i)==2
        ones = ones+1;
    end
    if x4(i)==3
        twos = twos+1;
    end
    if x4(i)==4
        threes = threes+1;
    end
    if x4(i)==6
        fives = fives+1;
    end
    if x4(i)==7
        six = six+1;
    end
    if x4(i)==8
        sevens = sevens+1;
    end
    if x4(i)==9
        eights = eights+1;
    end
    if x4(i)==10
        nines = nines+1;
    end
end

confusion_matrix_four = [zeros,ones,twos,threes,fives,six,sevens,eights,nines];

zeros = 0;
ones = 0;
twos = 0;
threes = 0;
fours = 0;
fives = 0;
six = 0;
sevens = 0;
eights = 0;
nines = 0;
for i=1:500
    
    if x5(i)==1
        zeros = zeros+1;
    end
    if x5(i)==2
        ones = ones+1;
    end
    if x5(i)==3
        twos = twos+1;
    end
    if x5(i)==4
        threes = threes+1;
    end
    if x5(i)==5
        fours = fours+1;
    end
    if x5(i)==7
        six = six+1;
    end
    if x5(i)==8
        sevens = sevens+1;
    end
    if x5(i)==9
        eights = eights+1;
    end
    if x5(i)==10
        nines = nines+1;
    end
end

confusion_matrix_five = [zeros,ones,twos,threes,fours,six,sevens,eights,nines];

zeros = 0;
ones = 0;
twos = 0;
threes = 0;
fours = 0;
fives = 0;
six = 0;
sevens = 0;
eights = 0;
nines = 0;
for i=1:500
    
    if x6(i)==1
        zeros = zeros+1;
    end
    if x6(i)==2
        ones = ones+1;
    end
    if x6(i)==3
        twos = twos+1;
    end
    if x6(i)==4
        threes = threes+1;
    end
    if x6(i)==5
        fours = fours+1;
    end
    if x6(i)==6
        fives = fives+1;
    end
    if x6(i)==8
        sevens = sevens+1;
    end
    if x6(i)==9
        eights = eights+1;
    end
    if x6(i)==10
        nines = nines+1;
    end
end

confusion_matrix_six = [zeros,ones,twos,threes,fours,fives,sevens,eights,nines];

zeros = 0;
ones = 0;
twos = 0;
threes = 0;
fours = 0;
fives = 0;
six = 0;
sevens = 0;
eights = 0;
nines = 0;
for i=1:500
    
    if x7(i)==1
        zeros = zeros+1;
    end
    if x7(i)==2
        ones = ones+1;
    end
    if x7(i)==3
        twos = twos+1;
    end
    if x7(i)==4
        threes = threes+1;
    end
    if x7(i)==5
        fours = fours+1;
    end
    if x7(i)==6
        fives = fives+1;
    end
    if x7(i)==7
        six = six+1;
    end
    if x7(i)==9
        eights = eights+1;
    end
    if x7(i)==10
        nines = nines+1;
    end
end

confusion_matrix_seven = [zeros,ones,twos,threes,fours,fives,six,eights,nines];

zeros = 0;
ones = 0;
twos = 0;
threes = 0;
fours = 0;
fives = 0;
six = 0;
sevens = 0;
eights = 0;
nines = 0;
for i=1:500
    
    if x8(i)==1
        zeros = zeros+1;
    end
    if x8(i)==2
        ones = ones+1;
    end
    if x8(i)==3
        twos = twos+1;
    end
    if x8(i)==4
        threes = threes+1;
    end
    if x8(i)==5
        fours = fours+1;
    end
    if x8(i)==6
        fives = fives+1;
    end
    if x8(i)==7
        six = six+1;
    end
    if x8(i)==8
        sevens = sevens+1;
    end
    if x8(i)==10
        nines = nines+1;
    end
end

confusion_matrix_eight = [zeros,ones,twos,threes,fours,fives,six,sevens,nines];

zeros = 0;
ones = 0;
twos = 0;
threes = 0;
fours = 0;
fives = 0;
six = 0;
sevens = 0;
eights = 0;
nines = 0;
for i=1:500
    
    if x9(i)==1
        zeros = zeros+1;
    end
    if x9(i)==2
        ones = ones+1;
    end
    if x9(i)==3
        twos = twos+1;
    end
    if x9(i)==4
        threes = threes+1;
    end
    if x9(i)==5
        fours = fours+1;
    end
    if x9(i)==6
        fives = fives+1;
    end
    if x9(i)==7
        six = six+1;
    end
    if x9(i)==8
        sevens = sevens+1;
    end
    if x9(i)==9
        eights = eights+1;
    end
end

confusion_matrix_nine = [zeros,ones,twos,threes,fours,fives,six,sevens,eights];