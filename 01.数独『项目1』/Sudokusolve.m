%1---------�������ս���
function Sudokusolve()
while 1   %---------��ѭ����ͷ
global kkk num11 ss B woo aa
woo=0;
%------��⵼��
k111=xlsread('Sudoku.xls');
clc;
ButtonName=questdlg('������ȡ�������Ŀ�ȼ��ǣ�',...
    '(����)�ȼ�ѡ��','��','���','����','��');

%---1.���������س���
steps=100;
hwait=waitbar(0,'��ȴ�>>>>>>>>');
for k=1:steps
    if steps-k<=5
        waitbar(k/steps,hwait,'�������');
        pause(0.05);
    else
        str=['����������',num2str(k),'%'];
        waitbar(k/steps,hwait,str);
        pause(0.05);
    end
end
close(hwait); 
%1.���������س���

%2.
set(gcf,'color','b');
switch ButtonName
    case '��'%-----------�Ѷ�1������һ�������1��2
        ff=randperm(2,1);%1-2��
    case '���'%-----------�Ѷ�2������һ�������1��2        
        ff=2+randperm(2,1);%3-4���
    case '����'%-----------�Ѷ�3������һ�������1��2��3       
        ff=4+randperm(3,1);%5-7����
end
s111=k111((-8+ff*9):(-8+ff*9+8),:);
[a,b]=find(s111~=0);
B=[a,b];%---����Ǹ���Ϊ0������λ�á�(����)
C=[];
[num1,num2]=size(B);%--��ȡ������λ�õ��к���
for k222=1:num1
    C=[C;a(k222)*10+b(k222)];
end
cc=sort(C);
%--------����������������
[num3,num4]=size(cc);
BB=[];
for k111=1:num3
    str1=num2str(cc(k111));
BB=[BB;str2num(str1(1)),str2num(str1(2))];
end
aa=(BB(1:num3,1));
bb=(BB(1:num3,2));
jj=[];
for nummmm=1:num3
    jj=[jj;s111(aa(nummmm,1),bb(nummmm,1))];
end
B=[aa,bb,jj];%���ɵ���Ŀ����B
%-----------------------

axis off;
axis equal;
[aa,bb]=size(B);
for k2=1:aa
    num{B(k2,1),B(k2,2)}=B(k2,3);
end
%%%------------ԭʼ���ݽ�ֹ
ii=0;
kkk=[0,38,38,38,38,38,38,38,38];
num11=[0,37.5,37.5,37.5,37.5,37.5,37.5,37.5,37.5];
nnn=0;
for nn=1:9
    nnn=num11(nn)+nnn;
    for n=1:9
        ii=kkk(n)+ii;
        ss=num{n,nn};
        H=uicontrol('Style','edit','String',...
            ss,'FontSize',18,'Position',[(122+nnn) (351-ii) 37 37],...
            'BackgroundColor','w','Callback', @wheremap);
        pp=(get(H,'string'));
        if strcmp(pp,'')
        else
            set(H,'Style','text','BackgroundColor','y');
        end
    end
    ii=0;
end

uicontrol('Style','text','String',...
    '(����)','FontSize',16,'Position',[252 393 80 28],...
    'BackgroundColor','c');
uicontrol('Style','pushbutton','String',...
    '��ɣ���֤��','FontSize',18,'Position',[0 0 150 40],...
    'BackgroundColor','w','Callback',@button11);
uicontrol('Style','pushbutton','String',...
    '��ʾ��','FontSize',18,'Position',[410 0 150 40],...
    'BackgroundColor','w','Callback',@button22);

%-------------���ŵĺ�ɫ�����ú�ɫ���ɵ��text��������������
uicontrol('Style','text',...
    'Position',[122 270 337 5 ],...
    'BackgroundColor','black');
uicontrol('Style','text',...
    'Position',[122 156 337 5 ],...
    'BackgroundColor','black');
%----------���ŵĺ�ɫ�����ú�ɫ���ɵ��text��������������
uicontrol('Style','text',...
    'Position',[234 47 5 340 ],...
    'BackgroundColor','black');
uicontrol('Style','text',...
    'Position',[346 47 5 340 ],...
    'BackgroundColor','black');
