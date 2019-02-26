% filt.m
% 实现一个LCC滤波器

function[sys,xo]=filt(t,x,u,flag,Lr,Cr,Co,R)
% 由于不是离散系统，输出参数没有包括ts
% 此外需要用户输入4个新的参数
% 电感Lr，电感电阻R，与电感串联的电容Cr，输出并联电容Co

% 初始化
if flag==0
   sys=[3 0 1 2 1 1];
   % 3个状态，x1为电感电流；x2为串联电容电压；x3为输出电压
   % 1个输出，sys(1)为输出电压
   % 2个输入，u(1)为输入电压，u(2)为负载电流
   % 初始状态为零
   xo=[0 0 0];
elseif flag==1
   % 微分方程描述
      sys(1)=[u(1)-x(2)-x(3)-R*x(1)]/Lr;
      sys(2)=x(1)/Cr;
      sys(3)=[x(1)-u(2)]/Co;
   elseif flag==3
         sys=x(3);
      else
         sys=[];
         end