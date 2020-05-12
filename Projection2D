function  [xp,zp,pointr,pointl]= projection2D(x1,y1,strike,xd,yd,zd)
%%%%%%%%%%%% Earthquake projection on the survey line
%%% ----- 2020.05.12 

%%% x1,y1 utm point
%%% xd,yd,zd earthquake(x,y,z)
%%% strike  strikeangle

% xp: project -> x
% zp: project -> z
% pointr -> Line start point
% pointl -> Line end point

          if strike > 90
             b=24/111;
             y2=y1-b*tan((strike-90)*pi/180);
          else
             b=7.5/111;
             y2=y1+b*tan((90-strike)*pi/180);
          end
          x2=x1+b;
          k1=(y2-y1)/(x2-x1);
          b1=y1-k1*x1;          %%% line1
          
          k2=-1/k1;
          b2=yd-k2*xd;          %%% line 2
          

          x3=-(b1-b2)/(k1-k2);             
          y3=-(-b2*k1+b1*k2)/(k1-k2);
          
          distance=sqrt((x3-x1)^2+(y3-y1)^2)*111;
          
          distance2=sqrt((x3-xd)^2+(y3-yd)^2)*111;
          if distance2 > 3.5
             distance=1001;
          else
             distance=distance;
          end  
          
          if x3 < x1
              distance=-distance;
          else
              distance=distance;
          end
          xp=distance;
          zp=zd;
         
          
          xt2=b*cos((90-strike)*pi/180);
          yt2=b*sin((90-strike)*pi/180);
          x02=x1+xt2;
          y02=y1+yt2;
          x020=x1-xt2;
          y020=y1-yt2;
          pointr=[x02,y02];
          pointl=[x020,y020];
end