%--------------------------
hold on
rectangle('Position',[0 0 9 9],...
    'LineWidth',6,'EdgeColor','r','Clipping','off');
ss=sudokuEngine(B);%%%��ss������ֵĶ���
helpdlg('����Կ���Ŀ30s','��ʾ��');
pp=30;%5miao
%-----------��Ϸ����ʱϵͳ
nowt=num2cell(fix(clock));
addt=cell(1,6);
addt={0,0,0,0,0,0 };
addt{1,6}=pp;
%����ʱ��
a=cell2mat(nowt);
b=cell2mat(addt);
count=a+b;
% %����ʱ�䵽�ر�H
% H=gcf;
global Endtime 
Endtime=[count];
t=timer('StartDelay', 0,'Period',0.05,...
    'TasksToExecute', 10000,...
    'ExecutionMode','fixedRate');
t.TimerFcn={@timed}; %% function����
start(t);
%%%%-------------����ʱ
% sss=num2cell(ss);%yuanbao
% disp(things);%%%%%Ū������һ������
pause(631);%------��1��
%-----------
ButtonN=questdlg('�Ƿ�������Ϸ��','ѡ��','��','ȡ�����˳���Ϸ��','��');
switch ButtonN
    case '��'
        close(figure(1)); 
    otherwise
        break;    
end   %---
end  %-------��ѭ����β
close(figure(1));
clc;
clear;
end   % �������Ľ�βend!!

%�Ӻ���1 %-��ȡ������ĸ��ӵ�λ�ã������ṩ�ж���ȷ������
function wheremap(hObj,event)
% global things
as=get(hObj,'Position');  %as �����飡��
%�󱻵���ĸ��ӵ�λ��
num1=as(1);%lie
num2=as(2);%han
kkk=[0,38,38,38,38,38,38,38,38];
num11=[0,37.5,37.5,37.5,37.5,37.5,37.5,37.5,37.5];
nnn=0;
ii=0;
for lie=1:9
    nnn=num11(lie)+nnn;
    for han=1:9
        ii=kkk(han)+ii;
        if 122+nnn==num1&&351-ii==num2
            num10=han;
            num20=lie;
        end
    end
    ii=0;
end
%����Ϊ����ӵ�λ�ã�����% [aaa,bbb]=size(things);% disp(aaa);% disp(bbb);% disp(id);
global ss woo
val=get(hObj,'string');
kk=str2num(val);
if kk==ss(num10,num20)
woo=1+woo;
end
if woo>=60&&kk==ss(num10,num20)
    helpdlg('����ˣ���ϲ�㣩','��ʾ��');
else    
if kk~=ss(num10,num20)
    helpdlg('����ط�����������������Լ��һ��Ŷ��',...
        '��ʾ��');
else
    set(hObj,'string',val);
end
end
end

%%�Ӻ���2  ��ť1
function button11(hObj,event)
%��aa����������������ȷ����������Ҫ��Զ��پͿ��Զ�
global woo aa
% if woo>=60
if woo>=(81-aa)
    helpdlg('����ˣ���ϲ�㣩','��ʾ��');
else
    helpdlg('���Լ��һ��Ŷ','��ʾ��');
end
end


%%�Ӻ���3  ��ť2
function button22(hObj,event)
global B
jj=sudokuEngine(B);
yy=[];
for ii=1:9
    for j=1:9
     kk=[ii,j,jj(ii,j)];
     yy=[kk;yy];
    end
end
% disp(yy);
[aa,bb]=size(yy);
for k2=1:aa
    num{yy(k2,1),yy(k2,2)}=yy(k2,3);
end
ii=0;
kkk=[0,38,38,38,38,38,38,38,38];
num11=[0,37.5,37.5,37.5,37.5,37.5,37.5,37.5,37.5];
nnn=0;
for nn=1:9
    nnn=num11(nn)+nnn;
    for n=1:9
        ii=kkk(n)+ii;
        ss=num{n,nn};
        H=uicontrol('Style','edit','String',...
            ss,'FontSize',18,'Position',[(122+nnn) (351-ii) 37 37],...
            'BackgroundColor','w','Callback', @wheremap);
        pp=(get(H,'string'));
        if strcmp(pp,'')
        else
            set(H,'BackgroundColor','y');
        end
    end
    ii=0;
end
clc;
end