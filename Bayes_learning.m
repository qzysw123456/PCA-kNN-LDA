%%Training function in Bayes learning.m: 
%%Bayes Learning(training data , validation data). 
%%The function returns the outputs (p1: learned Bernoulli 
%%parameters of the first class, 
%%p2: learned Bernoulli parameters of the sec- ond class,
%%pc1: best prior of the first class, 
%%pc2: best prior of the second class). 
%%It must also print to the terminal 
%%(sprintf) a table of error rates of all priors.
%Valid = load('SPECT_valid.txt');
%Train = load('SPECT_train.txt');
function [p1 p2 pc1 pc2] = Bayes_learning(Train,Valid)
[n,m] = size(Train);
tag = Train(:,m);
X1 = Train(tag == 1,1:m-1);
X2 = Train(tag == 2,1:m-1);

p1 = mean([X1; ones(1,m-1)]);
p2 = mean([X2; ones(1,m-1)]);

sigma = [-5:5];
Pclass1 = 1./(1+exp(sigma));
Pclass2 = 1-Pclass1;

err = zeros(1,11);

for i = 1 : length(Valid)
    sample = Valid(i,1:m-1);
    tag = Valid(i,m);
    ret1 = sum(log(p1.^sample)+log((1-p1).^(1-sample)));
    ret2 = sum(log(p2.^sample)+log((1-p2).^(1-sample)));
    dis = ret1 - ret2 + log(Pclass1) - log(Pclass2);
    if tag == 1
        err = err + (dis < 0);
    end
    if tag == 2
        err = err + (dis > 0);
    end
end

[dummy pos] = min(err);
pc1 = Pclass1(pos);
pc2 = Pclass2(pos);
sprintf('error rate of each prior %0.5f %0.5f %0.5f %0.5f %0.5f %0.5f %0.5f %0.5f %0.5f %0.5f %0.5f\n',err/n)
end