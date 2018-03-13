p = [0.6 0.1;0.6 0.9];

c1 = 0.8;
c2 = 0.2;

C1 = [0.06 0.54; 0.04 0.36];
C2 = [0.54 0.06; 0.36 0.04];

P = c1*C1 + c2*C2;

for i = 1: 2
    for j = 1 : 2
        C2(i,j)*c2/P(i,j)
    end
end
for i = 1: 2
    for j = 1 : 2
        C1(i,j)*c1/P(i,j)
    end
end

