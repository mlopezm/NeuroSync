function plot_signal_VV(VV,n) 

     plot(VV(n,:));
 %   plot(handles.axes1,tau*firings(:,1),firings(:,2).*ismember(firings(:,2),loc_exc),'r.',tau*firings(:,1),firings(:,2).*ismember(firings(:,2),loc_inhib),'g.');
     set(gca,'XLim',[0 size(VV,2)]);

%     plot(handles.axes3,tau*(1:t),VV(n_neuron1,1:t));
% %     plot(handles.axes3,(1:T),VV(n_neuron1,:));
%     set(handles.axes3,'XLim',[0 T]);
%     set(handles.text14,'String',num2str(VV(n_neuron1,t)));
% 
%     plot(handles.axes4,tau*(1:t),VV(n_neuron2,1:t));
% %     plot(handles.axes4,(1:T),VV(n_neuron2,:));
%     set(handles.axes4,'XLim',[0 T]);
%     set(handles.text15,'String',num2str(VV(n_neuron2,t)));





