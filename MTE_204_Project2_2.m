% MTE204_Project2_2.m

% During this project, we will be performing a finite element analysis of
% two different problems 
% Matlab is used mainly as a matrix / equation solver for this project as
% well as plotting the graphs. 

% Problem 2 - Temperature distribution in a rod
% Use Matlab to calculate the unknown temperature and gradient values and 
% to plot temperatures for all locations on the bar as a function of position.

% Given data
num_sections = 5;  % number of sections
t6 = 10; % temperature at point section 6
size_of_rod = 0.5; 

% Initialize matrix and vector after getting the global equations
A = [  10    -10    0    0     0     0;
       -10    20   -10   0     0     0;
       0     -10    20  -10    0     0;
       0      0    -10   20   -10    0;
       0      0     0   -10    20    0;
       0      0     0    0     10    1 ];

B = [ -140; 120; 120; 120; 220; 40];
% Solve = [ t1; t2; t3; t4; t5; dt(x6)/dx];

% Solve for the unknown temperatures and gradient
Solve = linsolve(A, B);

% Making the temperature vector 
temp = Solve; 
temp(6) = t6; 

% Position vector for plotting
x = linspace(0, size_of_rod, num_sections + 1);

% Display displacements
fprintf('Temperature at each node:\n');
for i = 1:length(temp)
    fprintf('t%d = %.2f ºC\n', i, temp(i));
end

fprintf('dt(x6)/dx = %.2f \n', Solve(6)); 

% Plotting the results
figure;
plot(x, temp, '-o');
xlabel('Different element of the rod');
ylabel('Temperature (ºC)');
title('Temperature Distribution in a rod');
grid on;