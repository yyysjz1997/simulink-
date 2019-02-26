function [sys,x0,str,ts] = csfunc(t,x,u,flag)
% 定义一个连续系统的 S-function   
%      x' = Ax + Bu
%      y  = Cx + Du

A=[-0.09   -0.01
    1          0];

B=[ 1   -7
    0   -2];

C=[ 0    2
    1   -5];

D=[-3    0
    1    0];

switch flag,

  %%%%%%%%%%%%%%%%%%
  % Initialization %
  %%%%%%%%%%%%%%%%%%
  case 0,
    [sys,x0,str,ts]=mdlInitializeSizes(A,B,C,D);

  %%%%%%%%%%%%%%%
  % Derivatives %
  %%%%%%%%%%%%%%%
  case 1,
    sys=mdlDerivatives(t,x,u,A,B,C,D);

  %%%%%%%%%%%
  % Outputs %
  %%%%%%%%%%%
  case 3,
    sys=mdlOutputs(t,x,u,A,B,C,D);

  %%%%%%%%%%%%%%%%%%%
  % Unhandled flags %
  %%%%%%%%%%%%%%%%%%%
  case { 2, 4, 9 },
    sys = [];

  %%%%%%%%%%%%%%%%%%%%
  % Unexpected flags %
  %%%%%%%%%%%%%%%%%%%%
  otherwise
    error(['Unhandled flag = ',num2str(flag)]);

end
% end csfunc

%
%=============================================================================
% mdlInitializeSizes
% Return the sizes, initial conditions, and sample times for the S-function.
%=============================================================================
%
function [sys,x0,str,ts]=mdlInitializeSizes(A,B,C,D)

sizes = simsizes;
sizes.NumContStates  = 2;%两个连续状态
sizes.NumDiscStates  = 0;
sizes.NumOutputs     = 2;%两个输出变量
sizes.NumInputs      = 2;%两个输入变量
sizes.DirFeedthrough = 1;%直接馈入
sizes.NumSampleTimes = 1;

sys = simsizes(sizes);
x0  = zeros(2,1);
str = [];
ts  = [0 0];

% end mdlInitializeSizes
%
%=============================================================================
% mdlDerivatives
% Return the derivatives for the continuous states.
%=============================================================================
%
function sys=mdlDerivatives(t,x,u,A,B,C,D)

sys = A*x + B*u;

% end mdlDerivatives
%
%=============================================================================
% mdlOutputs
% Return the block outputs.
%=============================================================================
%
function sys=mdlOutputs(t,x,u,A,B,C,D)

sys = C*x + D*u;

% end mdlOutputs