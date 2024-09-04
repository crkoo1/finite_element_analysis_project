% Finite_element_analysis_1.m

% During this project, we will be performing a finite element analysis of
% two different problems 
% Matlab is used mainly as a matrix / equation solver for this project as
% well as plotting the graphs. 

% Problem 1 - Series of interconnected springs 

% Assuming each spring has unit length before the load was applied 
% use Matlab to calculate the displacement of each node after loading. 
% Use Matlab to plot displacement for all locations on all springs as 
% a function of position (measured from fixed wall).

% Problem 1 - Series of interconnected springs

% Given data
num_springs = 5;  % number of springs
k_spring = [0.25 0.5 1.5 0.75 1];
force = 2;  % force applied at the last spring in N

% Initialize matrix and vector
Spring_Matrix = [  1     0     0    0     0     0;
                   0     0.75 -0.5  0     0     0;
                   0     -0.5  2   -1.5   0     0;
                   0     0    -1.5  2.25 -0.75  0;
                   0     0     0   -0.75  1.75 -1;
                   0     0     0    0    -1     1 ];

Spring_force = [ 0; 0; 0; 0; 0; force];

% Solve for the unknown displacements
displacement = linsolve(Spring_Matrix, Spring_force);

% Position vector for plotting
x = 0:num_springs ;

% Display displacements
fprintf('Displacements at each node:\n');
for i = 1:length(displacement)
    fprintf('U%d = %.4f m\n', i-1, displacement(i));
end

% Plotting the results
figure;
plot(x, displacement, '-o');
xlabel('Position (node)');
ylabel('Displacement (m)');
title('Displacement of Each Node in the Spring System');
grid on;
