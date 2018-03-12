%myPCA(data, num principal components).
%The function returns the prin- cipal components and the corresponding eigenvalues.
function [U S]= myPCA(Train,K)
%Train = load('optdigits_train.txt');
%K = -1;
[n,m] = size(Train);
train = Train(:,1:m-1);

mu = mean(train);
A = train;% - mu;
sigma = cov(A);
[U,S,V] = svd(sigma); %eig

k = 1;

indx = cumsum(diag(S))./sum(diag(S));
for i = 1 : length(indx)
    if indx(i)>= 0.9
        k = i;
        break
    end
end
if K ~= -1
    k = K
end
K = k;
S = diag(S)';

indx = cumsum(S)./sum(S);
plot(1:length(S),indx);
title(['select ', num2str(K) ,' components']);
sprintf('K(PoV) = %d',K)

U = U(:,1:k);
S = S(:,1:k);




%PCA = [(u'*train')' Train(:,m)];
end