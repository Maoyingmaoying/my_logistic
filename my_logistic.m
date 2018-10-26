clear
clc
%% 读入fisheriris数据
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

%% 构造训练样本和测试样本
% 选用样本的前2维进行实验。
X = meas(1:100,1:2)';
X = [X;ones(1,100)];
Y = [ones(50,1);zeros(50,1)];


%% 梯度下降法求解Logistic Regression
W=rand(3,1);
alpha=0.001;                %设置学习率为0.001
 for i=1:5000
     h=1./(1+exp(-W'*X));   %构造预测函数
     error=(Y-h');          %计算误差
     W=W+alpha*X*error/100*h*(ones(1,100)-h)';  %列写损失函数
 end

%% 画后验概率杆状图
for i = 1 : 100
    x=X(:,i);
    y_test(i) = 1.0/(1+exp(-W'*x)); 
end
stem(y_test)

%% 绘制分类边界
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

