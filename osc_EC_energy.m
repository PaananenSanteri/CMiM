%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%N8423
%%Santeri Paananen
%%CMiM
%program given in the course book for oscillating system's numerical solution 4.3.3
omega = 2;
P = 2*pi/omega;
dt = P/20;
%T = 3*P;
T = 20*P; %simulation time was increased to clarify the plot more.
N_t = floor(round(T/dt));
t = linspace(0, N_t*dt, N_t+1);
u = zeros(N_t+1, 1);
v = zeros(N_t+1, 1);

% Initial condition
X_0 = 2;
u(1) = X_0;
v(1) = 0;

% Step equations forward in time
for n = 1:N_t
    %this function is pregiven in the course book for euler cromer
    v(n+1) = v(n) - dt*omega^2*u(n);
    u(n+1) = u(n) + dt*v(n+1);
end

%plotting the sum of potential and kinetic energy
[U, K] = osc_energy(u, v, omega);
plot(t, U+K, 'r');
grid on, grid minor;
xlabel('t');
ylabel('U+K');


