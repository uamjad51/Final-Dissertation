function [fmon] = monitf(t, npts, npde, x, u)
fmon = zeros(npts, 1);
for i = 2:npts - 1
    h1 = x(i) - x(i-1);
    h2 = x(i+1) - x(i);
    h3 = (x(i+1)-x(i-1))/2;
    % sed derivatives ..
    d2x1 = abs(((u(1,i+1)-u(1,i))/h2-(u(1,i)-u(1,i-1))/h1)/h3);
    d2x2 = abs(((u(2,i+1)-u(2,i))/h2-(u(2,i)-u(2,i-1))/h1)/h3);
    d3x3 = abs(((u(3,i+1)-u(3,i))/h2-(u(3,i)-u(3,i-1))/h1)/h3);
    fmon1=max(d2x1,d2x2);
    fmon(i) = max(fmon1,d3x3);
%     fmon(i) = max(d2x1,d2x2);
  end 
fmon(1)    = fmon(2);
fmon(npts) = fmon(npts-1);
end
