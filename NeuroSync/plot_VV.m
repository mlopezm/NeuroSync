function plot_VV(VV) 
v=zeros(size(VV,1)); % Initial values of v
firings=[]; % spike timings
for t=1:size(VV,2) % simulation of T ms
    fired=find(VV(:,t)>=30); % indices of spikes
    firings=[firings; t+0*fired,fired];


     plot(firings(:,1),firings(:,2),'.');
 %   plot(handles.axes1,tau*firings(:,1),firings(:,2).*ismember(firings(:,2),loc_exc),'r.',tau*firings(:,1),firings(:,2).*ismember(firings(:,2),loc_inhib),'g.');
     set(gca,'XLim',[0 size(VV,2)],'YLim',[0 size(VV,1)]);

%     plot(handles.axes3,tau*(1:t),VV(n_neuron1,1:t));
% %     plot(handles.axes3,(1:T),VV(n_neuron1,:));
%     set(handles.axes3,'XLim',[0 T]);
%     set(handles.text14,'String',num2str(VV(n_neuron1,t)));
% 
%     plot(handles.axes4,tau*(1:t),VV(n_neuron2,1:t));
% %     plot(handles.axes4,(1:T),VV(n_neuron2,:));
%     set(handles.axes4,'XLim',[0 T]);
%     set(handles.text15,'String',num2str(VV(n_neuron2,t)));

end



