Train = load('optdigits_train.txt');
Test = load('optdigits_test.txt');

[n,m] = size(Train);

[W,Eval] = myLDA(Train,2);
proj  = (W'*Train(:,1:m-1)')';
tproj = (W'*Test(:,1:m-1)')';

scatter(proj(:,1),proj(:,2),25,Train(:,m)');
hold
scatter(tproj(:,1),tproj(:,2),25,Test(:,m)','fill');
