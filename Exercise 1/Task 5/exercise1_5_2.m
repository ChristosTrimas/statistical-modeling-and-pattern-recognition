clear all ;
close all;
clc;


S1 = [1.2 0.4; 0.4 1.2];
S2 = [1.2 0.4; 0.4 1.2];

mu1=[3 3];
mu2=[6 6];

x1 = [-4 : 0.01 : 10] ;
x2 = [-4 : 0.01 : 10] ;

[X1,X2] = meshgrid(x1,x2);
hold on
figure(1);
Y1 = mvnpdf([X1(:) X2(:)] ,mu1,S1);
Y1_reshape = reshape(Y1,length(x2),length(x1));
contour(x1,x2,Y1_reshape,[.0001 .001 .01 .05:.1:.95 .99 .999 .9999])

x1 = [-4 : 0.01 : 12] ;
x2 = [-4 : 0.01 : 12] ;

[X1,X2] = meshgrid(x1,x2);

Y2 = mvnpdf([X1(:) X2(:)] ,mu2,S2);
Y2_reshape = reshape(Y2,length(x2),length(x1));
contour(x1,x2,Y2_reshape,[.0001 .001 .01 .05:.1:.95 .99 .999 .9999])
hold off

syms x y
hold on 

P1 = 0.1;
P2 = 1-P1;
y = (33.75 - 2*log(P2/P1) - 3.75*x)/ 3.75;
ezplot(y,[-4 15 -4 15]);

P1 = 0.25;
P2 = 1-P1;
y = (33.75 - 2*log(P2/P1) - 3.75*x)/ 3.75;
ezplot(y,[-4 15 -4 15]);

P1 = 0.5;
P2 = 1-P1;
y = (33.75 - 2*log(P2/P1) - 3.75*x)/ 3.75;
ezplot(y,[-4 15 -4 15]);

P1 = 0.75;
P2 = 1-P1;
y = (33.75 - 2*log(P2/P1) - 3.75*x)/ 3.75;
ezplot(y,[-4 15 -4 15]);

P1 = 0.9;
P2 = 1-P1;
y = (33.75 - 2*log(P2/P1) - 3.75*x)/ 3.75;
ezplot(y,[-4 15 -4 15]);

title('x2 = (33.75 - 2*log(P2/P1) - 3.75*x1)/ 3.75');
legend('SIGMA_1','SIGMA_2','P1 = 0.1','P1 = 0.25','P1 = 0.5','P1 = 0.75','P1 = 0.9');
hold off


