Train = load('optdigits_train.txt');
Test = load('optdigits_test.txt');
[class,err_rate] = myKNN(Train,Test,1);
sprintf('k = 1, err_rate = %0.5f',err_rate)
[class,err_rate] = myKNN(Train,Test,3);
sprintf('k = 3, err_rate = %0.5f',err_rate)
[class,err_rate] = myKNN(Train,Test,5);
sprintf('k = 5, err_rate = %0.5f',err_rate)
[class,err_rate] = myKNN(Train,Test,7);
sprintf('k = 7, err_rate = %0.5f',err_rate)