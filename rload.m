% rload.m
% 实现一个阻性负载

function[sys,xo]=rload(t,x,u,flag,R)
% 由于不是离散系统，输出参数没有包括ts
% 此外需要用户输入1个新的参数
% 负载电阻R

if flag==0
   sys=[0 0 2 1 0 0];
   % 0个状态
   % 2个输出，sys(1)为负载电流；sys(2)为输出电压
   % 1个输入，u为交流输入电压
   % 初始状态为空
   xo=[];
elseif flag==1
   sys=0;
elseif flag==3
   sys(1)=u(1)/R;
   sys(2)=u(1);
   else
   sys=[];
   end