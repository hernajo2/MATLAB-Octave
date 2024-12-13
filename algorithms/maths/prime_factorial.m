%% Prime Factorization

function prime_factorization()

% This function gets user input number, calculates and displays its prime factors.
%
% 1) Input: The code asks the user to enter a number to decompose into prime factors.
%
% 2) Input Validation: It checks if the number is a positive integer greater than 1. 
% If not, it throws an error.
%
% 3) Prime Factorization: 
% Firstly, it divides the number by 2 repeatedly (if it's divisible by 2).
% Then, it checks for odd divisors (starting from 3) up to the square root 
% of the remaining number, dividing when it finds a factor.
%
% 4) Output: The prime factors are stored in an array and displayed in the 
% format n = p1 * p2 * ...

% Ask the user to enter a number
number = input('Enter a number to decompose into prime factors: ');

% Check if the number is a positive integer greater than 1
if mod(number, 1) ~= 0 || number <= 1
    error('The number must be a positive integer greater than 1.');
end

% Initialize an empty array to store the prime factors
primeFactors = [];
    
% Check for factor 2 (the smallest prime)
while mod(number, 2) == 0
    primeFactors = [primeFactors, 2];
    number = number / 2;
end

% Check for odd factors starting from 3
divisor = 3;
while divisor * divisor <= number
    while mod(number, divisor) == 0
        primeFactors = [primeFactors, divisor];
        number = number / divisor;
    end
    divisor = divisor + 2; % Skip even numbers as they are not primes
end

% If the remaining number is greater than 2, it must be prime
if number > 2
    primeFactors = [primeFactors, number];
end

% Display the prime factorization
disp('The prime factorization is:');
fprintf('%d = ', prod(primeFactors)); % Print the original number
disp(strjoin(arrayfun(@num2str, primeFactors, 'UniformOutput', false), ' * '));

end

