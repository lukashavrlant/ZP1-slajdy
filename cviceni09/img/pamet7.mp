input cmarrows.mp

setup_cmarrows(
  arrow_name     = "texarrow";
  parameter_file = "cmr10.mf";
  macro_name     = "arrow"
);


beginfig(1);
     u=1cm;
     basetable = 1u;
     pickup pencircle scaled 2pt;

     % Vertikalni cary
     for i=0 upto 10:
        if (i <> 4) and (i <> 6):
            draw (i*u, 0+basetable)--(i*u, u+basetable);
        fi;
     endfor;

     % Horizontalni cary
     for i=0 upto 9:
      for j=0 upto 1:
        draw (i*u, j*u+basetable) -- (i*u+u, j*u+basetable);
      endfor;
     endfor;

     for i=0 upto 9:
        label.top(""&decimal (72+i), (i*u + 0.5u, u+basetable));
     endfor;

     label.bot("p[0]", (0*u + 0.5u, 0.5u));
     label.bot("p[1]", (1*u + 0.5u, 0.5u));
     label.bot("p[2]", (2*u + 0.5u, 0.5u));
     label.bot("c[0]", (3*u + 0.5u, 0.5u));
     label.bot("c[1]", (5*u + 0.5u, 0.5u));
     label.bot("ukp", (8*u + 0.5u, 0.5u));
     label.bot("ukc", (9*u + 0.5u, 0.5u));

     label.top("2", (0*u + 0.5u, basetable+0.25u));
     label.top("4", (1*u + 0.5u, basetable+0.25u));
     label.top("8", (2*u + 0.5u, basetable+0.25u));
     label.top("500", (3.5*u + 0.5u, basetable+0.25u));
     label.top("600", (5.5*u + 0.5u, basetable+0.25u));
     label.top("72", (8*u + 0.5u, basetable+0.25u));
     label.top("75", (9*u + 0.5u, basetable+0.25u));


    arrow (0*u + 0.5u, 0.5u)--(0*u + 0.5u, basetable - 0.1u);
    arrow (1*u + 0.5u, 0.5u)--(1*u + 0.5u, basetable - 0.1u);
    arrow (2*u + 0.5u, 0.5u)--(2*u + 0.5u, basetable - 0.1u);
    arrow (3*u + 0.5u, 0.5u)--(3*u + 0.5u, basetable - 0.1u);
    arrow (3*u + 0.5u, 0.5u)--(3*u + 0.5u, basetable - 0.1u);
    arrow (5*u + 0.5u, 0.5u)--(5*u + 0.5u, basetable - 0.1u);
    arrow (8*u + 0.5u, 0.5u)--(8*u + 0.5u, basetable - 0.1u);
    arrow (9*u + 0.5u, 0.5u)--(9*u + 0.5u, basetable - 0.1u);

    draw (3u, 2.5u) withcolor white;
    
endfig;
end;