function dydt = odefunc(t, y, l1, l2, m1, m2, g)
    theta1 = y(1);
    theta2 = y(2);
    omega1 = y(3);
    omega2 = y(4);
    myu = m1 / m2;
    dydt = zeros(4, 1);
    dydt(1) = omega1;
    dydt(2) = omega2;
    dydt(3) = ( -2 * l2 * omega2^2 * sin(theta1 - theta2) - (2+myu)*g*sin(theta1) + 2*( g*sin(theta2) - 2 * l1 * omega1^2 * sin(theta1-theta2) ) * cos(theta1-theta2) ) / (l1 * (myu + 4 * (sin(theta1-theta2))^2 ));
    dydt(4) = ( (4+myu) * (2 * l1 * omega1^2 * sin(theta1-theta2) -g * sin(theta2)) + 2 * ( (2+myu)*g*sin(theta1) + 2*l2*omega2^2*sin(theta2) ) * cos(theta1-theta2) ) / (l2 * ( myu + 4 * (sin(theta1-theta2)^2) ));
end