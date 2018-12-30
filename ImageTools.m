function varargout = ImageTools(varargin)
% IMAGETOOLS M-file for ImageTools.fig
%      IMAGETOOLS, by itself, creates a new IMAGETOOLS or raises the existing
%      singleton*.
%
%      H = IMAGETOOLS returns the handle to a new IMAGETOOLS or the handle to
%      the existing singleton*.
%
%      IMAGETOOLS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in IMAGETOOLS.M with the given input arguments.
%
%      IMAGETOOLS('Property','Value',...) creates a new IMAGETOOLS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ImageTools_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ImageTools_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ImageTools

% Last Modified by GUIDE v2.5 27-Nov-2018 22:04:13

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ImageTools_OpeningFcn, ...
                   'gui_OutputFcn',  @ImageTools_OutputFcn, ...
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


% --- Executes just before ImageTools is made visible.
function ImageTools_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command linemenu arguments to ImageTools (see VARARGIN)

% Choose default command linemenu output for ImageTools
handles.output = hObject;
h=axes('units','normalized','pos',[0 0 1 1]);
uistack(h,'down');
img=imread('./img/image_bg.png');
image(img);
colormap gray
set(h,'handlevisibility','off','visible','off');

img = imread('./img/clear.png');
set(handles.clearall,'CData',img);

img = imread('./img/save.png');
set(handles.save,'CData',img);

img = imread('./img/ok_xiao.png');
set(handles.ok,'CData',img);

global inicolor;
global iniline;
global inilink;
inicolor = 'r';
iniline = '.';
inilink = '-';
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes ImageTools wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command linemenu.
function varargout = ImageTools_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command linemenu output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in menu.
function menu_Callback(hObject, eventdata, handles)
% hObject    handle to menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns menu contents as cell array
%        contents{get(hObject,'Value')} returns selected item from menu
val = get(handles.menu,'Value');
switch val
    case 1
        set(handles.see,'String','请在第一个文本框中输入方程');
    case 2
        set(handles.see,'String','请选择指定方程');
    case 3
        set(handles.see,'String','请选择指定文件！');
        [file path] = uigetfile('.txt');
        set(handles.edit1,'String',strcat(path,file));
    case 4
        set(handles.see,'String','请载入图像');
        [file path] = uigetfile('.png');
        set(handles.edit1,'String',strcat(path,file));
        path = get(handles.edit1,'String');
        f=imread(path);
        axes(handles.axes1) ;
        imshow(f);
    case 5
        set(handles.see,'String','请选择图形：');
        set(handles.edit2,'Visible','off');
        set(handles.sanwei,'Visible','on');
        

