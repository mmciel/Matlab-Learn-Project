function varargout = DataTools(varargin)
% DATATOOLS M-file for DataTools.fig
%      DATATOOLS, by itself, creates a new DATATOOLS or raises the existing
%      singleton*.
%
%      H = DATATOOLS returns the handle to a new DATATOOLS or the handle to
%      the existing singleton*.
%
%      DATATOOLS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DATATOOLS.M with the given input arguments.
%
%      DATATOOLS('Property','Value',...) creates a new DATATOOLS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before DataTools_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to DataTools_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help DataTools

% Last Modified by GUIDE v2.5 27-Nov-2018 13:45:39

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @DataTools_OpeningFcn, ...
                   'gui_OutputFcn',  @DataTools_OutputFcn, ...
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


% --- Executes just before DataTools is made visible.
function DataTools_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to DataTools (see VARARGIN)

% Choose default command line output for DataTools
handles.output = hObject;
h=axes('units','normalized','pos',[0 0 1 1]);
uistack(h,'down');
img=imread('./img/datasolve_bg.png');
image(img);
colormap gray
set(h,'handlevisibility','off','visible','off');

img = imread('./img/ok_xiao.png');
set(handles.solve_in,'CData',img);
set(handles.solve_out,'CData',img);
img = imread('./img/save.png');
set(handles.save,'CData',img);
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes DataTools wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = DataTools_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1

% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in in.
function in_Callback(hObject, eventdata, handles)
% hObject    handle to in (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns in contents as cell array
%        contents{get(hObject,'Value')} returns selected item from in
val = get(handles.in,'Value');
switch val
    case 1
        return;
    case 2
        %from txt
        [file,path] = uigetfile('*.txt');
        if isequal(file,0)
           disp('File no find');
        else
           set(handles.solve_data1,'String',strcat(path,file));
        end
        
    case 3
        %from mat
        [file,path] = uigetfile('*.mat');
        if isequal(file,0)
           disp('File no find');
        else
           set(handles.solve_data1,'String',strcat(path,file));
        end
        
    case 4
        %from xls
        [file,path] = uigetfile('*.xls');
        if isequal(file,0)
           disp('File no find');
        else
           set(handles.solve_data1,'String',strcat(path,file));
        end
        
    case 5
        %from userdata
        try
            strdata = get(findobj('tag','see'),'userdata');
            set(handles.solve_data1,'String',strdata);
        catch ErrorInfo 
            return;
        end
    case 6
        %from edit
        return;
end

% --- Executes during object creation, after setting all properties.
function in_CreateFcn(hObject, eventdata, handles)
% hObject    handle to in (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function solve_data1_Callback(hObject, eventdata, handles)
% hObject    handle to solve_data1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of solve_data1 as text
%        str2double(get(hObject,'String')) returns contents of solve_data1 as a double


% --- Executes during object creation, after setting all properties.
function solve_data1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to solve_data1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function solve_data2_Callback(hObject, eventdata, handles)
% hObject    handle to solve_data2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of solve_data2 as text
%        str2double(get(hObject,'String')) returns contents of solve_data2 as a double


% --- Executes during object creation, after setting all properties.
function solve_data2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to solve_data2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in solve_out.
function solve_out_Callback(hObject, eventdata, handles)
% hObject    handle to solve_out (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
val = get(handles.out,'Value');
solvedata = 0;
datas = get(findobj('tag','solve_data1'),'userdata');
switch val
    case 1
        return;
    case 2
        %hanglieshi 
        solvedata = det(datas);
        %test : solvedata = [1 6 3];
        %temp_table = uitable(gcf,'Position',[520 20 480 365],'Data',solvedata);
        set(handles.solve_data2,'String',solvedata);
    case 3
        %junzhi/fangcha
        % datatemp1 = mean(datas)
        % datatemp2 = var(datas)
        solvedata = strcat(strcat(num2str(mean(datas)),'/'),num2str(var(datas)));
        set(handles.solve_data2,'String',solvedata);
    case 4
        %tezhengzhi
        [V,D] = eig(datas);
        solvedata = [V ;D];
        temp_table = uitable(gcf,'Position',[520 20 480 365],'Data',solvedata);
        
    case 5
        %zhi
        solvedata = strcat('R = ',num2str(rank(datas)));
        set(handles.solve_data2,'String',solvedata);
    case 6
        %nijuzhen
        solvedata = inv(datas);
        temp_table = uitable(gcf,'Position',[520 20 480 365],'Data',solvedata);
end
set(handles.solve_data2,'userdata',solvedata);
% --- Executes on button press in solve_in.
function solve_in_Callback(hObject, eventdata, handles)
% hObject    handle to solve_in (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
val = get(handles.in,'Value');
str_data = get(handles.solve_data1,'String');
data = 0;
switch val
    case 1
        msgbox('no order!');
        return;
    case 2
        %from txt
        data = dlmread(str_data);
        temp_table = uitable(gcf,'Position',[30 20 480 365],'Data',data);
        %set(handles.solve_data1,'userdata',data);
        %disp(data);
        
    case 3
        %from mat
        data = importdata(str_data);
        temp_table = uitable(gcf,'Position',[30 20 480 365],'Data',data);
        %set(handles.solve_data1,'userdata',data);
        %disp(data);
        
    case 4
        %from xls
        data = xlsread(str_data);
        temp_table = uitable(gcf,'Position',[30 20 480 365],'Data',data);
        %set(handles.solve_data1,'userdata',data);
        %disp(data);
        
    case 5
        %from userdata
        %set(handles.solve_data1,'userdata',data);
        str_temp_order = strcat('data = ',str_data);
        eval(str_temp_order);
        temp_table = uitable(gcf,'Position',[30 20 480 365],'Data',data);

    case 6
        %from edit
        %set(handles.solve_data1,'userdata',data);
        str_temp_order = strcat('data = ',str_data);
        eval(str_temp_order);
        temp_table = uitable(gcf,'Position',[30 20 480 365],'Data',data);
end
set(handles.solve_data1,'userdata',data);
% --- Executes on selection change in popupmenu4.
function popupmenu4_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns popupmenu4 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu4


% --- Executes during object creation, after setting all properties.
function popupmenu4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in out.
function out_Callback(hObject, eventdata, handles)
% hObject    handle to out (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns out contents as cell array
%        contents{get(hObject,'Value')} returns selected item from out


% --- Executes during object creation, after setting all properties.
function out_CreateFcn(hObject, eventdata, handles)
% hObject    handle to out (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end




% --- Executes on button press in save.
function save_Callback(hObject, eventdata, handles)
% hObject    handle to save (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[file path] = uiputfile('*.txt;*.xls;*.mat');
path = strcat(path,file);
d_data = get(findobj('tag','solve_data2'),'userdata');
dlmwrite(path,d_data);
msgbox('save ok!');
% --- Executes on selection change in popupmenu9.
function popupmenu9_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns popupmenu9 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu9


% --- Executes during object creation, after setting all properties.
function popupmenu9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


