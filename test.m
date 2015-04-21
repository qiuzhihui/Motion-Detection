clear all
close all
clc
%in the final figure 1 = standing; 2 = walking; 3 =running; 4 = falling;




sample=80;
% 4 pattern of std mean and max
std1=0.1312; mean1=0.221; max1=0.7;
std2=1.13; mean2=1.45; max2=5.74;
std3=2.7; mean3=4.8; max3=18;
std4=5; mean4=2.5; max4=42;
a1=1;a2=1.2;a3=0.1;               %weight parameter of std mean and max





A=importdata('random.txt');         % x y z vaule
B=zeros(1,length(A));               %Vector sum of A
n=floor(length(B)/sample)*sample;   %points to decided

C=zeros(1,floor(length(B)/sample));   %std of every 50 points
D=C;                                %mean of every 50 points
E=C;                                %max value of every 50 points
index=zeros(1,length(C));




B= sqrt(A(:,1).^2+A(:,2).^2+A(:,3).^2);   %vector sum

plot(B)
title('magnitude of vactor sum');



%get std sum and max of every 80 points
for i=1:sample:n
    C(ceil(i/sample))=std(B(i:i+sample-1));
    D(ceil(i/sample))=sum(B(i:i+sample-1))/sample;  
      [x y]=max(B(i:i+sample));
    E(ceil(i/sample))=x;
%      B(i+y-1)=0;
%    E(ceil(i/sample))=quantile(B(i:i+sample),0.9);  

end

% A1=C;
% A2=C;
% A3=C;
% A4=C;

% 
% %get the l1 distances to the 4 pattern 
% for i=1:length(C)
% A1(i)=sqrt(a1*(C(i)-std1)^2+a2*(D(i)-mean1)^2+a3*(E(i)-max1)^2);
% A2(i)=sqrt(a1*(C(i)-std2)^2+a2*(D(i)-mean2)^2+a3*(E(i)-max2)^2);
% A3(i)=sqrt(a1*(C(i)-std3)^2+a2*(D(i)-mean3)^2+a3*(E(i)-max3)^2);
% A4(i)=sqrt(a1*(C(i)-std4)^2+a2*(D(i)-mean4)^2+a3*(E(i)-max4)^2);
% 
% end

% %get the min distance in each 4 values and get the index of the min
% %distance from 1 to 4;
% ALL= [A1;A2;A3;A4];
% for i=1:length(C)
%     
% [value index(i)]=min(ALL(:,i));
% 
% end
% 
% figure
% stem(index);








subplot(3,1,1)
stem(C);
title('std of 80 samples');
subplot(3,1,2)
stem(D);
title('mean of 80 samples');
subplot(3,1,3)
stem(E);
title('max of 80 samples');

% 
% 
ss=1;