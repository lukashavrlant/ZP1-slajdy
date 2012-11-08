vardef setup_paralleloppositerighthalfarrows (expr source_file, cmdname) =

  scantokens ("input tgbx0000");

  scantokens("input " & source_file);

  save apth;
  expandafter def scantokens cmdname expr p =
    path apth; apth:=p;
    scantokens (cmdname & "two")
  enddef;

  expandafter vardef scantokens (cmdname & "two " & "text text_ =" &

    "save math_spread, x_height, u, rule_thickness, bar, math_axis," &
    "     asc_height, eps, monospace;" &
    "boolean monospace;" &

    "math_spread     :=" & decimal math_spread & ";" &
    "x_height#       :=" & decimal x_height# & ";" &
    "u#              :=" & decimal u# & ";" &
    "rule_thickness# :=" & decimal rule_thickness# & ";" &
    "bar#            :=" & decimal bar# & ";" &
    "math_axis#      :=" & decimal math_axis# & ";" &
    "asc_height#     :=" & decimal asc_height# & ";" &
    "eps             :=" & decimal eps & ";" &
    "monospace       :=" & if monospace: "true" else: "false" fi & ";")
  
    save prevpen;
    prevpen:=savepen;
  
    save x,y;
    numeric x[], x[]', x[]l, x[]'l, x[]r, x[]'r,
            y[], y[]', y[]l, y[]'l, y[]r, y[]'r;
    save spread, w;
    numeric spread, w;
  
    spread = math_spread[.45x_height#, .55x_height#];
    w = 18u#;
    pickup nullpen;

    penpos1(rule_thickness#, 90); penpos2(rule_thickness#, 90);
    penpos3(rule_thickness#,  0); penpos4(rule_thickness#,  0);
    y0=y1=y2=math_axis#; x1-.5rule_thickness#=u#; rt x0=w-u#;
    y3-y0=y0-y4=.36asc_height#+eps;
    x3=x4=x0-4u#-eps;
    penpos5(rule_thickness#, angle(z4-z0)); z5l=z0;
    penpos6(rule_thickness#, angle(z3-z0)); z6l=z0;
    save t; numeric t; 
    save pq; path pq;    pq = z4l..{2(x0-x4),y0-y4}z6r;
    t=xpart(pq intersectiontimes ((0,y2l)--(w,y2l))); x2=xpart point t of pq;
    z9=.2[.5[z3,z4],z0];

    save halfarrowhead;
    vardef halfarrowhead(expr T) =
      pickup nullpen;
      filldraw (z0--(x0,y2l)--z2l--z2r
                ..subpath(t,0) of (z3l..{2(x0-x3),y0-y3}z5r)
                --z3r..{2(x0-x3),y0-y3}  cycle) transformed T text_;
    enddef;

    save parallellineright;
    vardef parallellineright expr pppp =
      save s, stp;
      numeric s, stp; stp:=(arclength pppp) div 5pt;
                      if stp=0: stp:=1; fi
                      stp:=(arclength pppp)/stp;
      pickup pencircle scaled rule_thickness#;
  
      if stp > 0:
      draw for s=0 step stp until arclength pppp - stp:
             point (arctime s of pppp) of pppp + 
             spread/2*(unitvector direction (arctime s of pppp) 
                                            of pppp rotated -90)
             {direction (arctime s of pppp) of pppp}..
           endfor
           {direction (length pppp) of pppp}
           point (length pppp) of pppp + 
           spread/2*(unitvector direction (length pppp) 
	     of pppp rotated -90) text_;
      fi
    enddef;
  
    save parallellineleft;
    vardef parallellineleft expr pppp =
      save s, stp;
      numeric s, stp; stp:=(arclength pppp) div 5pt;
                      if stp=0: stp:=1; fi
                      stp:=(arclength pppp)/stp;
      pickup pencircle scaled rule_thickness#;
  
      if stp>0:
      draw for s=0 step stp until arclength pppp - stp:
             point (arctime s of pppp) of pppp + 
             spread/2*(unitvector direction (arctime s of pppp) 
                                            of pppp rotated 90)
             {direction (arctime s of pppp) of pppp}..
           endfor
           {direction (length pppp) of pppp}
           point (length pppp) of pppp +
           spread/2*(unitvector direction (length pppp) 
	     of pppp rotated 90) text_;
      fi
    enddef;

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
  
    save T;   transform T;
    save tt;  numeric tt;  tt  = arctime(arclength apth - (x0-x9)) of apth;
    save ttt; numeric ttt; ttt = arctime(arclength apth - (x0-x2)) of apth;

    if arclength apth = 0:
      T:=identity reflectedabout(z0+(-1pt,0),z0)
                  shifted (point (length apth) of apth - z0)
                  shifted (0,-spread/2);
    elseif arclength apth < x0-x3l:
      T:=identity reflectedabout(z0+(-1pt,0),z0)
                  rotatedaround(z0,angle (direction (length apth) of apth))
                  shifted (point (length apth) of apth - z0)
                  shifted (spread/2*
		    (unitvector (direction (length apth) of apth) rotated-90));
    else:
      T:=mapto(z0,
               point (length apth) of apth + 
                 spread/2*(unitvector (direction (length apth) of apth)
                                    rotated -90),
               z2,
               point ttt of apth +
                 spread/2*(unitvector (direction ttt of apth)
                                    rotated -90),
               z9+(0,3rule_thickness#),
               point tt of apth +
                 (spread/2+3rule_thickness#)*
                    (unitvector (direction tt of apth) rotated -90));
    fi
		  
    pickup pencircle scaled rule_thickness#;
    if arclength apth > x0-x2:
      parallellineright subpath(0,ttt) of apth;
    fi
    halfarrowhead(T);

    tt  := arctime(x0-x9) of apth;
    ttt := arctime(x0-x2) of apth;

    if arclength apth = 0:
      T:=identity reflectedabout(z0+(0,1pt),z0+(0,-1pt))
                  shifted (point 0 of apth - z0)
                  shifted (0,spread/2);
    elseif arclength apth < x0-x3l:
      T:=identity reflectedabout(z0+(0,1pt),z0+(0,-1pt))
                  rotatedaround(z0,angle (direction 0 of apth))
                  shifted (point 0 of apth - z0)
                  shifted (spread/2*
                    (unitvector (direction (length apth) of apth) rotated 90));
    else:
      T:=mapto(z0,
               point 0 of apth +
                 spread/2*(unitvector (direction 0 of apth)
                                    rotated 90),
               z2,
               point ttt of apth +
                 spread/2*(unitvector (direction ttt of apth)
                                    rotated 90),
               z9+(0,3rule_thickness#),
               point tt of apth + 
                 (spread/2+3rule_thickness#)*
                    (unitvector (direction tt of apth) rotated 90));
    fi
		  
    if arclength apth > x0-x2:
      parallellineleft subpath(ttt,length apth) of apth;
    fi
    halfarrowhead(T);

    pickup prevpen;
  
  enddef;

enddef;
