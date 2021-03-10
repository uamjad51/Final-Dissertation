fprintf('Triple-Deck Basics, P=sA+ gammaA_xx \n'); 
close all % closes open figures
global Yinf;  % Yinf neeeded for gridy
global ts pkick pas pagamma pkickphase; % PA law and starting values

% Physical Variables for run

pkick=0.0001;
pas=1;
pagamma=0.01; 
pkickphase=0;

% Grid Variables for run. 
ny=100;
x=0:1/ny:1;
Yinf=40;

ts=0;
nt=3200;
dt=0.05;
npts=length(x); 
itask=int64(2); %% itask=1 or 2
rtol  = 1*10^(1)*sqrt(nag_machine_precision);%[7*10^(-8)];%[5e-01];
atol  = 1*10^(1)*sqrt(nag_machine_precision);%[7*10^(-8)];%[5e-01];


% Description of problem for nag routine
npde  = int64(4);  % Number of pde
ncode = int64(2);  % Number of odes
nleft = int64(2);
nxi=1;xi = [x(end)];
% Tolerance

itol  = int64(1);
normt = 'A';laopt = 'F';algopt = zeros(30, 1);
remesh = false;xfix=[];nrmesh=int64(-1);dxmesh = 1;trmesh = 0;
%%%%%%%%%%%%%%%%
ipminf = int64(0); 
neqn = npde*npts + ncode;
lrsave=1000000;rsave = zeros(lrsave, 1);
mll=1000000;isave = zeros(mll, 1,'int64');
itrace=int64(0);ind=int64(0);
u     = zeros(1,neqn);  % Solution - it needs initialising
u1sol = zeros(nt,npts);
u2sol = zeros(nt,npts);
u3sol = zeros(nt,npts);
u4sol = zeros(nt,npts);
u5sol = zeros(nt,1);
u6sol = zeros(nt,1);
xsol  = zeros(nt,npts);
tsol  = zeros(nt,npts);
% Loop to march
j=1;toudot=ts;
% Record of initial profile
[u, v] = uvinitiblgeneralexp(npde, npts, nxi, x, xi, ncode);
u(4*npts+1)=v(1);
u(4*npts+2)=v(2);
icontinue=0;
while icontinue==0
  % store profile calculated so far
  xsol(j,:) = x;
  tsol(j,:) = ts;
  u1sol(j,:) = u(1:4:4*npts); % This works - I have checked
  u2sol(j,:) = u(2:4:4*npts);
  u3sol(j,:) = u(3:4:4*npts);
  u4sol(j,:) = u(4:4:4*npts);
  u5sol(j,1) = u(4*npts+1);
  u6sol(j,1) = u(4*npts+2);
  fprintf('j: %d and x-solved: %f \n',j,ts); 
  % next outputvalue
  toudot=toudot+dt;
  [ts, u, x, rsave, isave, ind, ifail] = ...
  d03pr( ...
      npde, ts, toudot, @pdedefibl, @bndaryibl, @uvinitiblgeneralexp, u, x, nleft, ncode, ...
      @odedefgeneral, xi, rtol, atol, itol, normt, laopt, algopt, remesh, ...
      xfix, nrmesh, dxmesh, trmesh, ipminf, @monitf, rsave, isave, ...
      itask, itrace, ind,'xratio', 1.5, 'con', 2/50);
  icontinue=ifail;
  if icontinue == 0
    j=j+1;
  end
  if j > nt 
      icontinue=2;
  end
  end
  nout=j-1; %nout is hopefully number of accurately computed t-values
  fprintf('Loop finished, ifail = %d \n',ifail); 
  fprintf('Loop finished, icontinue = %d \n',icontinue);
  fprintf('To plot results call plotting.m - now');
  filename=join(['CompletedRun S= ',num2str(pas), ' gamma=', num2str(pagamma),'.mat'])
  save(filename)
