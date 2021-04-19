function plotmodel(filename)
% This functin reads in an swc file and plots the geometry
A = dlmread(filename, ' ', 0, 0);

% these are the coordinates
coord=A(:,3:5)*1e6;
id = A(:,1);
pid = A(:,7);
G= graph(id(2:end),pid(2:end));
%Amat= adjacency(G);

% these are the radii --> important
r=A(:,6);
markerSizes = 10.*r./max(r);
figure('NumberTitle', 'off', 'Name', 'Model View')
c1 = parula(length(r));
c2 = parula(length(r)-1);
plot(G,'XData',coord(:,1),'YData',coord(:,2),'ZData',coord(:,3),...
    'LineWidth',markerSizes(1:end-1),'EdgeAlpha',1,'EdgeColor',c2,'NodeColor',c1) 
view(2)
    xlabel(sprintf('{\\mu}m'))
    ylabel(sprintf('{\\mu}m'))
    set(gca,'Color', 'k')
    set(gca,'GridColor',[1 1 1])
    grid on
end

