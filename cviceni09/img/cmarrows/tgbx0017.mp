vardef setup_mapstoarrow (expr source_file, cmdname) =

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
    z9=.2[.5[z3,z4],z0];
  
    save pp; path pp;   pp = z4l{z9-z4}..z6r;
    save t; numeric t;  t = xpart(pp intersectiontimes ((0,y2l)--(w,y2l)));
    x2=xpart point t of pp;
  
    save texarrowhead;
    vardef texarrowhead(expr T) =
      pickup nullpen;
      filldraw (z0..{z4-z9}z4r--subpath(0,t) of pp
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
    save tt;  numeric tt;  tt  = arctime(arclength apth - (x0-x9)) of apth;
    save ttt; numeric ttt; ttt = arctime(arclength apth - (x0-x2)) of apth;

    if     arclength apth = 0:
      T:=identity shifted (point (length apth) of apth - z0);
    elseif arclength apth < x0-x3l:
      T:=identity rotatedaround(z0,angle (direction (length apth) of apth))
                  shifted (point (length apth) of apth -z0);
    else:
      T:=mapto(z0,
	       point (length apth) of apth,
               z2,
               point ttt of apth,
               z9+(0,3rule_thickness#),
               point tt of apth + 3rule_thickness#
                                   *(unitvector (direction tt of apth) 
                                   rotated 90));
    fi

    pickup pencircle scaled rule_thickness#;
    if arclength apth > x0-x2:
      draw subpath(0,ttt) of apth text_;
      draw point 0 of apth + (.24asc_height#+eps)*
                             (unitvector (direction 0 of apth) rotated 90)--
           point 0 of apth - (.24asc_height#+eps)*
                             (unitvector (direction 0 of apth) rotated 90)
           text_;
    fi	     
    texarrowhead(T);
  
    pickup prevpen;
  
  enddef;

enddef;




