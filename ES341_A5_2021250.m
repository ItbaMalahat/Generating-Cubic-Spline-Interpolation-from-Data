%importing data from text file
%specify file name
file_path = 'data.txt';

% Reading data points from txt file into data
data = load(file_path);

% Extracting x val
x = data(:, 1); 

%extract 
f = data(:, 2);


% Size of array
n = length(x);

% Initialize coefficients
a = f;
% Number of points
%N = length(x) - 1;
N = 99;

% Calculate step size hj
h = zeros(N, 1);
for j = 1:N
    h(j) = x(j+1) - x(j);
end

% Compute a's
a = y;

% Calculate B matrix
B = zeros(N+1, 1);
for i = 2:N
    B(i) = (3/h(i))*(a(i+1)-a(i)) - (3/h(i-1))*(a(i) - a(i-1));
end

% Natural spline
B(1) = 0;
B(N+1) = 0;

A = zeros(N+1, N+1);

% Natural boundary condition
A(1, 1) = 1;
A(N+1, N+1) = 1;

% Calculate coefficient matrix (tridiagonal matrix)

for i = 2:N
    A(i,i) = 2 * (h(i-1) + h(i));
    A(i,i+1) = h(i-1);
    A(i,i-1) = h(i);
    
end

% Solution for the system to compute c
c = A\B;
 ;
    hold on;
end
title('Cubic Spline Interpolation');
xlabel('X');
ylabel('Y');
grid on;