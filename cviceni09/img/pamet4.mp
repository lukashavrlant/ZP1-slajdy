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
        label.top(""&decimal (38+i), (i*u + 0.5u, u+basetable));
     endfor;

     label.bot("delka", (0*u + 0.5u, 0.5u));
     label.bot("vyska", (1*u + 0.5u, 0.5u));
     label.top("a", (5*u + 0.5u, 0u));
     label.top("b", (6*u + 0.5u, 0u));

     label.top("10", (0*u + 0.5u, basetable+0.25u));
     label.top("20", (1*u + 0.5u, basetable+0.25u));
     label.top("10", (5*u + 0.5u, basetable+0.25u));
     label.top("20", (6*u + 0.5u, basetable+0.25u));


    arrow (0*u + 0.5u, 0.5u)--(0*u + 0.5u, basetable - 0.1u);
    arrow (1*u + 0.5u, 0.5u)--(1*u + 0.5u, basetable - 0.1u);
    arrow (5*u + 0.5u, 0.5u)--(5*u + 0.5u, basetable - 0.1u);
    arrow (6*u + 0.5u, 0.5u)--(6*u + 0.5u, basetable - 0.1u);

    draw (3*u, basetable+1.5u) withcolor white;
endfig;




beginfig(2);
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
        label.top(""&decimal (38+i), (i*u + 0.5u, u+basetable));
     endfor;

     label.bot("delka", (0*u + 0.5u, 0.5u));
     label.bot("vyska", (1*u + 0.5u, 0.5u));
     label.top("a", (5*u + 0.5u, 0u));
     label.top("b", (6*u + 0.5u, 0u));

     label.top("10", (0*u + 0.5u, basetable+0.25u));
     label.top("20", (1*u + 0.5u, basetable+0.25u));
     label.top("38", (5*u + 0.5u, basetable+0.25u));
     label.top("39", (6*u + 0.5u, basetable+0.25u));


    arrow (0*u + 0.5u, 0.5u)--(0*u + 0.5u, basetable - 0.1u);
    arrow (1*u + 0.5u, 0.5u)--(1*u + 0.5u, basetable - 0.1u);
    arrow (5*u + 0.5u, 0.5u)--(5*u + 0.5u, basetable - 0.1u);
    arrow (6*u + 0.5u, 0.5u)--(6*u + 0.5u, basetable - 0.1u);

    draw (3*u, basetable+1.5u) withcolor white;
endfig;
end;