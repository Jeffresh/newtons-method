clear
clc;
close all;

syms x y;

[a,b]=meshgrid(-10:1:10, -10:1:10);


f(x,y) = 100*(x^2 -y^2)+(1+x)^2;

z = double(subs(f(a ,b)));

dx = diff(f,x);
dy = diff(f,y);

dxx = diff(dx,x);
dyy = diff(dy,y);


dyx = diff(dy,x);
dxy = diff(dx,y);

surf(a,b,z), hold on;

sol = [10;10];


for i=1:100
    x=sol(1,i);
    y=sol(2,i);

    rdx = double(subs(dx(x,y)));
    rdy = double(subs(dy(x,y)));
    rdxx = double(subs(dxx(x,y)));
    rdxy = double(subs(dxy(x,y)));
    rdyx = double(subs(dyx(x,y)));
    rdyy = double(subs(dyy(x,y)));

    H = [rdxx rdxy;rdyx rdyy];
    sol(:,i+1) = sol(:,i) - 0.1 * inv(H) * ([rdx;rdy]);
    plot([sol(1,i) sol(1,i+1)],[sol(2,i) sol(2,i+1)],'r')

end

