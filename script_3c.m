Train = load ('face_train_data_960.txt');
Test = load('face_train_data_960.txt');

[n,m] = size(Train);
figure(2)
for i = 1 : 5
    subplot(3,3,i);
    imagesc(reshape(Train(i,1:m-1),32,30)');
end
figure(1)
[U,S] = myPCA(Train,10);

proj  = (U'*Train(:,1:m-1)')';
iproj = U * proj';
iproj = iproj';
figure(3)
for i = 1 : 5
    subplot(3,3,i);
    imagesc(reshape(iproj(i,1:m-1),32,30)');
end

figure(1)
[U,S] = myPCA(Train,50);

proj  = (U'*Train(:,1:m-1)')';
iproj = U * proj';
iproj = iproj';
figure(4)
for i = 1 : 5
    subplot(3,3,i);
    imagesc(reshape(iproj(i,1:m-1),32,30)');
end

figure(1)
[U,S] = myPCA(Train,100);

proj  = (U'*Train(:,1:m-1)')';
iproj = U * proj';
iproj = iproj';
figure(5)
for i = 1 : 5
    subplot(3,3,i);
    imagesc(reshape(iproj(i,1:m-1),32,30)');
end
