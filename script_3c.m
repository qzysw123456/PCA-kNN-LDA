Train = load ('face_train_data_960.txt');
Test = load('face_train_data_960.txt');

[n,m] = size(Train);
[U,S] = myPCA(Train,10);

figure(1)
for i = 1 : 5
    subplot(3,3,i);
    imagesc(reshape(Train(i,1:m-1),32,30)');
end


proj  = (U'*Train(:,1:m-1)')';
iproj = U * proj';
iproj = iproj';
figure(2)
for i = 1 : 5
    subplot(3,3,i);
    imagesc(reshape(iproj(i,1:m-1),32,30)');
end

%for i = 1 : 5
%    subplot(3,3,i);
%    imagesc(reshape(Train(i,1:m-1),32,30)');
%end
