global k;
global num;
xi = 5;yi = 5;
x = [0,0,1,-1,1,1,-1,-1];
y = [1,-1,0,0,1,-1,-1,1];
num = 0;
kk = k(xi,yi);
if kk == 1 %no dilei
    num = 0;
    for ii=1:8
        tempx = x(ii)+xi;
        tempy = y(ii)+yi;
        if tempx>=1 && tempy>=1 && tempx<=5 && tempy<=5
            if k(tempx,tempy)==2
                num = num + 1;
            end
        else
            continue;
        end
    end
    set(handles.pushbutton25,'String',num);
    %succ check
    tempnum = 0;
    for ii =  1:25
        str = num2str(ii);
        str = strcat('handles.pushbutton',str);
        d = get(eval(str),'String');
        if strcmp(d,'')
            tempnum = tempnum + 1;
        end
    end
    if tempnum == num
        warndlg('victory!!!');
    end
else
    zhadan_img = imread('./img/zhadan.png');
    set(handles.pushbutton25,'CData',zhadan_img);
    %bad
    for ii = 1:25
        str = num2str(ii);
        str = strcat('handles.pushbutton',str);
        set(eval(str),'String','','CData',zhadan_img);
    end
    warndlg('failure!!!');
end