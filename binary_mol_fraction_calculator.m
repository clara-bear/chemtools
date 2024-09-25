% calculator to solve for mole fractions of binary mixtures based on
% refractive index of its components and refractometer results.
% how it works:
% solve for X_a and X_b:
% | nD_a*X_a + nD_b*X_b = nD_T |
% |      X_a +     X_b  = 1    |

% Enter your values for refractive index of your substances and for
% the refractometer measurements of your samples.

% Refractive index of A and B. Names.
A = "Butyl Acetate";
nD_A = 1.394;
B = "Ethyl Acetate";
nD_B = 1.372;

% Refractometer results.
% Additional mixtures can be added here and to the distillates array.
SD1 = 1.37437;
SD2 = 1.39435;
FD1 = 1.37855;
FD2 = 1.39431;

distillates = [SD1, SD2, FD1, FD2];

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%                 

% Coefficient matrix.
M = [nD_A, nD_B; 1, 1];
% Create vector of type [X_a, X_b].
mol_frac= @(nD_T) M \ [nD_T; 1];

% Calculate fractions and create table with results.

results = cell2mat(arrayfun(mol_frac, distillates, 'UniformOutput', false));
results_table = table(distillates', results(1,:)', results(2,:)', ...
    'VariableNames', ...
    {'Sample refractive index', sprintf('%s mole fraction', A), sprintf('%s mole fraction', B)})