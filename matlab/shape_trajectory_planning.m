D_p = 4; % diameter of pulleys
d_intp = 20; % distance between pulleys center
D_cyl = 5;

X_points=[7 7 6 6.2 4 4.2 3 2 3.1 2.8 5.5 5.2 7 7]; % x coordinates of lightning points
Y_points=[4 4 5 5.1 6.6 6.7 8 7.2 6.5 5.7 4.5 4.2 4 4]; % y coordinates of lightning points
Z_points=[1 0 0 0 0 0 0 0 0 0 0 0 0 1];
%X_points = [1 3 7];
%Y_points = [4 2 2];

plot3(X_points, Y_points, Z_points, 'r','LineWidth',6);
hold on;
tf = 1;
t = 0:0.1:tf;

theta_c = X_points./(D_cyl/2);
theta_l = Y_points./(D_p/2);
theta_p = asin((0.5+Z_points)./1.6);

traj_theta_c = zeros(size(theta_c, 2)-1, size(t, 2));
traj_theta_l = zeros(size(theta_l, 2)-1, size(t, 2));
traj_theta_p = zeros(size(theta_p, 2)-1, size(t, 2));

Px = [];
Py = [];
Pz = [];

for i= 1:size(traj_theta_c, 1)
    traj_theta_c(i,:)= theta_c(i)+3/(tf^2).*(theta_c(i+1)-theta_c(i)).*(t.^2)+(-2/(tf^3)).*(theta_c(i+1)-theta_c(i)).*(t.^3);
    traj_theta_l(i,:)= theta_l(i)+3/(tf^2).*(theta_l(i+1)-theta_l(i)).*(t.^2)+(-2/(tf^3)).*(theta_l(i+1)-theta_l(i)).*(t.^3);
    traj_theta_p(i,:)= theta_p(i)+3/(tf^2).*(theta_p(i+1)-theta_p(i)).*(t.^2)+(-2/(tf^3)).*(theta_p(i+1)-theta_p(i)).*(t.^3);
    Px = [Px traj_theta_c(i,:).*(D_cyl/2)];
    Py = [Py traj_theta_l(i,:).*(D_p/2)];
    Pz = [Pz (sin(traj_theta_p(i,:)).*1.6)-0.5];
end

plot3(Px, Py, Pz, '-o', 'Color', 'g', 'MarkerSize', 5, 'LineWidth',2);