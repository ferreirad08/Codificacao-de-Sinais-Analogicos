% Federal University of Amazonas
% Coding of Analog Signals Discipline
% Prof. M.Sc. David Alan de O. Ferreira

P = [0.30, 0.25, 0.15, 0.12, 0.08, 0.10];
P = sort(P,'descend')

S = P; h = []; r = 2;
while numel(S) > r
    S(end-r+1) = sum(S(end-r+1:end));
    S(end-r+2:end) = [];
    [S,I] = sort(S,'descend');
    [~,I] = max(I);
    h(end+1) = I;                  % Historic
end

code = {};
for i = 0:r-1
    code(end+1) = {num2str(i)};
end

for i = flip(h)
    for j = 0:r-1
        code(end+1) = strcat(code(i),num2str(j));
    end
    code(i) = [];
end

code

H = sum(P.*log10(1./P)/log10(r))   % Entropy
L = sum(P.*cellfun('length',code)) % Length
eta = H/L                          % Efficiency
gama = 1 - eta                     % Redundancy