end
% --- Executes during object creation, after setting all properties.
function menu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in ok.
function ok_Callback(hObject, eventdata, handles)
% hObject    handle to ok (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
val = get(handles.menu,'Value');
val2 = get(handles.menu2,'Value');
global inicolor;
global iniline;
global inilink;
order = strcat(strcat(inicolor,inilink),iniline);
switch val
    case 1
        str = get(handles.edit1,'String');
        x = 0:1/100:100;
        eval(strcat(str,';'));
        plot(handles.axes1,x,y,order);
    case 2
        eval( get(handles.edit1,'String'));
        eval( get(handles.edit2,'String'));
        x = 0:1/100:30;
        y = 0;
        switch val2
            case 2
                y = k*x+b;
            case 3
                y = a*(x.^2)+b*x+c;
            case 4
                y = sin(w*x+v);
        end
        plot(handles.axes1,x,y,order);
    case 3
        path = get(handles.edit1,'String');
        k = dlmread(path);
        x = k(1:1,:);
        y = k(2:2,:);
        plot(handles.axes1,x,y,order);
    case 4
        path = get(handles.edit1,'String');
        f=imread(path);
        axes(handles.axes1) ;
        f=f(:,:,3);
        f=histeq(f,256);  
        f=im2bw(f,0.386);
        rowhigh=102+276-1;    
        colhigh=193+277-1;
        f=f(102:rowhigh,193:colhigh);
        se=strel('square',14); 
        fo=imopen(f,se);
        f2=imclose(fo,se);
        f2=~f2;
        imshow(f2);
    case 5
         axes(handles.axes1) ;
        set(handles.edit2,'Visible','on');
        set(handles.sanwei,'Visible','off');
        switch get(handles.sanwei,'Value')
            case 1
                ezmesh('cos(u)*cos(v)','cos(u)*sin(v)','sin(u)')
            case 2
                t=0:pi/100:20*pi;
                x=sin(t);
                y=cos(t);
                z=t.*sin(t).*cos(t);
                plot3(x,y,z);
            case 3
                t = 0 :0.01: tan(25/180*pi);
                [X,Y,Z] = cylinder(t);
                surf(X,Y,Z);
        end
        
end
% --- Executes on button press in save.
function save_Callback(hObject, eventdata, handles)
% hObject    handle to save (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[f,p]=uiputfile({'*.jpg'},'save image');
str=strcat(p,f);
pix=getframe(handles.axes1);
imwrite(pix.cdata,str,'jpg')


function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in menu2.
function menu2_Callback(hObject, eventdata, handles)
% hObject    handle to menu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns menu2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from menu2
val = get(handles.menu2,'Value');
switch val
    case 1
        return;
    case 2
        set(handles.edit1,'String','k = 1;');
        set(handles.edit2,'String','b = 0;');
    case 3
        set(handles.edit1,'String','a = 1; b = 0;');
        set(handles.edit2,'String','c = 0;');
    case 4
        set(handles.edit1,'String','w = 1;');
        set(handles.edit2,'String','v = 0;');
end

% --- Executes during object creation, after setting all properties.
function menu2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to menu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in clearall.
function clearall_Callback(hObject, eventdata, handles)
% hObject    handle to clearall (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.axes1) ;
cla reset



% --- Executes on selection change in linemenu.
function linemenu_Callback(hObject, eventdata, handles)
% hObject    handle to linemenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns linemenu contents as cell array
%        contents{get(hObject,'Value')} returns selected item from linemenu
val = get(handles.linemenu,'Value');
%hong lan hei huang
global inicolor;

switch val
    case 2
        inicolor='r';
    case 3
        inicolor='b';
    case 4
        inicolor='k';
    case 5
        inicolor='y';
end
        
        
        

% --- Executes during object creation, after setting all properties.
function linemenu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to linemenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in colormenu.
function colormenu_Callback(hObject, eventdata, handles)
% hObject    handle to colormenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns colormenu contents as cell array
%        contents{get(hObject,'Value')} returns selected item from colormenu
global iniline;
val = get(handles.colormenu,'Value');
switch val
    case 2
        iniline = '.';
    case 3
         iniline = 'o';
    case 4
         iniline = '*';
end


% --- Executes during object creation, after setting all properties.
function colormenu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to colormenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end




% --- Executes on selection change in popupmenu6.
function popupmenu6_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns popupmenu6 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu6
global inilink;
val = get(handles.popupmenu6,'Value');
switch val
    case 2
        inilink = '-';
    case 3
         inilink = ':';
end

% --- Executes during object creation, after setting all properties.
function popupmenu6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end




% --- Executes on selection change in SANWEI.
function SANWEI_Callback(hObject, eventdata, handles)
% hObject    handle to SANWEI (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns SANWEI contents as cell array
%        contents{get(hObject,'Value')} returns selected item from SANWEI


% --- Executes during object creation, after setting all properties.
function SANWEI_CreateFcn(hObject, eventdata, handles)
% hObject    handle to SANWEI (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in sanwei.
function sanwei_Callback(hObject, eventdata, handles)
% hObject    handle to sanwei (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns sanwei contents as cell array
%        contents{get(hObject,'Value')} returns selected item from sanwei


% --- Executes during object creation, after setting all properties.
function sanwei_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sanwei (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


