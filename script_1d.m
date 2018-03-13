Valid = load('SPECT_valid.txt');
Train = load('SPECT_train.txt');
Test = load('SPECT_test.txt');
[p1 p2 pc1 pc2] = Bayes_learning(Train,Valid);
Bayes_testing(Test,p1,p2,pc1,pc2);