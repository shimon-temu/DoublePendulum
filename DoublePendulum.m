% initial value
l1 = 2; % arm_half_len
l2 = 1;
m1 = 2;
m2 = 1;
g = 9.80;
theta1 = 2*pi/3;
theta2 = 5*pi/6;
omega1 = 0;
omega2 = 0;
tspan = linspace(0, 20, 1000000);
u0 = [theta1 theta2 omega1 omega2];

% Compute answer of ODE. 
[t, u] = ode23s(@(t, u) odefunc(t, u, l1, l2, m1, m2, g), tspan, u0);
x12 = 2*l1*sin(u(:, 1)) + 2*l2*sin(u(:, 2));
y12 = -2*l1*cos(u(:, 1)) - 2*l2*cos(u(:, 2));

% Compute answer of ODE when the value of l2 is changed. 
l2 = l2 + 0.0000001;
[t, u] = ode23s(@(t, y) odefunc(t, y, l1, l2, m1, m2, g), tspan, y0);
x22 = 2*l1*sin(u(:, 1)) + 2*l2*sin(u(:, 2));
y22 = -2*l1*cos(u(:, 1)) - 2*l2*cos(u(:, 2));

% Plot trajectories of double pendulums. 
f1 = figure;
hold on;
plot(x12, y12);
plot(x22, y22);
pbaspect([1 1 1]);
legend('double pendulum'); 
hold off;