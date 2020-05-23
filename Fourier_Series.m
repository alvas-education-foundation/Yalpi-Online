clc; 
close all; 
clear all; 
dx=0.001; 
L=pi;
x=(-1+dx:dx:1)*L;
n=length(x); nquart=floor(n/4);
% define the hat function; 
f=0*x; 
f(nquart:2*nquart)=4*(1:nquart+1)/n;
f(2*nquart+1:3*nquart)=1-4*[1:500]/n;
plot(x, f,'r','LineWidth', 2); hold on;
%% define the coffeciet 
A0=sum(f.*ones(size(x)))*dx;
fFS = A0/2;
for k=1:10
Ak=sum(f.*cos(pi*k*x/L))*dx;
Bk=sum(f.*sin(pi*k*x/L))*dx;
fFS=fFS+Ak*cos(pi*k*x/L)+Bk*sin(pi*k*x/L);
plot(x,fFS);
pause(1); drawnow;
end