
A = [- 0.0913];
B = [0.4831, 0.0913, 3.8116];
C = [1];
D = [0, 0, 0];

%% Create a continuous-time state space model
mod_con = ss(A, B, C, D);

%% Discretize with input sample time
mod_dis = c2d(mod_con, 60);


function mod_dis = init_no_radiation(in)
    A = [- 0.0913];
    B = [0.4831, 0.0913];
    C = [1];
    D = [0, 0];

    % Create a continuous-time state space model
    mod_con = ss(A, B, C, D);

    % Discretize with input sample time
    mod_dis = c2d(mod_con, 60);
end

% Create a discrete-time state space model directly using matrices for
% discrete-time state space model
sys = ss(A, B, C, D, 60);
