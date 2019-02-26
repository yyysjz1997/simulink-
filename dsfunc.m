function [sys,x0,str,ts] = dsfunc(t,x,u,flag)
% DSFUNC An example M-file S-function for defining
% a discrete system.  
% Example M-file S-function implementing discrete equations: 
%      x(n+1) = Ax(n) + Bu(n)
%      y(n)   = Cx(n) + Du(n)
%   

% Generate a discrete linear system:
A=[-1.3839   -0.5097
    1.0000         0];

B=[-2.5559         0
         0    4.2382];

C=[      0    2.0761
         0    7.7891];

D=[   -0.8141   -2.9334
       1.2426         0];

switch flag,

  %%%%%%%%%%%%%%%%%%
  % Initialization %
  %%%%%%%%%%%%%%%%%%
  case 0,
    [sys,x0,str,ts] = mdlInitializeSizes(A,B,C,D);

  %%%%%%%%%%
  % Update %
  %%%%%%%%%%
  case 2,                                                
    sys = mdlUpdate(t,x,u,A,B,C,D); 

  %%%%%%%%%%
  % Output %
  %%%%%%%%%%
  case 3,                                                
    sys = mdlOutputs(t,x,u,A,C,D);

  %%%%%%%%%%%%%
  % Terminate %
  %%%%%%%%%%%%%
  case 9,                                                
    sys = []; % do nothing

  %%%%%%%%%%%%%%%%%%%%
  % Unexpected flags %
  %%%%%%%%%%%%%%%%%%%%
  otherwise
    error(['unhandled flag = ',num2str(flag)]);
end

%end dsfunc

%
%=======================================================================
% mdlInitializeSizes
% Return the sizes, initial conditions, 
% and sample times for the S-function.
%=======================================================================
%
function [sys,x0,str,ts] = mdlInitializeSizes(A,B,C,D)

sizes = simsizes;
sizes.NumContStates  = 0;
sizes.NumDiscStates  = size(A,1);%两个离散状态
sizes.NumOutputs     = size(D,1);%两个输出
sizes.NumInputs      = size(D,2);%两个输入
sizes.DirFeedthrough = 1;
sizes.NumSampleTimes = 1;

sys = simsizes(sizes);

x0  = ones(sizes.NumDiscStates,1);%初始状态为1
str = [];
ts  = [1 0]; %时间间隔为1，时间偏移为0

% end mdlInitializeSizes
%
%=======================================================================
% mdlUpdate
% Handle discrete state updates, sample time hits,
% and major time step requirements.

%=======================================================================
%
function sys = mdlUpdate(t,x,u,A,B,C,D)

sys = A*x+B*u;

%end mdlUpdate
%
%=======================================================================
% mdlOutputs
% Return Return the output vector for the S-function
%=======================================================================
%
function sys = mdlOutputs(t,x,u,A,C,D)

sys = C*x+D*u;

%end mdlUpdate

