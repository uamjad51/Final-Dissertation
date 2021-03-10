function [t,u,psi] = initialprofile(y,a)
%initial velocity profile at points on array y
%   a is an example parameter that profile can depend upon
l=length(y);
t=calct(y,a);
u=integt(y,a);
psi=integintegt(y,a);
end
