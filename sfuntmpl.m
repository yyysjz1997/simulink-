function [sys,x0,str,ts] = sfuntmpl(t,x,u,flag)
switch flag,
  %%%%%%%%%%%%%%%%%%
  % Initialization %
  %%%%%%%%%%%%%%%%%%
  case 0,
    [sys,x0,str,ts]=mdlInitializeSizes;

  %%%%%%%%%%%%%%%
  % Derivatives %
  %%%%%%%%%%%%%%%
  case 1,
    sys=mdlDerivatives(t,x,u);

  %%%%%%%%%%
  % Update %
  %%%%%%%%%%
  case 2,
    sys=mdlUpdate(t,x,u);

  %%%%%%%%%%%
  % Outputs %
  %%%%%%%%%%%
  case 3,
    sys=mdlOutputs(t,x,u);

  %%%%%%%%%%%%%%%%%%%%%%%
  % GetTimeOfNextVarHit %
  %%%%%%%%%%%%%%%%%%%%%%%
  case 4,
    sys=mdlGetTimeOfNextVarHit(t,x,u);

  %%%%%%%%%%%%%
  % Terminate %
  %%%%%%%%%%%%%
  case 9,
    sys=mdlTerminate(t,x,u);

  %%%%%%%%%%%%%%%%%%%%
  % Unexpected flags %
  %%%%%%%%%%%%%%%%%%%%
  otherwise
    error(['Unhandled flag = ',num2str(flag)]);

end

% end sfuntmpl

%
%==================================================
% mdlInitializeSizes
% Return the sizes, initial conditions, 
% and sample times for the S-function.
%==================================================
%
function [sys,x0,str,ts]=mdlInitializeSizes

sizes = simsizes;
% 该语句返回一个没有经过初始化的sizes数组，此数组是
% s-function信息的载体。
% 根据s-function的实际情况及sizes数组各个字段的意义可以
% 对各字段进行赋值。
sizes.NumContStates  = 0;
sizes.NumDiscStates  = 0;
sizes.NumOutputs     = 0;
sizes.NumInputs      = 0;
sizes.DirFeedthrough = 1;
sizes.NumSampleTimes = 1;   
% at least one sample time is needed

sys = simsizes(sizes);

% 对sizes赋值完之后，再调用simsizes指令，将定义好的sizes
% 数组作为参数，并把结果返回给sys变量。
% 其实，simsizes(sizes)只是把sizes数组组成一个长度为6的
% 向量，因此完全可以用一条简单的赋值语句代替上述赋值。
% sys=[0,0,0,0,1,1];
% 注意输入的顺序与上述字段顺序相同。

% initialize the initial conditions
%
x0  = [];

%
% str is always an empty matrix
%
str = [];

%
% initialize the array of sample times
%
ts  = [0 0];

% end mdlInitializeSizes

%
%==================================================
% mdlDerivatives
% Return the derivatives for the continuous states.
%==================================================
%
function sys=mdlDerivatives(t,x,u)

sys = [];

% end mdlDerivatives

%
%====================================================
% mdlUpdate
% Handle discrete state updates, sample time hits, 
% and major time step
% requirements.
%====================================================
%
function sys=mdlUpdate(t,x,u)

sys = [];

% end mdlUpdate

%
%=====================================================
% mdlOutputs
% Return the block outputs.
%=====================================================
%
function sys=mdlOutputs(t,x,u)

sys = [];
% end mdlOutputs

%
%========================================================
% mdlGetTimeOfNextVarHit
% Return the time of the next hit for this block. 
% Note that the result is absolute time .  
% Note that this function is only used when you specify a
% variable discrete-time sample time [-2 0] 
% in the sample time array in mdlInitializeSizes.

%========================================================
%
function sys=mdlGetTimeOfNextVarHit(t,x,u)

sampleTime = 1;    
%  Example, set the next hit to be one second later.
sys = t + sampleTime;

% end mdlGetTimeOfNextVarHit

%
%=====================================================
% mdlTerminate
% Perform any end of simulation tasks.
%=====================================================
%
function sys=mdlTerminate(t,x,u)

sys = [];

% end mdlTerminate
