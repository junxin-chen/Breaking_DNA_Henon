function [x1,y1]=he_sin_map(a,b,x0,y0)
x1=mod(1-a*sin(x0)*sin(x0)+y0,1);
y1=mod(b*x0,1);
end
