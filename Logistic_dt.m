%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%N8423
%%Santeri Paananen
%%CMiM
clearvars;close all;clc
dt = 20; T = 100; U_0 = 100;
f = @(u, t) 0.1*(1 - u/500)*u;
[u_base, t_base] = ode_FE(f, U_0, dt, T);
k = 1;
iteration = true;
while iteration == true
    dt_k = 2^(-k)*dt;
    [u_TBC, t_TBC] = ode_FE(f, U_0, dt_k, T);
    plot(u_base, t_base,'b',u_TBC, t_TBC,'r--');
    grid on;grid minor;
    xlabel('t'); ylabel('N(t)');
    fprintf('Timestep was: %g\n', dt_k);
    answer = input('Decrease the timestep for more clarified curve (y/n)? ', 's');
    if strcmp(answer,'y')|strcmp(answer,'yes')|strcmp(answer,'Yes')|strcmp(answer,'YES');
        u_base = u_TBC;
        t_base = t_TBC;
    elseif strcmp(answer,'n')|strcmp(answer,'no')|strcmp(answer,'No')|strcmp(answer,'NO');
        iteration = false;
        fprintf('You chose not to continue, the last timestep was: %g\n',answer,dt_k);
    else
        iteration = false;
        fprintf('Answer not regognized, program ended.');
    end
    k = k + 1;
end
