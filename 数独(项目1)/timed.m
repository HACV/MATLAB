%2-------����ʱ����������
function timed(t,events,arg_str)
global Endtime 
Lefttime=etime(Endtime,clock);
if Lefttime<0
    stop(t);
    cc=gcf; 
ButtonName=questdlg('��Ŀ�Ķ�ʱ�䵽��Ŷ!',...
    'ʱ����ʾ��','̫���ˣ������Ҳ����ˣ�','��ʼ��Ϸ��','̫���ˣ������Ҳ����ˣ�');
switch ButtonName
    case '��ʼ��Ϸ��'
        helpdlg('��ӭ��ʽ����!(��������10������Ϸʱ��)','��ӭ��');
    otherwise
         close(cc);
end
    return
end
H=uicontrol('Style','text','String',...
    'ss','FontSize',14,'Position',[13 376 90 43],...
    'BackgroundColor','g');
LeftSeconds=floor(rem(Lefttime,60));
LeftMinutes=floor(rem(Lefttime/60,60));
r=sprintf('ʣ��ʱ��:\n%d��%d��',LeftMinutes,LeftSeconds);
set(H,'string',r);