Train = load('optdigits_train.txt');
Test = load('optdigits_test.txt');

[U,S] = myPCA(Train,2);
[n,m] = size(Train);
proj  = (U'*Train(:,1:m-1)')';
tproj = (U'*Test(:,1:m-1)')';

scatter(proj(:,1),proj(:,2),25,Train(:,m)');
hold
scatter(tproj(:,1),tproj(:,2),25,Test(:,m)','fill');

