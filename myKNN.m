function [TestTag err_rate]= myKNN(Train,Test,k)
[n,m] = size(Train);
Tag = Train(:,m);
Ans = [];
for i = 1:size(Test)
    x = Test(i,1:m-1);
    dist = Train(:,1:m-1) - x;
    dist = dist.*dist;
    dist = [sum(dist,2) Tag];
    dist = sortrows(dist,1);
    Ans =[Ans; mode(dist(1:k,2))];
end

TestTag = Test(:,m);
err = find(Ans-TestTag ~= 0);
err_rate = length(err)/length(Test);
end