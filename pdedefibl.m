function [res, ires] = pdedefibl(npde, t, x, u, udot, ux, ncode, v, vdot, ires)
d1=gridy(x,1); % grid stretching 
res = zeros(npde, 1);
  if (ires == -1)
      res(1) = 0;
      res(2) = 0;
      res(3) = -d1*(udot(2)*u(2)*flare(u(2))-udot(1)*u(3)+udot(4));
      res(4)=0;
  else
      res(1) = (ux(1) - d1*u(2));
      res(2) = (ux(2) - d1*u(3));
      res(3) = ux(3)-d1*(udot(2)*u(2)*flare(u(2))-udot(1)*u(3)+udot(4));
      res(4)=ux(4);
  end
end
