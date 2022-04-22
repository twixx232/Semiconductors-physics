%define components 
admittance=component([-1i;-0.5i;0.25-0.5i;0.25+0.5i;0.5i;1i]); 
ground=component([0.25i;0;0.25;-0.25i;-0.25;0]);

%place instance 1 
inst{1}=admittance-1;
pins{1}=[inst{1}(1),inst{1}(6)];
nets{1}=model(1,1,0);

%place instance 2 
inst{2}=admittance.*1i+1i; pins{2}=[inst{2}(1),inst{2}(6)]; 
nets{2}=model(2,1,2);
%place instance 3 
inst{3}=admittance+1;
pins{3}=[inst{3}(1),inst{3}(6)]; 
nets{3}=model(3,2,0);
%place instance 4
inst{4}=ground-1-1.25i; 
gnds{1}=inst{4}(1);
%place instance 5
inst{5}=ground+1-1.25i; 
gnds{2}=inst{5}(1);
%get nodes
nodes=setdiff(cell2mat(pins),cell2mat(gnds),'stable'); 
disp(['number of nodes = ',num2str(length(nodes))])
%create netlist
netlist=vertcat([nets{1};
nets{2};nets{3}]); 
mystr1=split(netlist,': ',2); 
mystr2=split(mystr1(:,2),' == ',2); 
for k1=1:length(nodes) 
    index=find(strcmp(mystr1(:,1),['KCL(',num2str(k1),')'])); 
    strl=char.empty(1,0); 
    str2=char.empty(1,0); 
    for k2=1:length(index)
        strl=char([strl,'+',mystr2{index(k2),1}]); 
        str2=char([str2,'+',mystr2{index(k2),2}]); 
    end
    disp(['KCL(',num2str(k1),'): ',num2str(eval(strl)),' = ',strrep (str2(2:end)),'v0','0',';']) 
end
figure
plot(inst{1}) 
axis square equal 
axis([-3 3 -3 3]); 
hold on
plot(inst{2},'r') 
hold on
plot(inst{3},'g') 
plot(inst{4},'k') 
plot(inst{5},'k')
text(real(nodes),imag(nodes),string(1:length (nodes)),'FontSize',12,...'HorizontalAlignment','center','VerticalAlignment','bottom')
legend({'instance1';'instance2';'instance3'},'Location',' northeast','FontSize',8))
%create component 
function points=component(points) 
    points=[points;-conj(flipud(points(2:end-1)))]; 
end
%admittance model 
function exp=model(inst,in1,in2) 
    exp={['KCL(',num2str(in1),'): 0 == G',num2str(inst),... 
        '*(v',num2str(in1),'-v',num2str(in2),')'];... 
        ['KCL(',num2str(in2),'): 0 == G',num2str(inst),... 
        '*(v',num2str(in2),'-v',num2str(in1),')']};
end