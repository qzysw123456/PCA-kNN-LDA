Train = load ('face_train_data_960.txt');
Test = load('face_train_data_960.txt');

[n,m] = size(Train);
[U,S] = myPCA(Train,-1);
close all;
proj  = [(U'*Train(:,1:m-1)')' Train(:,m)];
tproj = [(U'*Test(:,1:m-1)')' Test(:,m)];
[class,err_rate] = myKNN(proj,tproj,1);
sprintf('k = 1, err_rate = %0.5f',err_rate)
[class,err_rate] = myKNN(proj,tproj,3);
sprintf('k = 3, err_rate = %0.5f',err_rate)
[class,err_rate] = myKNN(proj,tproj,5);
sprintf('k = 5, err_rate = %0.5f',err_rate)
[class,err_rate] = myKNN(proj,tproj,7);
sprintf('k = 7, err_rate = %0.5f',err_rate)
