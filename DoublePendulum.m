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
tspan = linspace(0, 13, 10000);
y0 = [theta1 theta2 omega1 omega2];
[t, y] = ode15s(@(t, y) odefunc(t, y, l1, l2, m1, m2, g), tspan, y0);

x12 = 2*l1*sin(y(:, 1)) + 2*l2*sin(y(:, 2));
y12 = -2*l1*cos(y(:, 1)) - 2*l2*cos(y(:, 2));

l2 = l2 + 0.0000001;
[t, y] = ode15s(@(t, y) odefunc(t, y, l1, l2, m1, m2, g), tspan, y0);
x22 = 2*l1*sin(y(:, 1)) + 2*l2*sin(y(:, 2));
y22 = -2*l1*cos(y(:, 1)) - 2*l2*cos(y(:, 2));

hold on;
plot(x12, y12);
plot(x22, y22);
pbaspect([1 1 1]);
legend('double pendulum'); 
hold off;