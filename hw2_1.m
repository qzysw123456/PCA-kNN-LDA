Valid = load('SPECT_valid.txt');
Train = load('SPECT_train.txt');

[n,m] = size(Train);
tag = Train(:,m);
X1 = Train(tag == 1,1:m-1);
X2 = Train(tag == 2,1:m-1);

mu1 = mean(X1);
mu2 = mean(X2);

sigma = [-5:5];
p1 = 1./(1+exp(sigma));
p2 = 1-p1;

Err = zeros(1,11);
for i = 1 : n
    x = Valid(i,:);
    f = 0;
    for j = 1 : m-1
        f = f + (1-x(j))*log(mu1(j)) + x(j)*log(1-mu1(j));
        f = f - (1-x(j))*log(mu2(j)) - x(j)*log(1-mu2(j));
    end
    f = f + log(p1) - log(p2);
end

