P = [0.30, 0.25, 0.15, 0.12, 0.08, 0.10];
P = sort(P,'descend');

code = {'00','10','010','011','110','111'};
L = sum(P.*cellfun('length',code))