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
        draw (i*u, 0+basetable)--(i*u, u+basetable);
     endfor;

     % Horizontalni cary
     for i=0 upto 9:
      for j=0 upto 1:
        draw (i*u, j*u+basetable) -- (i*u+u, j*u+basetable);
      endfor;
     endfor;

     for i=0 upto 9:
        label.top(""&decimal (79+i), (i*u + 0.5u, u+basetable));
     endfor;

     label.bot("adresa", (0*u + 0.5u, 0.5u));
     label.bot("???", (3.5*u, -0.25u));
     label.bot("???", (3.5*u, 0.5u));
     %label.bot("ukvek", (1*u + 0.5u, 0.5u));
     %label.top("ukauto", (2*u + 0.5u, -0.3u));
     %label.top("b", (6*u + 0.5u, 0u));

     label.top("???", (0*u + 0.5u, basetable+0.25u));
     %label.top("668", (1*u + 0.5u, basetable+0.25u));
     %label.top("671", (2*u + 0.5u, basetable+0.25u));
     %label.top("20", (6*u + 0.5u, basetable+0.25u));


    arrow (0*u + 0.5u, 0.5u)--(0*u + 0.5u, basetable - 0.1u);
    %arrow (1*u + 0.5u, 0.5u)--(1*u + 0.5u, basetable - 0.1u);
    %arrow (2*u + 0.5u, 0u)--(2*u + 0.5u, basetable - 0.1u);
    %arrow (6*u + 0.5u, 0.5u)--(6*u + 0.5u, basetable - 0.1u);

    arrow (0*u + 0.5u, basetable+0.8u){dir 75}..{dir 170}(4.1u, -0.5u);
    
    draw (4*u, 0)--(4u, -u)--(3u, -u)--(3u,0)--cycle;
endfig;
end;