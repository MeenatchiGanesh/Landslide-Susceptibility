%training

net=network;
net.numinputs=5;
net.numlayers=3;
net.biasconnect=[1; 0; 0];
net.inputconnect=[1 1 1 1 1 ;0 0 0 0 0; 0 0 0 0 0];
net.layerconnect=[0 0 0; 1 0 0; 0 1 0];
net.outputconnect=[0 0 1];
net.layers{1}.size=5;
net.layers{2}.size=25;
net.layers{1:2}.transferFcn = 'logsig';
net.layers{1:2}.initFcn = 'initnw';
net.layers{3}.transferFcn = 'purelin';
net.layers{3}.initFcn = 'initnw';
net.initFcn = 'initlay';
net.performFcn = 'mse';
net.trainFcn = 'trainlm';
net.divideFcn = '';
net.plotFcns = {'plotperform','plottrainstate','plotregression'};
net.trainParam.show=100;
net.trainParam.lr=0.01;
net.trainParam.epochs=1000;
net.trainParam.goal=1e-12;
view(net);

net=init(net);
net=train(net,P',R');
O=sim(net,V');
Res=O';
%Q=sim(net,P');
%Tr=Q';
%MAP=sim(net,M')
%LSM=MAP'
%W=getwb(net);







%Ys=min(O)+((sim1-0.1)*(max(O)-min(O)))/0.8;
%Yo=O';
%err1=Yo-Ys;
%mse1=mse(err1);
%rmse1=sqrt(mse1);
%x=sum((err1).^2);
%y=sum((Yo-mean(Yo)).^2);
%NSEtrain=1-(x/y);
%a=Yo-mean(Yo);
%b=Ys-mean(Ys);
%Rsqtrain=(sum(a.*b)/((sum(a.*a))*(sum(b.*b)))^0.5)^2;
%testing
%I1=xlsread('achenkovil.xlsx','testing input');
%O1=xlsread('achenkovil.xlsx','testing target');
%Pn1=0.1+((I1-min(min(I)))/(max(max(I))-min(min(I))))*0.8;
%P1=Pn1';
%Yo1=O1';
%sim2=sim(net,P1);
%Ys1=min(O)+((sim2-0.1)*(max(O)-min(O)))/0.8;
%err2=Yo1-Ys1;
%mse2=mse(err2);
%rmse2=sqrt(mse2);
%X=sum((err2).^2);
%Y=sum((Yo1-mean(Yo1)).^2);
%NSEtest=1-(X/Y);
%A=Yo1-mean(Yo1);
%B=Ys1-mean(Ys1);
%Rsqtest=(sum(A.*B)/((sum(A.*A))*(sum(B.*B)))^0.5)^2;
