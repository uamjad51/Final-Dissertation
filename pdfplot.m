function pdfplot(title)
%stuff below gets the pdf version to fill a landscape page
set(gcf,'Units','Inches');pos = get(gcf,'Position');
set(gcf,'PaperPositionMode','Auto','PaperUnits','Inches',...
'PaperSize',[pos(3), pos(4)])
saveas(gcf,title)
end
