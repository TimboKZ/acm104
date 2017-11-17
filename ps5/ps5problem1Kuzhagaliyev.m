% ACM 104 : Applied Linear Algebra
% PS5, Problem 1.
%%------------------------------------------------------------------
clc; clear; close all;

f=@(x) cos(x)./(cosh(x));
a = 5;        % interpolation interval [-a,a]
n = [3, 5, 10, 15];  % number of sampling points

for j=1:length(n)
    
    % Calculate coordinates of the function in basis admitted by 
    % transformed Legendre polynomials
    lpCoords = zeros(n(j), 1);
    for i=1:n(j)
        tlp = @(y) legendreP(i - 1, y / a);
        num = @(z) f(z) .* tlp(z);
        den = @(z) tlp(z) .* tlp(z);
        lpCoords(i) = integral(num, -a, a) / integral(den, -a, a);
    end
    
    tfit = linspace(-a, a, n(j));  % data for fitting
    yfit = f(tfit);                % data for fitting
    p = polyfit(tfit,yfit,n(j)-1); % coefficients of the interpolationg polynomial     
    tval = -a:0.1:a;               % data for plotting
    
    % Calculate y values for orthog. projection approximation
    lpval = zeros(length(tval), 1);
    for i=1:length(lpval)
        val = 0;
        for k=1:n(j)
            xval = tval(i) / a;
            val = val + lpCoords(k) * legendreP(k - 1, xval);
        end
        lpval(i) = val;
    end
    
    yval = polyval(p,tval);        % data for plotting            
    subplot(2,2,sub2ind([2,2],j));
    hold on;
    plot(tfit,yfit,'og');
    plot(tval,yval,'r');
    plot(tval,lpval,'g');
    h = ezplot(f,[-a,a]);
    set(h, 'Color', 'blue');      
    legend('Sample points', 'Interpolating polynomial', 'Orth. projection approx.', 'f(x)');
    axis tight;
    title(strcat(strcat('Problem 5, a=', int2str(a)), strcat(', n=', int2str(n(j)))));
end