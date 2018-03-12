Train = load('optdigits_train.txt');
Test = load('optdigits_test.txt');

[n,m] = size(Train);

[W,Eval] = myLDA(Train,2);
proj  = [(W'*Train(:,1:m-1)')' Train(:,m)];
tproj = [(W'*Test(:,1:m-1)')' Test(:,m)];
[class,err_rate] = myKNN(proj,tproj,1);
sprintf('k = 1, L = 2, err_rate = %0.5f',err_rate)
[class,err_rate] = myKNN(proj,tproj,3);
sprintf('k = 3, L = 2, err_rate = %0.5f',err_rate)
[class,err_rate] = myKNN(proj,tproj,5);
sprintf('k = 5, L = 2, err_rate = %0.5f',err_rate)

[W,Eval] = myLDA(Train,4);
proj  = [(W'*Train(:,1:m-1)')' Train(:,m)];
tproj = [(W'*Test(:,1:m-1)')' Test(:,m)];
[class,err_rate] = myKNN(proj,tproj,1);
sprintf('k = 1, L = 4, err_rate = %0.5f',err_rate)
[class,err_rate] = myKNN(proj,tproj,3);
sprintf('k = 3, L = 4, err_rate = %0.5f',err_rate)
[class,err_rate] = myKNN(proj,tproj,5);
sprintf('k = 5, L = 4, err_rate = %0.5f',err_rate)

[W,Eval] = myLDA(Train,9);
proj  = [(W'*Train(:,1:m-1)')' Train(:,m)];
tproj = [(W'*Test(:,1:m-1)')' Test(:,m)];
[class,err_rate] = myKNN(proj,tproj,1);
sprintf('k = 1, L = 9, err_rate = %0.5f',err_rate)
[class,err_rate] = myKNN(proj,tproj,3);
sprintf('k = 3, L = 9, err_rate = %0.5f',err_rate)
[class,err_rate] = myKNN(proj,tproj,5);
sprintf('k = 5, L = 9, err_rate = %0.5f',err_rate)