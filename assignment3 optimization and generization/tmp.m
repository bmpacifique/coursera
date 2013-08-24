function tmp()
a=[0 0 0 0 0];max=[100,90];
for i=1:31
    a(1)=a(1)+1;
    for j=1:4
        if a(j)>1
            a(j)=a(j)-2;
            a(j+1)=a(j+1)+1;
        end
    end
    a;
    tmp1=cal(a);
    if tmp1<max(1)
        max(1)=tmp1;conf1=a;
    else if tmp1<max(2) && tmp1~=max(1)
            max(2)=tmp1;conf2=a;
        end
    end
end
max
conf1
conf2
function y=cal(m)
a=m(1);b=m(2);c=m(3);d=m(4);e=m(5);
y=a*c+b*c+c*d*2+c*e*2+d*e*3-2*a*d-3*b*e;
y=-y;
