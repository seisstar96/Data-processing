clc;clear;close all
%%%%%%% Organize catalog format
n1='newcatalog.txt';
fid1 = fopen(n1,'w');
mag_cata=load('oldcatalog.txt');
mag=mag_cata(:,10);
for i=1:1:length(mag)
    mon=num2str(mag_cata(i,2),'%02d');   
   fprintf(fid1,'%d %02d %02d %02d %02d %05.2f %f %f %04.2f %04.2f\n',...
   round(mag_cata(i,1)),round(mag_cata(i,2)),round(mag_cata(i,3)),round(mag_cata(i,4)),round(mag_cata(i,5)),mag_cata(i,6),mag_cata(i,7),mag_cata(i,8),mag_cata(i,9)+2,mag_cata(i,10));
end
fclose(fid1);
