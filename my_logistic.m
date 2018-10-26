clear
clc
%% ����fisheriris����
load fisheriris.mat

str=['setosa'];
y=ones(100,1);
for i=1:100
    y0(i)=strcmp(species(i),str)    
    if( y0(i))
    y(i)=0;
    else
    y(i)=1;
    end
end

%% ����ѵ�������Ͳ�������
% ѡ��������ǰ2ά����ʵ�顣
X = meas(1:100,1:2)';
X = [X;ones(1,100)];
Y = [ones(50,1);zeros(50,1)];


%% �ݶ��½������Logistic Regression
W=rand(3,1);
alpha=0.001;                %����ѧϰ��Ϊ0.001
 for i=1:5000
     h=1./(1+exp(-W'*X));   %����Ԥ�⺯��
     error=(Y-h');          %�������
     W=W+alpha*X*error/100*h*(ones(1,100)-h)';  %��д��ʧ����
 end

%% ��������ʸ�״ͼ
for i = 1 : 100
    x=X(:,i);
    y_test(i) = 1.0/(1+exp(-W'*x)); 
end
stem(y_test)

%% ���Ʒ���߽�
figure();
a=min(X(1,:))-0.2;
b=max(X(1,:))+0.5;
c=min(X(2,:))-0.2;
d=max(X(2,:))+0.5;
for n=a:0.1:b
    for m=c:0.1:d
        if m>-W(1,1)/W(2,1)*n-W(3,1)/W(2,1)
            plot(n,m,'g.','MarkerSize',20);
        else if m<-W(1,1)/W(2,1)*n-W(3,1)/W(2,1)
                plot(n,m,'y.','MarkerSize',20)
            end
        end
        hold on;
    end
end
axis([a b c d]);

for j=1:100
    x1=X(1,j);
    y1=X(2,j);
    if j<=50
    plot(x1,y1,'r<');
    else if j>50
    plot(x1,y1,'k+');
        end
    end
    hold on;
 end  

