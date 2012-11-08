vardef setup_shortaxisarrow(expr source_file, cmdname) =

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
    w = 9u#;
    pickup pencircle scaled rule_thickness#;

    penpos1(.25rule_thickness#, 90); penpos2(.25rule_thickness#, 90);
    penpos3(bar#, 0);                penpos4(bar#, 0);
    y0=y1=y2=math_axis#;
    x1=1.5u#-eps;
    rt x0=w-x1;
    y3-y0=y0-y4=.24asc_height#+eps; x3=x4=x0-3u#-eps;
    penpos5(bar#, angle(z4-z0)); z5l=z0; penpos6(bar#, angle(z3-z0)); z6l=z0;
    z9=.381966[.5[z3,z4],z0];
    numeric t; path pq; pq=z4l{z9-z4}..z6r;
    t=xpart(pq intersectiontimes ((0,y2l)--(w,y2l))); x2=xpart point t of pq;
   
    save texarrowhead;
    vardef texarrowhead(expr T) =
      pickup pencircle scaled rule_thickness#;
      filldraw (z0..{z4-z9}z4r--subpath(0,t) of (z4l{z9-z4}..z6r)
               --z2l--z2r--subpath(t,0) of (z3l{z9-z3}..z5r)
               --z3r{z9-z3}..z0 & cycle) transformed T text_;
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
    save tt;  numeric tt;  tt  = arctime(arclength apth - (x5l-x2)) of apth;
    save ttt; numeric ttt; ttt = arctime(arclength apth - (x5l-x3)) of apth;

    if   arclength apth = 0:
      T:=identity shifted (point (length apth) of apth - z0);
    elseif arclength apth < x0-x3l:
      T:=identity rotatedaround(z0,angle (direction (length apth) of apth))
                  shifted (point (length apth) of apth - z0);
    else:
      T:=mapto(z0,
               point (length apth) of apth,
               z2,
               point tt of apth,
               (x3,y9)+(0,3rule_thickness#),
               point ttt of apth + 
                     3rule_thickness#*(unitvector (direction tt of apth)
                                                  rotated 90));
    fi
					      
    pickup pencircle scaled 1.25rule_thickness#;
    if arclength apth > x0-x2:
      draw subpath(0,tt) of apth text_;
    fi
    pickup pencircle scaled rule_thickness#;
    texarrowhead(T);
  
    pickup prevpen;
  
  enddef;

enddef;