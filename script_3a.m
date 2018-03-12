Train = load ('face_train_data_960.txt');
Test = load('face_train_data_960.txt');

[n,m] = size(Train);
[U,S] = myPCA(Train,-1);
figure(2);
for i = 1 : 5
    subplot(3,3,i);
    imagesc(reshape(Train(i,1:m-1),32,30)');
end
