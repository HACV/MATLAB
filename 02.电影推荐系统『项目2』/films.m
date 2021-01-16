%----2.��ȡ�Ƽ����������ƶ�(������)
function films=films(id)
    %��ȡǰ�������ƶȾ��󣨵����Ӻ���1��
    simvalueuserId=get_similarity(id);
    base=load('ratings.data');
    %��ȡ��Ӱ����
    items=importdata('movies.data','|',0);
    %�ȶ�����Ƽ���Ӱ�Ŀռ�
    films=[];
    %ǰ5�����ƶȱ�����Ӱ
    for n=1:5
        %��ȡ�������û������־���
        first_base = base(base(:,1)==simvalueuserId(n,2),:);
        %��ȡ���û�����Ϊ5�ֵ���ߵĵ�Ӱ���־���
        first_base_top = first_base(find(first_base(:,3)==5),:);
        %��ȡ��Ӱ��
        films_items=items.textdata(first_base_top(:,2),2);
        %׷�ӵ�Ӱ������ǰ����õĿռ���
        films=[films;films_items];
    end
    %uniqueȥ�أ���ֹ5���������û��Ƽ��ĵ�Ӱ���ظ�
    films=unique(films);
end

%------�Ӻ���1----���ƶȼ���
function simvalueuserId=get_similarity( id )
    %��ȡmakedataŪ�������־���
    load('rating');
    %ͨ�������idŪ�����û��Ը���Ӱ������������δ����Ϊ0��
    oneLine=getOneLine(id);
    %�������û�����������׷�ӵ�ratingĩβ
    rating=[rating;oneLine];
    %ת�ã���Ϊcorrcoef������е����ƶȣ�
    rating=rating';
    %��ø���֮���Ƥ��ѷ���ƶ�
    corr=corrcoef(rating);
    %��ȡ���У��������û���
    [corr_line,corr_row] = size(corr);
    %��ȡ���һ�е����ƶȣ����������id�û���������û������ƶ�
    similarity = corr(:,corr_row);
    %ȥ������������ƶ�
    similarity(corr_line)=[];
    %--- �õ�ǰ5�����ƶ�ֵ���û�id����
    [sim_v sim_i]=sort(similarity,1,'descend');
    simvalueuserId=[sim_v(1:5),sim_i(1:5)];     
end

%------�Ӻ���2
function [oneLine]=getOneLine( id )
%ͨ���û���ID��ȡ�Ը�����Ӱ�����ֵ�0����
%��ȡ���Լ����û�ID����Ӱid�����֣�ʱ�����
test=load('ratings.data');
%ȥ��ʱ���
test=test(:,1:3);
%���ҵ������û���id�ĶԵ�Ӱ���������֣��û�id����ӰID�����ֵľ���
oneTest=test(test(:,1)==id,:);
%ֱ�Ӷ�ȡinfo���ĵ�Ӱ��
info=textread('u.info','%n%*[^\n]');%ʹ��������ʽ
oneLine=zeros(1,info(2));
%------ ����Ӱ������ֵ
[oneTestNum,v] = size(oneTest);
for n=1:oneTestNum
    oneTestLine = oneTest(n,:);
    oneLine(oneTestLine(2)) = oneTestLine(3);
end
end