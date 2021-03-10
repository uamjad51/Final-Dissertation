nout=j-1; %nout is hopefully number of accurately computed t-values
fprintf('Loop finished, ifail = %d \n',ifail); 
fprintf('Loop finished, icontinue = %d \n',icontinue);
fprintf('To plot results call plotting.m - now');
filename=join(['CompletedRun S ','num2str(pas)', ' gamma ', 'num2str(pagamma)','.mat'])
save(filename)
