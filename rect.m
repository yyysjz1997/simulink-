% rect.m
% 实现一个单相不控的全桥整流器

function[sys,xo]=rect(t,x,u,flag,R1,C,R)
% 由于不是离散系统，输出参数没有包括ts
% 此外需要用户输入3个新的参数
% 交流母线电阻R1，直流滤波电容C，负载电阻R
% 根据不控全桥整流电路的原理，列写微分方程

a1=-(1/R1+1/R)/C;
a2=-1/R/C;
b1=1/R1/C;
b2=0;
if flag==0
   sys=[1 0 2 1 0 0];
   % 1个状态，x为输出直流电压（直流滤波电容电压）
   % 2个输出，sys(1)为输入交流母线电流；sys(2)为输出直流电压
   % 1个输入，u为交流输入电压
   % 初始状态为零
   xo=0;
elseif flag==1
      if abs(u)>=x
         sys=a1*x+b1*abs(u);
      else
         sys=a2*x;
         end
      elseif flag==3
            if abs(u)>=x
               sys(1)=sign(u)*(abs(u)-x)/R1;
               sys(2)=x;
            else
               sys(1)=0;
               sys(2)=x;
            end
         else
            sys=[];
            end