function varargout = note(varargin)
% NOTE M-file for note.fig
%      NOTE, by itself, creates a new NOTE or raises the existing
%      singleton*.
%
%      H = NOTE returns the handle to a new NOTE or the handle to
%      the existing singleton*.
%
%      NOTE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in NOTE.M with the given input arguments.
%
%      NOTE('Property','Value',...) creates a new NOTE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before note_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to note_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help note

% Last Modified by GUIDE v2.5 24-Nov-2018 20:26:45

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @note_OpeningFcn, ...
                   'gui_OutputFcn',  @note_OutputFcn, ...
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


% --- Executes just before note is made visible.
function note_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to note (see VARARGIN)

% Choose default command line output for note
handles.output = hObject;
h=axes('units','normalized','pos',[0 0 1 1]);
uistack(h,'down');
img=imread('./img/note_bg.png');
image(img);
colormap gray
set(h,'handlevisibility','off','visible','off');

img=imread('./img/add_button.png');
set(handles.add,'CData',img);

try
    cal_data = get(findobj('tag','pushbutton26'),'userdata');
    set(handles.title,'String',cal_data);
    set(handles.context,'String',cal_data);
catch ErrorInfo 
    return;
end
    
%disp(str);
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes note wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = note_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function title_Callback(hObject, eventdata, handles)
% hObject    handle to title (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of title as text
%        str2double(get(hObject,'String')) returns contents of title as a double


% --- Executes during object creation, after setting all properties.
function title_CreateFcn(hObject, eventdata, handles)
% hObject    handle to title (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function context_Callback(hObject, eventdata, handles)
% hObject    handle to context (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of context as text
%        str2double(get(hObject,'String')) returns contents of context as a double


% --- Executes during object creation, after setting all properties.
function context_CreateFcn(hObject, eventdata, handles)
% hObject    handle to context (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in add.
function add_Callback(hObject, eventdata, handles)
% hObject    handle to add (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
title = get(handles.title,'String');
context = get(handles.context,'String');
if isempty(title)||isempty(context)
    warndlg('title or context is empty!');
    return;
end
tempfid = fopen('./data/notepad_ini.txt','a');
fprintf(tempfid,'%s','#');
fprintf(tempfid,'%s',title);
fprintf(tempfid,'\r\n');
fclose(tempfid);

tempfid = fopen('./data/notepad_data.txt','a');
fprintf(tempfid,'%s','#');
fprintf(tempfid,'%s',title);
fprintf(tempfid,'\r\n');

fprintf(tempfid,'%s',context);
fprintf(tempfid,'\r\n');


msgbox('successfully!');
%jiazai xialakuang
text_index = 1;
data_str{1} = '';
str_temp = '';
fid = fopen('./data/notepad_ini.txt','r');
while (feof(fid) ~= 1)
    str_temp = fgetl(fid);
    str_temp = str_temp(2:length(str_temp));
    data_str{text_index} = str_temp;
    text_index = text_index + 1;
    if length(data_str)<1 
        continue
    end
    set(handles.menus,'String',data_str);
end
fclose(fid);

% --- Executes on selection change in menus.
function menus_Callback(hObject, eventdata, handles)
% hObject    handle to menus (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns menus contents as cell array
%        contents{get(hObject,'Value')} returns selected item from menus
text_index = 1;
data_str{1} = '';
str_temp = '';
fid = fopen('./data/notepad_ini.txt','r');
while (feof(fid) ~= 1)
    str_temp = fgetl(fid);
    str_temp = str_temp(2:length(str_temp));
    data_str{text_index} = str_temp;
    text_index = text_index + 1;
    if length(data_str)<1 
        continue
    end
    set(handles.menus,'String',data_str);
end
fclose(fid);
number = get(handles.menus,'Value');
title = get(handles.menus,'String');
if isempty(title)
    return;
end
order = title(number);
order = strcat('#',order);

fid = fopen('./data/notepad_data.txt','r');
flag = 0;
while (feof(fid) ~= 1)
    str_temp = fgetl(fid);
    
    if flag == 1
        str_temp =  native2unicode(str_temp);
        set(handles.see,'String',str_temp);
        break;
    end
    if strcmp(order,str_temp)
        flag = 1;
    end
end
fclose(fid);
set(handles.see,'userdata',get(handles.see,'String'));
% --- Executes during object creation, after setting all properties.
function menus_CreateFcn(hObject, eventdata, handles)
% hObject    handle to menus (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end




% --- Executes on button press in del.
function del_Callback(hObject, eventdata, handles)
% hObject    handle to del (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
number = get(handles.menus,'Value');
title = get(handles.menus,'String');
if isempty(title)
    return;
end
order = title(number);
order = strcat('#',order);

fid = fopen('./data/notepad_ini.txt','r');
flag = 0;
index = 1;
datatext2{1}='';
while (feof(fid) ~= 1)
    str_temp = fgetl(fid);
    
    if flag == 1
        flag = 0;
        continue;
    end
    if strcmp(order,str_temp)
        flag = 1;
        continue;
    end
    datatext{index} = str_temp;
    index = index + 1;
end
fclose(fid);
fid = fopen('./data/notepad_ini.txt','w');
for ii = 1:length(datatext2)
    str = datatext2{ii};
    fprintf(fid,'%s',str);
    fprintf(fid,'\r\n');
end
fclose(fid);

fid = fopen('./data/notepad_ini.txt','r');
while (feof(fid) ~= 1)
    str_temp = fgetl(fid);
    str_temp = str_temp(2:length(str_temp));
    data_str{text_index} = str_temp;
    text_index = text_index + 1;
    if length(data_str)<1 
        continue
    end
    set(handles.menus,'String',data_str);
end
fclose(fid);


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)




% --- Executes on selection change in popupmenu3.
function popupmenu3_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns popupmenu3 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu3
val = get(handles.popupmenu3,'Value');
switch val
    case 1%jie ping
        screenshot();
    case 2
        msgbox('emmmmm....');
end

% --- Executes during object creation, after setting all properties.
function popupmenu3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


