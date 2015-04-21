clear all
close all
clc

%1 standing still
%2 walking
%3 running
%4 falling

sample=80;

A=importdata('random.txt');
B=zeros(1,length(A));
n=floor(length(B)/sample)*sample;
C=zeros(floor(length(B)/sample));


B= sqrt(A(:,1).^2+A(:,2).^2+A(:,3).^2);



for i=1:sample:n
    c(ceil(i/sample))=std(B(i:i+sample-1));
      
end


for i=1:sample:n
    d(ceil(i/sample))=sum(B(i:i+sample))/sample;  
end





figure
stem(c);

figure
stem(d);


d=c;

for i=1:length(c)
    if c(i)<0.3
        d(i)=1;
    elseif c(i)<2
        d(i)=2;
    elseif c(i)<5.5
        d(i)=3;
    else
        d(i)=4;
    end
    
end

figure
stem(d);











