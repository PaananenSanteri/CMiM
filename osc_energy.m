%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%N8423
%%Santeri Paananen
%%CMiM
%simple function that calculates the potential energy and kinetic energy of
%the system.
function [U, K] = osc_energy(u, v, omega)
    U = 0.5*omega.^2*u.^2; %potential energy
    K = 0.5*v.^2; %kinetic energy
end
