function varargout = game(varargin)
% GAME M-file for game.fig
%      GAME, by itself, creates a new GAME or raises the existing
%      singleton*.
%
%      H = GAME returns the handle to a new GAME or the handle to
%      the existing singleton*.
%
%      GAME('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GAME.M with the given input arguments.
%
%      GAME('Property','Value',...) creates a new GAME or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before game_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to game_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help game

% Last Modified by GUIDE v2.5 18-Nov-2018 16:46:53

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @game_OpeningFcn, ...
                   'gui_OutputFcn',  @game_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before game is made visible.
function game_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to game (see VARARGIN)

% Choose default command line output for game
handles.output = hObject;
handles.output = hObject;
h=axes('units','normalized','pos',[0 0 1 1]);
uistack(h,'down');
img=imread('./img/game_bg.png');
image(img);
colormap gray
set(h,'handlevisibility','off','visible','off');

img = imread('./img/start.png');
set(handles.pushbutton26,'CData',img);


% Update handles structure
guidata(hObject, handles);

% UIWAIT makes game wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = game_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global k;
global dilei_zongshu;
xi = 1;yi = 1;
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
    set(handles.pushbutton1,'String',num);
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
    if tempnum == dilei_zongshu
        warndlg('victory!!!');
    end
else
    zhadan_img = imread('./img/zhadan.png');
    set(handles.pushbutton1,'CData',zhadan_img);
    %bad
    for ii = 1:25
        str = num2str(ii);
        str = strcat('handles.pushbutton',str);
        set(eval(str),'String','','CData',zhadan_img);
    end
    warndlg('failure!!!');
end

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global k;
global dilei_zongshu;
xi = 1;yi = 2;
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
    set(handles.pushbutton2,'String',num);
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
    if tempnum == dilei_zongshu
        warndlg('victory!!!');
    end
else
    zhadan_img = imread('./img/zhadan.png');
    set(handles.pushbutton2,'CData',zhadan_img);
    %bad
    for ii = 1:25
        str = num2str(ii);
        str = strcat('handles.pushbutton',str);
        set(eval(str),'String','','CData',zhadan_img);
    end
    warndlg('failure!!!');
end

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global k;
global dilei_zongshu;
xi = 1;yi = 3;
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
    set(handles.pushbutton3,'String',num);
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
    if tempnum == dilei_zongshu
        warndlg('victory!!!');
    end
else
    zhadan_img = imread('./img/zhadan.png');
    set(handles.pushbutton3,'CData',zhadan_img);
    %bad
    for ii = 1:25
        str = num2str(ii);
        str = strcat('handles.pushbutton',str);
        set(eval(str),'String','','CData',zhadan_img);
    end
    warndlg('failure!!!');
end

% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global k;
global dilei_zongshu;
xi = 1;yi = 4;
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
    set(handles.pushbutton4,'String',num);
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
    if tempnum == dilei_zongshu
        warndlg('victory!!!');
    end
else
    zhadan_img = imread('./img/zhadan.png');
    set(handles.pushbutton4,'CData',zhadan_img);
    %bad
    for ii = 1:25
        str = num2str(ii);
        str = strcat('handles.pushbutton',str);
        set(eval(str),'String','','CData',zhadan_img);
    end
    warndlg('failure!!!');
end

% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global k;
global dilei_zongshu;
xi = 1;yi = 5;
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
    set(handles.pushbutton5,'String',num);
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
    if tempnum == dilei_zongshu
        warndlg('victory!!!');
    end
else
    zhadan_img = imread('./img/zhadan.png');
    set(handles.pushbutton5,'CData',zhadan_img);
    %bad
    for ii = 1:25
        str = num2str(ii);
        str = strcat('handles.pushbutton',str);
        set(eval(str),'String','','CData',zhadan_img);
    end
    warndlg('failure!!!');
end

% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global k;
global dilei_zongshu;
xi = 2;yi = 1;
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
    set(handles.pushbutton6,'String',num);
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
    if tempnum == dilei_zongshu
        warndlg('victory!!!');
    end
else
    zhadan_img = imread('./img/zhadan.png');
    set(handles.pushbutton6,'CData',zhadan_img);
    %bad
    for ii = 1:25
        str = num2str(ii);
        str = strcat('handles.pushbutton',str);
        set(eval(str),'String','','CData',zhadan_img);
    end
    warndlg('failure!!!');
end

% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global k;
global dilei_zongshu;
xi = 2;yi = 2;
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
    set(handles.pushbutton7,'String',num);
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
    if tempnum == dilei_zongshu
        warndlg('victory!!!');
    end
else
    zhadan_img = imread('./img/zhadan.png');
    set(handles.pushbutton7,'CData',zhadan_img);
    %bad
    for ii = 1:25
        str = num2str(ii);
        str = strcat('handles.pushbutton',str);
        set(eval(str),'String','','CData',zhadan_img);
    end
    warndlg('failure!!!');
end

% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global k;
global dilei_zongshu;
xi = 2;yi = 3;
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
    set(handles.pushbutton8,'String',num);
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
    if tempnum == dilei_zongshu
        warndlg('victory!!!');
    end
else
    zhadan_img = imread('./img/zhadan.png');
    set(handles.pushbutton8,'CData',zhadan_img);
    %bad
    for ii = 1:25
        str = num2str(ii);
        str = strcat('handles.pushbutton',str);
        set(eval(str),'String','','CData',zhadan_img);
    end
    warndlg('failure!!!');
end

% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global k;
global dilei_zongshu;
xi = 2;yi = 4;
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
    set(handles.pushbutton9,'String',num);
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
    if tempnum == dilei_zongshu
        warndlg('victory!!!');
    end
else
    zhadan_img = imread('./img/zhadan.png');
    set(handles.pushbutton9,'CData',zhadan_img);
    %bad
    for ii = 1:25
        str = num2str(ii);
        str = strcat('handles.pushbutton',str);
        set(eval(str),'String','','CData',zhadan_img);
    end
    warndlg('failure!!!');
end

% --- Executes on button press in pushbutton10.
function pushbutton10_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global k;
global dilei_zongshu;
xi = 2;yi = 5;
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
    set(handles.pushbutton10,'String',num);
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
    if tempnum == dilei_zongshu
        warndlg('victory!!!');
    end
else
    zhadan_img = imread('./img/zhadan.png');
    set(handles.pushbutton10,'CData',zhadan_img);
    %bad
    for ii = 1:25
        str = num2str(ii);
        str = strcat('handles.pushbutton',str);
        set(eval(str),'String','','CData',zhadan_img);
    end
    warndlg('failure!!!');
end

% --- Executes on button press in pushbutton11.
function pushbutton11_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global k;
global dilei_zongshu;
xi = 3;yi = 1;
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
    set(handles.pushbutton11,'String',num);
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
    if tempnum == dilei_zongshu
        warndlg('victory!!!');
    end
else
    zhadan_img = imread('./img/zhadan.png');
    set(handles.pushbutton11,'CData',zhadan_img);
    %bad
    for ii = 1:25
        str = num2str(ii);
        str = strcat('handles.pushbutton',str);
        set(eval(str),'String','','CData',zhadan_img);
    end
    warndlg('failure!!!');
end

% --- Executes on button press in pushbutton12.
function pushbutton12_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global k;
global dilei_zongshu;
xi = 3;yi = 2;
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
    set(handles.pushbutton12,'String',num);
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
    if tempnum == dilei_zongshu
        warndlg('victory!!!');
    end
else
    zhadan_img = imread('./img/zhadan.png');
    set(handles.pushbutton12,'CData',zhadan_img);
    %bad
    for ii = 1:25
        str = num2str(ii);
        str = strcat('handles.pushbutton',str);
        set(eval(str),'String','','CData',zhadan_img);
    end
    warndlg('failure!!!');
end

% --- Executes on button press in pushbutton13.
function pushbutton13_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global k;
global dilei_zongshu;
xi = 3;yi = 3;
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
    set(handles.pushbutton13,'String',num);
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
    if tempnum == dilei_zongshu
        warndlg('victory!!!');
    end
else
    zhadan_img = imread('./img/zhadan.png');
    set(handles.pushbutton13,'CData',zhadan_img);
    %bad
    for ii = 1:25
        str = num2str(ii);
        str = strcat('handles.pushbutton',str);
        set(eval(str),'String','','CData',zhadan_img);
    end
    warndlg('failure!!!');
end

% --- Executes on button press in pushbutton14.
function pushbutton14_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global k;
global dilei_zongshu;
xi = 3;yi = 4;
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
    set(handles.pushbutton14,'String',num);
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
    if tempnum == dilei_zongshu
        warndlg('victory!!!');
    end
else
    zhadan_img = imread('./img/zhadan.png');
    set(handles.pushbutton14,'CData',zhadan_img);
    %bad
    for ii = 1:25
        str = num2str(ii);
        str = strcat('handles.pushbutton',str);
        set(eval(str),'String','','CData',zhadan_img);
    end
    warndlg('failure!!!');
end

% --- Executes on button press in pushbutton15.
function pushbutton15_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global k;
global dilei_zongshu;
xi = 3;yi = 5;
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
    set(handles.pushbutton15,'String',num);
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
    if tempnum == dilei_zongshu
        warndlg('victory!!!');
    end
else
    zhadan_img = imread('./img/zhadan.png');
    set(handles.pushbutton15,'CData',zhadan_img);
    %bad
    for ii = 1:25
        str = num2str(ii);
        str = strcat('handles.pushbutton',str);
        set(eval(str),'String','','CData',zhadan_img);
    end
    warndlg('failure!!!');
end

% --- Executes on button press in pushbutton16.
function pushbutton16_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global k;
global dilei_zongshu;
xi = 4;yi = 1;
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
    set(handles.pushbutton16,'String',num);
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
    if tempnum == dilei_zongshu
        warndlg('victory!!!');
    end
else
    zhadan_img = imread('./img/zhadan.png');
    set(handles.pushbutto16,'CData',zhadan_img);
    %bad
    for ii = 1:25
        str = num2str(ii);
        str = strcat('handles.pushbutton',str);
        set(eval(str),'String','','CData',zhadan_img);
    end
    warndlg('failure!!!');
end

% --- Executes on button press in pushbutton17.
function pushbutton17_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global k;
global dilei_zongshu;
xi = 4;yi = 2;
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
    set(handles.pushbutton17,'String',num);
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
    if tempnum == dilei_zongshu
        warndlg('victory!!!');
    end
else
    zhadan_img = imread('./img/zhadan.png');
    set(handles.pushbutton17,'CData',zhadan_img);
    %bad
    for ii = 1:25
        str = num2str(ii);
        str = strcat('handles.pushbutton',str);
        set(eval(str),'String','','CData',zhadan_img);
    end
    warndlg('failure!!!');
end

% --- Executes on button press in pushbutton18.
function pushbutton18_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global k;
global dilei_zongshu;
xi = 4;yi = 3;
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
    set(handles.pushbutton18,'String',num);
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
    if tempnum == dilei_zongshu
        warndlg('victory!!!');
    end
else
    zhadan_img = imread('./img/zhadan.png');
    set(handles.pushbutton18,'CData',zhadan_img);
    %bad
    for ii = 1:25
        str = num2str(ii);
        str = strcat('handles.pushbutton',str);
        set(eval(str),'String','','CData',zhadan_img);
    end
    warndlg('failure!!!');
end

% --- Executes on button press in pushbutton19.
function pushbutton19_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global k;
global dilei_zongshu;
xi = 4;yi = 4;
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
    set(handles.pushbutton19,'String',num);
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
    if tempnum == dilei_zongshu
        warndlg('victory!!!');
    end
else
    zhadan_img = imread('./img/zhadan.png');
    set(handles.pushbutton19,'CData',zhadan_img);
    %bad
    for ii = 1:25
        str = num2str(ii);
        str = strcat('handles.pushbutton',str);
        set(eval(str),'String','','CData',zhadan_img);
    end
    warndlg('failure!!!');
end

% --- Executes on button press in pushbutton20.
function pushbutton20_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global k;
global dilei_zongshu;
xi = 4;yi = 5;
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
    set(handles.pushbutton20,'String',num);
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
    if tempnum == dilei_zongshu
        warndlg('victory!!!');
    end
else
    zhadan_img = imread('./img/zhadan.png');
    set(handles.pushbutton20,'CData',zhadan_img);
    %bad
    for ii = 1:25
        str = num2str(ii);
        str = strcat('handles.pushbutton',str);
        set(eval(str),'String','','CData',zhadan_img);
    end
    warndlg('failure!!!');
end

% --- Executes on button press in pushbutton21.
function pushbutton21_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global k;
global dilei_zongshu;
xi = 5;yi = 1;
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
    set(handles.pushbutton21,'String',num);
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
    if tempnum == dilei_zongshu
        warndlg('victory!!!');
    end
else
    zhadan_img = imread('./img/zhadan.png');
    set(handles.pushbutton21,'CData',zhadan_img);
    %bad
    for ii = 1:25
        str = num2str(ii);
        str = strcat('handles.pushbutton',str);
        set(eval(str),'String','','CData',zhadan_img);
    end
    warndlg('failure!!!');
end

% --- Executes on button press in pushbutton22.
function pushbutton22_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global k;
global dilei_zongshu;
xi = 5;yi = 2;
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
    set(handles.pushbutton22,'String',num);
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
    if tempnum == dilei_zongshu
        warndlg('victory!!!');
    end
else
    zhadan_img = imread('./img/zhadan.png');
    set(handles.pushbutton22,'CData',zhadan_img);
    %bad
    for ii = 1:25
        str = num2str(ii);
        str = strcat('handles.pushbutton',str);
        set(eval(str),'String','','CData',zhadan_img);
    end
    warndlg('failure!!!');
end

% --- Executes on button press in pushbutton23.
function pushbutton23_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton23 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global k;
global dilei_zongshu;
xi = 5;yi = 3;
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
    set(handles.pushbutton23,'String',num);
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
    if tempnum == dilei_zongshu
        warndlg('victory!!!');
    end
else
    zhadan_img = imread('./img/zhadan.png');
    set(handles.pushbutton23,'CData',zhadan_img);
    %bad
    for ii = 1:25
        str = num2str(ii);
        str = strcat('handles.pushbutton',str);
        set(eval(str),'String','','CData',zhadan_img);
    end
    warndlg('failure!!!');
end

% --- Executes on button press in pushbutton24.
function pushbutton24_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton24 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global k;
global dilei_zongshu;
xi = 5;yi = 4;
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
    set(handles.pushbutton24,'String',num);
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
    if tempnum == dilei_zongshu
        warndlg('victory!!!');
    end
else
    zhadan_img = imread('./img/zhadan.png');
    set(handles.pushbutton24,'CData',zhadan_img);
    %bad
    for ii = 1:25
        str = num2str(ii);
        str = strcat('handles.pushbutton',str);
        set(eval(str),'String','','CData',zhadan_img);
    end
    warndlg('failure!!!');
end
% --- Executes on button press in pushbutton25.
function pushbutton25_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton25 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global k;
global dilei_zongshu;
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
    if tempnum == dilei_zongshu
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


% --- Executes on button press in pushbutton26.
function pushbutton26_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton26 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global k;
global dilei_zongshu;
saolei_button_img = imread('./img/saolei_button_img.png');
k = unidrnd(2,5,5); 
dilei_zongshu = 0;
for ii = 1:5
    for jj = 1:5
        if k(ii,jj)==2
            dilei_zongshu = dilei_zongshu+1;
        end
    end
end
k%command print dilei juzhen,because need test
for ii = 1:25
    str = num2str(ii);
    str = strcat('handles.pushbutton',str);
    set(eval(str),'visible','on','String','','CData',saolei_button_img);
end

