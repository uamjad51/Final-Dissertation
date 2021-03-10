function [res, ires] = bndaryibl(npde, t, ibnd, nobc, u, udot, ncode, v, vdot, ires)
global Yinf ;
res = zeros(nobc, 1);
if (ibnd == 0)
    if (ires ~= -1)
        res(1) = u(1);
        res(2) = u(2);
    end
else
    if (ires ~= -1)
        res(1) =u(3)-1;
        res(2) = u(2)-v(1)-Yinf;
    end
end
