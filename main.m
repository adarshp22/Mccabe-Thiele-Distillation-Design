clc
clear all
%% Data Provided
% Feed
F=500;
zf=0.45;
qf=0.8;
% Sidestream
S=50;
xs=0.7;
qs=1;
% Product compositions: top and bottom
xd=0.97;
xw=0.02;

%% Question 1
% Experimental Data
xdata = [0 0.02 0.04 0.06 0.08 0.10 0.20 0.30 0.40 0.50 0.60 0.70 0.80 0.90 0.95 1.0];
ydata= [0 0.134 0.23 0.304 0.365 0.418 0.579 0.665 0.729 0.779 0.825 0.87 0.915 0.958 0.979 1];

% Curve fitting
func=@(Cf,xdata)(Cf(1).*xdata./(1+Cf(2).*xdata+Cf(3).*xdata.^2));
Cf0=[1,1,1];
Cf=lsqcurvefit(func,Cf0,xdata,ydata);
a=Cf(1); b=Cf(2);c=Cf(3);

% Plotting Equilibrium curves
figure(1)
plot(xdata,ydata)
hold on 
plot (xdata,a.*xdata./(1+b.*xdata+c.*xdata.^2))
hold off

%% Question 3
O=fsolve(@Equasolve,[0,0]);
D=O(1);
W=O(2);
xlabel('x')
ylabel('y')
title('Equilibrium Curves')

%% Question 4
% Plotting various operating lines on equiibrium curve
figure(2)

plot ((0:0.001:1),a.*(0:0.001:1)./(1+b.*(0:0.001:1)+c.*(0:0.001:1).^2),'-b');
hold on

% Plotting points
plot(xd,xd,'r-*')
plot(xw,xw,'r-*')
plot(xs,xs,'r-*')
plot(zf,zf,'r-*')
labels={'(xw,xw)','(zf,zf)','(xs,xs)','(xd,xd)'};
text([xw zf xs xd],[xw zf xs xd],labels,'VerticalAlignment','top','HorizontalAlignment','left')

% Feed Line
plot([0.35 zf],qf/(qf-1).*[0.35 zf]-zf/(qf-1),'-r')

%% Question 5
% Side line
plot([xs xs],[xs 0.95],'r')

% y=x
plot([0,1],[0,1],'b')

%% Question 6
% Minimium Reflux Ratio and true reflux ration
fun=@(Rmin)(Rmin/(Rmin+1)-(a*xs/(1+b*xs+c*xs^2)-xd)/(xs-xd));
Rmin=fsolve(fun,2);
R=2.5*Rmin;

%% Question 7
% Section 1 operating Line
L=R*D;
V=L+D;
plot([0 xd],R/(R+1)*[0 xd]+xd/(R+1),'--r')
plot([xs xd],R/(R+1)*[xs xd]+xd/(R+1),'-r')

func1=@(x1)(R/(R+1)*x1+xd/(R+1)-qf/(qf-1)*x1+zf/(qf-1));
x1=fsolve(func1,0.4); % Intersection abscissa
y1=R/(R+1)*xs+xd/(R+1);

%% Question 8
% Section 2 operating Line
V2=V+(1-qs)*S;
L2=L-qs*S;
plot([0 xs],[y1-L2/V2*xs y1],'--r')
plot([x1 xs],[y1-L2/V2*(xs-x1) y1],'-r')

% Section 3 operating Line
L3=L2+qf*F;
V3=V2-(1-qf)*F;
plot([xw 0.55],[xw xw+L3/V3*(0.55-xw)],'--r')
plot([xw x1],[xw xw+L3/V3*(x1-xw)],'-r')

%% Question 9
% McCabe-Thiele Method for construction and calculation of stages
y=xd;
n=0;
t=0;
x=xd;
while y>=xw
    t=t+1;
    yold=y;
    func1=@(x1)(y-qf/(qf-1)*x1+zf/(qf-1));
    x1=fsolve(func1,0.4);
    xold=x;
    func1=@(x)(y-a*x/(1+b*x+c*x^2));
    x=fsolve(func1,xold);
    plot([xold x],[y y],'-black') 
    if (x>xs)
       y=R/(R+1)*x+xd/(R+1);
       plot([x x],[y yold],'-black')
       n=n+1;
       C(t)=1;
    end
    if (x<=xs && x>x1 && xw-L3/V3*(xw-x)>qf/(qf-1)*x-zf/(qf-1))
        y= y1-L2/V2*(xs-x);
        plot([x x],[y yold],'-black')
        n=n+1;
        C(t)=2;
    end
    if (x<=x1 || xw-L3/V3*(xw-x)<=qf/(qf-1)*x-zf/(qf-1))
        y=xw-L3/V3*(xw-x);
        plot([x x],[y yold],'-black')
        n=n+1;
        C(t)=3;
    end
end
xlabel('x')
ylabel('y')
title('y vs x for a Disillation Column')
hold off

% Ideal tray, feed tray and side tray calculations
N=n-1+(xold-xw)/(xold-x);
disp(['Total number of ideal trays = ' num2str(N)])
for i=1:n
    if C(i)==2
        disp(['The side stream enters through ' num2str(i) 'th stage']);
        break
    end
end
for i=1:n
    if C(i)==3
        disp(['The feed enters through ' num2str(i) 'th stage']);
        break
    end
end