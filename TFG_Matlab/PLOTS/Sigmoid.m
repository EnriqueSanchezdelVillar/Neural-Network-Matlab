e=exp(1);
x=(-5:0.2:5);
x2=(0:0.2:5);
y=1./(1+e.^(-x));
y2=tanh(x);
y3=x2;

figure (1)
plot(x,y,'b')
grid on

figure(2)

plot(x,y2,'b')
grid on


figure(3)

n = -5:0.1:5;
a = poslin(n);
plot(n,a)
grid on




