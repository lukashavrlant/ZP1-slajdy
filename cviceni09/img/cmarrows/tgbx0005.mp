vardef setup_extensiblebrace (expr source_file, cmdname) =

  scantokens ("input tgbx0000");

  scantokens("input " & source_file);

  save apth;
  expandafter def scantokens cmdname expr p =
    path apth; apth:=p;
    scantokens (cmdname & "two")
  enddef;

  expandafter vardef scantokens (cmdname & "two " & "text text_ =" &
  
    "save u, designsize, curve, stem, rule_thickness, eps, fine;" &

    "u#              := " & decimal u# & ";" &
    "designsize      := " & decimal designsize & ";" &
    "curve#          := " & decimal curve# & ";" &
    "stem#           := " & decimal stem# & ";" &
    "rule_thickness# := " & decimal rule_thickness# & ";" &
    "eps             := " & decimal eps & ";" &
    "fine#           := " & decimal fine# & ";" &
  
    % Time for middle piece

    "save st; numeric st;" &
    "if unknown " & cmdname & "_middle_time:" &
    "  st := arctime (arclength apth)/2 of apth;" &
    "else: st:=" & cmdname & "_middle_time; fi")

    save prevpen;
    prevpen:=savepen;

    save w; numeric w;  w :=12u#;
    save h; numeric h;  h :=0;
    save dh; numeric dh; dh:=0.6designsize;
    save dw; numeric dw; dw:=curve#-stem#;
    save d; numeric d;  d :=1.5dh;
    save min_breadth; numeric min_breadth#; 
           min_breadth#:=rule_thickness#+0.6dw;
    save heavy_rule_thickness; numeric heavy_rule_thickness#; 
           heavy_rule_thickness#:=3rule_thickness#;

    save x,y;
    numeric x[],x[]',x[]l,x[]'l,x[]r,x[]'r,
            y[],y[]',y[]l,y[]'l,y[]r,y[]'r;

    pickup nullpen;
    penpos7(min_breadth#,0); penpos7'(min_breadth#,0);
    penpos6(heavy_rule_thickness#,0);
    rt x7r = rt x7'r = w-1.5u#+min_breadth#;
    lft x6l = .5w-.5heavy_rule_thickness#;
    bot y7 = -d; y6 = .5[h+eps,y7]; y7'-y7 = min_breadth#-fine#;

    penpos1(min_breadth#,0); penpos1'(min_breadth#,0);
    penpos2(heavy_rule_thickness#,0);
    rt x1r = rt x1'r = w-1.5u#+.5min_breadth#;
    lft x2 = .5w;
    top y1 = h; y2 = .5[y1,-d-eps]; y1-y1' = min_breadth#-fine#;

    penpos4'(min_breadth#,0); penpos4(min_breadth#,0);
    penpos5(heavy_rule_thickness#,0);
    penpos3(heavy_rule_thickness#,0);
    lft x4l=lft x4'l=1.5u#-.5min_breadth#;
    lft x5l=.5w-.5heavy_rule_thickness#;
    y4'-y5=(h+2d+2eps)/4;
    y4-y4'=min_breadth#-fine#; y4=0;
    lft x3l = .5w-.5heavy_rule_thickness#;
    y3-y4 = (h+2d+2eps)/4; 

    save mapto;
    vardef mapto(text t) =
      hide(numeric n; n:=0;
           numeric x,x_[],y,y_[];
           for z=t: z_[incr n]:=z; endfor;
           transform T;
           z_2 = z_1 transformed T;
           z_4 = z_3 transformed T;
           z_6 = z_5 transformed T;)
      T
    enddef;
  
    % The bottom part of the brace

    save bottom_part;
    vardef bottom_part(expr T) =
      filldraw (z6l{down}...{3(x7l-x6l),y7-y6}z7l
                --z7r--z7'r{3(x6r-x7r),y6-y7'}...{up}z6r--z6l & cycle)
               transformed T text_;
    enddef;

    save f;
    vardef f(expr s) =
      abs(point 0 of apth - (point s of apth + (.5w-1.5u#+.5min_breadth#)
                             *(unitvector (direction s of apth) rotated 90)))
      < ((d/2) ++ (.5w-1.5u#+.5min_breadth#))
    enddef;
  
    save tolerence; tolerence := epsilon;
    save s; numeric s; 

    save T; transform T; % transform for the bottom part 
    if arclength apth = 0:
      T:=identity shifted (point (length apth) of apth - z7r);
    elseif arclength apth < y1-y2+y3-y5+y6-y7:
      T:=mapto(z6l,
	       .25[point 0 of apth, point (length apth) of apth]+
	       +abs(x7r-x6l)*(unitvector (point (length apth) of apth -
		                          point 0 of apth) rotated 90),
               z6r,
	       .25[point 0 of apth, point (length apth) of apth]+
	       +abs(x7r-x6r)*(unitvector (point (length apth) of apth -
		                          point 0 of apth) rotated 90),
               z7r,
               point 0 of apth);		      
    else:
      s := solve f(0,length apth);
      T := mapto(z6l,
                 point s of apth 
                          +(.5w-1.5u#+.5min_breadth#+.5heavy_rule_thickness#)
                             *(unitvector (direction s of apth) rotated 90),
                 z6r,
                 point s of apth 
                          +(.5w-1.5u#+.5min_breadth#-.5heavy_rule_thickness#)
                             *(unitvector (direction s of apth) rotated 90),
                 z7r,
                 point 0 of apth);
    fi
    bottom_part(T);
  
    % The top part of the brace

    save top_part;  
    vardef top_part(expr T) =
      filldraw (z1l{3(x2l-x1l),y2-y1}...{down}z2l
                --z2r{up}...{3(x1r-x2r),y1'-y2}z1'r--z1r--cycle)
               transformed T text_;
    enddef;

    save g;
    vardef g(expr t) =
      abs(point (length apth) of apth 
                            - (point t of apth + (.5w-1.5u#+.5min_breadth#)
                             *(unitvector (direction t of apth) rotated 90)))
      < ((d/2) ++ (.5w-1.5u#+.5min_breadth#))
    enddef;
  
    save t; numeric t; 
  
    transform T; % transform the top part
    if arclength apth = 0:
      T:=identity shifted (point (length apth) of apth - z1r);
    elseif arclength apth < y1-y2+y3-y5+y6-y7:
      T := mapto(z2l,
                 .75[point 0 of apth, point (length apth) of apth] +
                 abs(x1r-x2l)*(unitvector (point (length apth) of apth -
		                           point 0 of apth) rotated 90),
                 z2r,
                 .75[point 0 of apth, point (length apth) of apth] +
                 abs(x1r-x2r)*(unitvector (point (length apth) of apth -
		                           point 0 of apth) rotated 90),
                 z1r,
                 point (length apth) of apth);
    else:    
      t := solve g(length apth,0);
      T := mapto(z2l,
                 point t of apth 
                      +(.5w-1.5u#+.5min_breadth#+.5heavy_rule_thickness#)
                             *(unitvector (direction t of apth) rotated 90),
                 z2r,
                 point t of apth 
                      +(.5w-1.5u#+.5min_breadth#-.5heavy_rule_thickness#)
                             *(unitvector (direction t of apth) rotated 90),
                 z1r,
                 point (length apth) of apth);
    fi
    top_part(T);

    % The lower part of the middle piece

    save middle_part_bottom;
    vardef middle_part_bottom(expr T) =
      (.5[z4r,z4'r]{3(x5r-x4r),y5-.5[y4,y4']}...{down}z5r
        --z5l{up}...{3(x4l-x5l),y4'-y5}z4'l) transformed T
    enddef;

    save ff;
    vardef ff(expr ss) =
      abs(point st of apth
           +(w-3u#)*(unitvector (direction st of apth) rotated 90)
           -(point ss of apth + (.5w-1.5u#+.5min_breadth#)
                             *(unitvector (direction ss of apth) rotated 90)))
      > ((h+2d+2eps)/4+(min_breadth#-fine#)/2) ++ (.5w-1.5u#-.5min_breadth#)
    enddef;
  
    save ss; numeric ss; 

    if arclength apth = 0:
      T:=identity shifted (point (length apth) of apth - z4'l);
    elseif arclength apth < y1-y2+y3-y5+y6-y7:
      T:=mapto(.5[z4r,z4'r],
	       .5[point 0 of apth, point (length apth) of apth]+
               abs(x1r-.5[x4r,x4'r])
	       *(unitvector (point (length apth) of apth -
		             point 0 of apth) rotated 90),
              z5l,
              .25[point 0 of apth, point (length apth) of apth]+
              abs(x1r-x5l)*(unitvector (point (length apth) of apth -
		                        point 0 of apth) rotated 90),
              z5r,          
              .25[point 0 of apth, point (length apth) of apth]+
              abs(x1r-x5r)*(unitvector (point (length apth) of apth -
		                        point 0 of apth) rotated 90));
    else:
      ss := solve ff(0,st);
      T:=mapto(.5[z4r,z4'r],
               point st of apth
               +(w-3u#)*(unitvector (direction st of apth) rotated 90),
               z5l,
               point ss of apth 
                      +(.5w-1.5u#+.5min_breadth#+.5heavy_rule_thickness#)
                            *(unitvector (direction ss of apth) rotated 90),
               z5r,          
               point ss of apth 
                      +(.5w-1.5u#+.5min_breadth#-.5heavy_rule_thickness#)
                            *(unitvector (direction ss of apth) rotated 90));
    fi
			  
    save pb; path pb;
    pb:=middle_part_bottom(T);
  
    % The upper part of the middle piece

    save middle_part_top;
    vardef middle_part_top(expr T) =
      (z4l{3(x3l-x4l),y3-y4}...{up}z3l--z3r{down}
       ...{3(x4r-x3r),.5[y4,y4']-y3}.5[z4r,z4'r]) transformed T
    enddef;

    save gg;
    vardef gg(expr tt) =
      abs(point st of apth
           +(w-3u#)*(unitvector (direction st of apth) rotated 90)
           -(point tt of apth + (.5w-1.5u#+.5min_breadth#)
                             *(unitvector (direction tt of apth) rotated 90)))
      > ((h+2d+2eps)/4+(min_breadth#-fine#)/2) ++ (.5w-1.5u#-.5min_breadth#)
    enddef;
  
    save tt; numeric tt; 
    
    if arclength apth = 0:
      T:=identity shifted (point (length apth) of apth - z4l);
    elseif arclength apth < y1-y2+y3-y5+y6-y7:
      T:=mapto(.5[z4r,z4'r],
	       .5[point 0 of apth, point (length apth) of apth]+
               abs(x1r-.5[x4r,x4'r])
	       *(unitvector (point (length apth) of apth -
		             point 0 of apth) rotated 90),
              z3l,
              .75[point 0 of apth, point (length apth) of apth]+
              abs(x1r-x3l)*(unitvector (point (length apth) of apth -
		                        point 0 of apth) rotated 90),
              z3r,          
              .75[point 0 of apth, point (length apth) of apth]+
              abs(x1r-x3r)*(unitvector (point (length apth) of apth -
		                        point 0 of apth) rotated 90));
    else:
      tt := solve gg(length apth, st);
      T := mapto(.5[z4r,z4'r],
                 point st of apth
                 +(w-3u#)*(unitvector (direction st of apth) rotated 90),
                 z3l,
                 point tt of apth 
                       +(.5w-1.5u#+.5min_breadth#+.5heavy_rule_thickness#)
                              *(unitvector (direction tt of apth) rotated 90),
                 z3r,
                 point tt of apth 
                       +(.5w-1.5u#+.5min_breadth#-.5heavy_rule_thickness#)
                              *(unitvector (direction tt of apth) rotated 90));
    fi
			    
    save ptt; path ptt;
    ptt:=middle_part_top(T);
  
    filldraw pb--ptt--cycle text_;
  
    % The extension parts

    save extension_part;  
    vardef extension_part(expr ss,tt) =
      numeric    stp; stp:=(ss-tt) div 5pt;
                      if stp=0: stp:=1; fi
                      stp:=(ss-tt)/stp;
  
      pickup pencircle scaled heavy_rule_thickness#;
  
      if stp>0:
      draw for uu=ss step stp until tt-stp:
        point uu of apth + (.5w-1.5u#+.5min_breadth#)
                             *(unitvector (direction uu of apth) rotated 90)
        {direction uu of apth} ..
      endfor
      {direction tt of apth}
      point tt of apth + (.5w-1.5u#+.5min_breadth#)
                         *(unitvector (direction tt of apth) rotated 90) text_;
      fi
    enddef;
  
    if arclength apth > y1-y2+y3-y4+y6-y7:
      extension_part(s,ss); extension_part(tt,t);
    fi
      
  enddef;
  
enddef;
