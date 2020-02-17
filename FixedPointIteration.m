clear all;
close all;
func = @(x) cos(x)
afunc = @(x) acos(x)
drawArrow = @(x,y) quiver( x(1),y(1),x(2)-x(1),y(2)-y(1),0,'blue' );
dTime=2
x(1)=0.05;
X=[0:0.01:pi/2];
h=figure;
subplot(1,2,1);
plot(X,func(X),'r');
title('Fixed Point');
ta = annotation('textarrow', [0.37 0.4], [0.3 0.28]);
ta.String='cos(x)';
axis([0 pi/2 0 pi/2]);
set(gcf, 'Position',  [1, 1, 1920, 700])
frame = getframe(gcf); %get frame
I =  frame2im(frame);
img=imresize(I,[720,1920],'bicubic');
[img,cmap] = rgb2ind(img,256);
imwrite(img,cmap,'animation.gif','gif','LoopCount',Inf,'DelayTime',dTime);
pause(1)
hold on;
drawnow;
N=12;
plot(X,X,'k')
ta = annotation('textarrow', [0.38 0.32], [0.45 0.58]);
ta.String='x';
frame = getframe(gcf); %get frame
I =  frame2im(frame);
img=imresize(I,[720,1920],'bicubic');
[img,cmap] = rgb2ind(img,256);
imwrite(img,cmap,'animation.gif','gif','WriteMode','append','DelayTime',dTime);
pause(1)
plot(0.7391,0.7391,'k')
ta = annotation('textarrow', [0.3 0.285], [0.4 0.5]);
ta.String='x = cos x';
frame = getframe(gcf); %get frame
I =  frame2im(frame);
img=imresize(I,[720,1920],'bicubic');
[img,cmap] = rgb2ind(img,256);
imwrite(img,cmap,'animation.gif','gif','WriteMode','append','DelayTime',dTime);
for n=1:N
    x(n+1)=func(x(n));                   
end
subplot(1,2,2);
plot(X,func(X),'r');
hold on;
title('Fixed Point Iteration');
axis([0 pi/2 0 pi/2]);
frame = getframe(gcf); %get frame
I =  frame2im(frame);
img=imresize(I,[720,1920],'bicubic');
[img,cmap] = rgb2ind(img,256);
imwrite(img,cmap,'animation.gif','gif','LoopCount',Inf,'DelayTime',dTime);
plot(X,X,'k')
frame = getframe(gcf); %get frame
I =  frame2im(frame);
img=imresize(I,[720,1920],'bicubic');
[img,cmap] = rgb2ind(img,256);
imwrite(img,cmap,'animation.gif','gif','WriteMode','append','DelayTime',dTime);

for n=1:N-2
    x1=[x(n) x(n)];    
    if n==1        
        y1=[0 x(n+1)];
    else
        y1=[x(n) x(n+1)];
    end
    drawArrow(x1,y1);    
    h=text(0.75,0.1,strcat("x(",num2str(n),") = ",num2str(x(n+1))));      
    frame = getframe(gcf); %get frame
    I =  frame2im(frame);
    img=imresize(I,[720,1920],'bicubic');
    [img,cmap] = rgb2ind(img,256);
    imwrite(img,cmap,'animation.gif','gif','WriteMode','append','DelayTime',dTime);    
    pause(1)    
    x2=[x(n) x(n+1)];
    y2=[x(n+1) x(n+1)];
    drawArrow(x2,y2);
    frame = getframe(gcf); %get frame
    I =  frame2im(frame);
    img=imresize(I,[720,1920],'bicubic');
    [img,cmap] = rgb2ind(img,256);
    imwrite(img,cmap,'animation.gif','gif','WriteMode','append','DelayTime',10);    
    pause(1)
    x1=[x(n+1) x(n+1)];
    y1=[x(n+1) x(n+2)];
    drawArrow(x1,y1);
    delete(h)                    
    h=text(0.75,0.1,strcat("x(",num2str(n),") = ",num2str(x(n+1))));          
    frame = getframe(gcf); %get frame
    I =  frame2im(frame);
    img=imresize(I,[720,1920],'bicubic');
    [img,cmap] = rgb2ind(img,256);
    imwrite(img,cmap,'animation.gif','gif','WriteMode','append','DelayTime',dTime);    
    pause(1)
    x2=[x(n+1) x(n+2)];
    y2=[x(n+2) x(n+2)];
    drawArrow(x2,y2);           
    pause(1)
    frame = getframe(gcf); %get frame
    I =  frame2im(frame);
    img=imresize(I,[720,1920],'bicubic');
    [img,cmap] = rgb2ind(img,256);
    imwrite(img,cmap,'animation.gif','gif','WriteMode','append','DelayTime',dTime); 
    delete(h)                
end
h=text(0.75,0.1,strcat("x(",num2str(N),") = ",num2str(x(N))));          
frame = getframe(gcf); %get frame
I =  frame2im(frame);
img=imresize(I,[720,1920],'bicubic');
[img,cmap] = rgb2ind(img,256);
imwrite(img,cmap,'animation.gif','gif','WriteMode','append','DelayTime',dTime); 
