input cmarrows.mp

setup_cmarrows(
  arrow_name     = "texarrow";
  parameter_file = "cmr10.mf";
  macro_name     = "arrow"
);



beginfig(2);
     u=1cm;
     basetable = 1u;
     pickup pencircle scaled 2pt;

     % Vertikalni vary
     for i=0 upto 10:
        if i < 5:
            draw (i*u, 0+basetable)--(i*u, u+basetable);
        fi;

        if i > 8:
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
     	  label.top(""&decimal (38+i), (i*u + 0.5u, u+basetable));
     endfor;

     draw (3*u, u + basetable) -- (4*u, u + basetable) withcolor blue;
     draw (3*u, 0 + basetable) -- (4*u, 0 + basetable) withcolor blue;
     draw (3*u, 0 + basetable) -- (3*u, u + basetable) withcolor blue;
     draw (4*u, 0 + basetable) -- (4*u, u + basetable) withcolor blue;

     label.top("znak", (3*u + 0.5u, 0.1u)) withcolor blue;
     label.top("!", (3*u + 0.5u, basetable+0.25u)) withcolor blue;

    for i=5 upto 8:
        for j=0 upto 1:
            draw (i*u, j*u+basetable) -- (i*u+u, j*u+basetable) withcolor blue;
        endfor;
    endfor;

    draw (5*u, 0+basetable)--(5*u, u+basetable) withcolor blue;
    draw (9*u, 0+basetable)--(9*u, u+basetable) withcolor blue;

    label.top("1073741824", (7*u, basetable+0.25u)) withcolor blue;

    label.top("cislo", (5*u + 0.5u, 0.1u)) withcolor blue;

    arrow (3*u + 0.5u, 0.4u)--(3*u + 0.5u, basetable - 0.1u) withcolor blue;
    arrow (5*u + 0.5u, 0.4u)--(5*u + 0.5u, basetable - 0.1u) withcolor blue;

    draw (3*u, 0) withcolor white;
endfig;
end;