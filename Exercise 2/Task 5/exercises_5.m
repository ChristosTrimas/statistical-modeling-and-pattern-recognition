close all;
clear;
clc;

%import the dataset
H = importdata('C:\Users\user\Desktop\exercises_2\exercise2_5\data_2_5.txt');

%initializations
axonasx = -0.5:00000.1:8;
m0 = 0;                         
variance = 1.25^2;              %sigma0^2
sigma0 = 10*variance;           %sigma^2 = 10sigma0^2
n = size(H.data,1);


% Hmean is the x_hat of equation 34
for i=1:n
    Hmean(i) = mean(H.data(1:i,1));
end
%equation 35 for m_n
for i=1:n
    Mn(i) = (n*sigma0/(n*sigma0+variance))*Hmean(1,i);
end
%equation 36 for s_n
for i=1:n
    Sn(i) = (sigma0*variance)/(i*sigma0+variance);
end

%creation of the pdfs for n=1,..,25
figure;
hold on;
for i=1:n
    pdf = normpdf(axonasx,Mn(i),sqrt(Sn(i)));
    plot(axonasx,pdf,'linewidth',2)
end
hold off;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%new x axis
axonasx = -3:00000.1:10;

%plot of p(x|H(n)) for sigma0^2 = 10sigma^2
figure;
hold on;
pdf2 = normpdf(axonasx,Mn(i),sqrt(variance+Sn(i)));
plot(axonasx,pdf2,'linewidth',2)


%plot of p(x|H(n)) for sigma0^2 = sigma^2
sigma0 = variance;
for i=1:n
    Mn(i) = (n*sigma0/(n*sigma0+variance))*Hmean(1,i);
    Sn(i) = (sigma0*variance)/(i*sigma0+variance);
end
pdf2 = normpdf(axonasx,Mn(i),sqrt(variance+Sn(i)));
plot(axonasx,pdf2,'linewidth',2)


%plot of p(x|H(n)) for sigma0^2 = 0.1sigma^2
sigma0 = 0.1*variance;
for i=1:n
    Mn(i) = (n*sigma0/(n*sigma0+variance))*Hmean(1,i);
    Sn(i) = (sigma0*variance)/(i*sigma0+variance);
end
pdf2 = normpdf(axonasx,Mn(i),sqrt(variance+Sn(i)));
plot(axonasx,pdf2,'linewidth',2)


%plot of p(x|H(n)) for sigma0^2 = 0.01sigma^2
sigma0 = 0.01*variance;
for i=1:n
    Mn(i) = (n*sigma0/(n*sigma0+variance))*Hmean(1,i);
    Sn(i) = (sigma0*variance)/(i*sigma0+variance);
end
pdf2 = normpdf(axonasx,Mn(i),sqrt(variance+Sn(i)));
plot(axonasx,pdf2,'linewidth',2)

hold off