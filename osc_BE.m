%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%N8423
%%Santeri Paananen
%%CMiM
%program given in the course book for oscillating system's numerical solution 4.3.3
omega = 2;
P = 2*pi/omega;
dt = P/20;
%dt = P/2000; % c) increasing the timestep to 2000 to improve the solution.
T = 3*P;
%T = 300*P; %Time scale is just for fun, to see the oscilation achieve
%equilibrium.
N_t = floor(round(T/dt));
t = linspace(0, N_t*dt, N_t+1);

u = zeros(N_t+1, 1);
v = zeros(N_t+1, 1);

% Initial condition
X_0 = 2;
u(1) = X_0;
v(1) = 0;

% Step equations forward in time
for n = 2:N_t+1
    %found formulas based on the exercise equations to: a) solve u(n)
    %and v(n), and to compute the numerical solution.
    u(n) = (1.0/(1+(dt*omega)^2)) * (dt*v(n-1) + u(n-1));
    v(n) = (1.0/(1+(dt*omega)^2)) * (-dt*omega^2*u(n-1) + v(n-1));
end

plot(t, u, 'b', t, X_0*cos(omega*t), 'r--');
grid on, grid minor;
legend('numerical', 'exact', 'Location', 'northwest');
xlabel('t');ylabel('amplitude');
print('tmp', '-dpdf');  print('tmp', '-dpng');
