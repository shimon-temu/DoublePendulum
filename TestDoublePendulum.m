% initial value
l1 = 2; % arm_half_len
l2 = 1;
m1 = 2;
m2 = 1;
g = 9.80;
theta1 = 2*pi/3;
theta2 = pi/2;
omega1 = 0;
omega2 = 0;
tspan = [0 50];
u0 = [theta1 theta2 omega1 omega2];
% options = odeset('RelTol',1e-8,'AbsTol',1e-10);

% Compute answer of ODE. 
[t, u] = ode23s(@(t, u) odefunc(t, u, l1, l2, m1, m2, g), tspan, u0);
x12 = 2*l1*sin(u(:, 1)) + 2*l2*sin(u(:, 2));
y12 = -2*l1*cos(u(:, 1)) - 2*l2*cos(u(:, 2));
vx12 = 2 * l1 * u(:, 2).*cos( u(:, 1) ) + l2 * u(:, 4).*cos( u(:, 2) );
vy12 = 2 * l1 * u(:, 2).*sin( u(:, 1) ) + l2 * u(:, 4).*sin( u(:, 2) );

% Compute answer of ODE when the value of l2 is changed. 
l2 = l2 + 0.0000001;
[t, u] = ode23s(@(t, y) odefunc(t, y, l1, l2, m1, m2, g), tspan, u0);
x22 = 2*l1*sin(u(:, 1)) + 2*l2*sin(u(:, 2));
y22 = -2*l1*cos(u(:, 1)) - 2*l2*cos(u(:, 2));


% Plot trajectories of double pendulums. 
f1 = figure;
hold on;
plot(x12, y12);
plot(x22, y22);
pbaspect([1 1 1]);
hold off;