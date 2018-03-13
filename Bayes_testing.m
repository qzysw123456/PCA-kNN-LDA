%%Testing function in Bayes testing.m: 
%%Bayes Testing(test data, p1: the learned
%%Bernoulli paramter of the first class, 
%%p2: the learned Bernoulli paramter of 
%%the second class, pc1: the learned prior 
%%of the first class, pc2: the learned prior
%%of the second class). The function must 
%%print to the terminal (sprintf) the error 
%%rate on the test dataset.
%Test = load('SPECT_test.txt');
function Bayes_testing(Test,p1,p2,pc1,pc2)
[n,m] = size(Test);
tag = Test(:,m);
err = 0;
for i = 1 : n
    sample = Test(i,1:m-1);
    tag = Test(i,m);
    ret1 = sum(log(  p1.^sample.*((1-p1).^(1-sample))) );
    ret2 = sum(log(  p2.^sample.*((1-p2).^(1-sample))) );
    dis = ret1 - ret2 + log(pc1) - log(pc2);
    if tag == 1
        err = err + (dis < 0);
    end
    if tag == 2
        err = err + (dis > 0);
    end
end
sprintf('err_rate = %0.5f',err/n)
end

%p = [0.1 0.2 0.3]
%S = [1 1 0]
%(p.^S.*((1-p).^(1-S)))
%sum(log(p.^S.*((1-p).^(1-S))))
%sum( log(p.^S)+log((1-p).^(1-S)) )
