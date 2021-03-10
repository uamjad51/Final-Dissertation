function [f, ires] = odedefjetgeneral(npde, t, ncode, v, vdot, nxi, xi, ucp, ucpx, ucpt, ires)
global pas pagamma
  f = zeros(ncode, 1);
  if (ires == -1)
    f(1)=-vdot(1);
    f(2)=-pagamma*vdot(2);
  else
    f(1)=v(2)-vdot(1);
    f(2)=ucp(4)-pagamma*vdot(2)-pas*v(1);      
  end  
end
