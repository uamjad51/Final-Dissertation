function out=gridy(s,i)
% grid stretch, i is derivative, parameters in Yinf
global Yinf 
% if i==0 out=Yinf*(s.*s.*s); end
% if i==1 out=Yinf*(3.*s.*s); end
% if i==0 out=Yinf*(s.*s); end
% if i==1 out=Yinf*(2.*s); end
% if i==2 out=Yinf*(2*ones(size(s))); end
if i==0 out=Yinf*(s); end % No stretching.
if i==1 out=Yinf*(ones(size(s))); end
end
