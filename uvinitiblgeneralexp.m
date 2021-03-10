function [u, v] = uvinitiblgeneralexp(~, npts, ~, s, ~, ncode)
global pkick ts pas pagamma pkickphase
y=gridy(s,0); % grid stretching
c=-airy(1,0); % first derivative of Airy
q=fsolve(@(q) pas+pagamma*q*q+3*c/q^(1/3), rand+rand*1i); % q=(3*c)^(3/7);
fprintf('Root for q found is  %f%+fi\n',[real(q), imag(q)]);
%fprintf(fid, '%f%+fi\n', [real(V(:)), imag(V(:))].');
e=exp(q*ts); % In case ts is not zero
p=pkick*exp(1i*pkickphase)*exp(-1i*angle(e));
a=p/(pas+pagamma*q*q);alpha=3*a*q^(1/3);
v = zeros(ncode, 1);
[tau,utilda,psi]=initialprofile(y,q^(1/3)); % generates profiles for U_Y,U,Psi
u(1:4:4*npts) = y.^2/2+real(e*alpha*psi);
u(2:4:4*npts) = y+real(e*alpha*utilda);
u(3:4:4*npts) = ones(size(y))+ real(e*alpha*tau);
u(4:4:4*npts) = real(e*p*ones(size(y))); 
v(1)=real(e*a);v(2)=real(q*e*a);
end
