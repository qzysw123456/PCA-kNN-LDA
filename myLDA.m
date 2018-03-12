function  [W Eval]= myLDA(Train,L)

%Train = load('optdigits_train.txt');
[n,m] = size(Train);
Tag = Train(:,m);

Sw = zeros(m-1,m-1);
Mu = zeros(1,m-1);
for i = 0 : 9
    X = Train(Tag == i, 1:m-1);
    Sw = Sw + cov(X);
    Mu = Mu + mean(X);
end
Mu = Mu / 10;

Sb = zeros(m-1,m-1);
for i = 0 : 9
    X = Train(Tag == i, 1:m-1);
    Sb = Sb + length(X)*(mean(X)-Mu)'*(mean(X)-Mu);
end

[V D] = eig((Sw+0.005*eye(m-1))^-1*Sb);
W = V(:,1:L);
Eval = D(:,1:L);
end