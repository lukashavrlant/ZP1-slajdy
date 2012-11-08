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



    draw (1*u, u + basetable) -- (2*u, u + basetable) withcolor blue;
    draw (1*u, 0 + basetable) -- (2*u, 0 + basetable) withcolor blue;
    draw (1*u, 0 + basetable) -- (1*u, u + basetable) withcolor blue;
    draw (2*u, 0 + basetable) -- (2*u, u + basetable) withcolor blue;
    label.top("adresa", (1*u + 0.5u, 0.1u)) withcolor blue;
    label.top("43", (1*u + 0.5u, basetable+0.25u)) withcolor blue;

    arrow (3*u + 0.5u, 0.4u)--(3*u + 0.5u, basetable - 0.1u) withcolor blue;
    arrow (5*u + 0.5u, 0.4u)--(5*u + 0.5u, basetable - 0.1u) withcolor blue;
    arrow (1*u + 0.5u, 0.4u)--(1*u + 0.5u, basetable - 0.1u) withcolor blue;

    arrow (1*u + 0.5u, basetable+0.6u){dir 60}..{dir -60}(5.5*u, basetable+0.5u) withcolor blue;

    draw (3*u, 0) withcolor white;
    draw (3*u, u+basetable+1.3u) withcolor white;
endfig;

beginfig(2);
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



    draw (1*u, u + basetable) -- (2*u, u + basetable) withcolor blue;
    draw (1*u, 0 + basetable) -- (2*u, 0 + basetable) withcolor blue;
    draw (1*u, 0 + basetable) -- (1*u, u + basetable) withcolor blue;
    draw (2*u, 0 + basetable) -- (2*u, u + basetable) withcolor blue;
    label.top("adresa", (1*u + 0.5u, 0.1u)) withcolor blue;
    label.top("41", (1*u + 0.5u, basetable+0.25u)) withcolor blue;

    arrow (3*u + 0.5u, 0.4u)--(3*u + 0.5u, basetable - 0.1u) withcolor blue;
    arrow (5*u + 0.5u, 0.4u)--(5*u + 0.5u, basetable - 0.1u) withcolor blue;
    arrow (1*u + 0.5u, 0.4u)--(1*u + 0.5u, basetable - 0.1u) withcolor blue;

    arrow (1*u + 0.5u, basetable+0.8u){dir 60}..{dir -60}(3.5*u, basetable+0.8u) withcolor blue;

    draw (3*u, 0) withcolor white;
    draw (3*u, u+basetable+1.3u) withcolor white;
endfig;


beginfig(3);
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



    draw (1*u, u + basetable) -- (2*u, u + basetable) withcolor blue;
    draw (1*u, 0 + basetable) -- (2*u, 0 + basetable) withcolor blue;
    draw (1*u, 0 + basetable) -- (1*u, u + basetable) withcolor blue;
    draw (2*u, 0 + basetable) -- (2*u, u + basetable) withcolor blue;
    draw (0*u, u + basetable) -- (1*u, u + basetable) withcolor blue;
    draw (0*u, 0 + basetable) -- (1*u, 0 + basetable) withcolor blue;
    draw (0*u, 0 + basetable) -- (0*u, u + basetable) withcolor blue;
    draw (1*u, 0 + basetable) -- (1*u, u + basetable) withcolor blue;

    label.top("adresaz", (1*u + 0.5u, 0.1u)) withcolor blue;
    label.top("adresac", (0*u + 0.5u, -0.2u)) withcolor blue;
    label.top("41", (1*u + 0.5u, basetable+0.25u)) withcolor blue;
    label.top("43", (0*u + 0.5u, basetable+0.25u)) withcolor blue;

    arrow (3*u + 0.5u, 0.4u)--(3*u + 0.5u, basetable - 0.1u) withcolor blue;
    arrow (5*u + 0.5u, 0.4u)--(5*u + 0.5u, basetable - 0.1u) withcolor blue;
    arrow (1*u + 0.5u, 0.4u)--(1*u + 0.5u, basetable - 0.1u) withcolor blue;
    arrow (0*u + 0.5u, 0u)--(0*u + 0.5u, basetable - 0.1u) withcolor blue;

    arrow (1*u + 0.5u, basetable+0.8u){dir 60}..{dir -60}(3.5*u, basetable+0.8u) withcolor blue;
    arrow (0*u + 0.5u, basetable+0.8u){dir 60}..{dir -60}(5.5*u, basetable+0.8u) withcolor blue;

    draw (3*u, -0.3u) withcolor white;
endfig;






beginfig(4);
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
     label.top("?", (3*u + 0.5u, basetable+0.25u)) withcolor blue;

    for i=5 upto 8:
        for j=0 upto 1:
            draw (i*u, j*u+basetable) -- (i*u+u, j*u+basetable) withcolor blue;
        endfor;
    endfor;

    draw (5*u, 0+basetable)--(5*u, u+basetable) withcolor blue;
    draw (9*u, 0+basetable)--(9*u, u+basetable) withcolor blue;

    label.top("666", (7*u, basetable+0.25u)) withcolor blue;
    label.top("cislo", (5*u + 0.5u, 0.1u)) withcolor blue;



    draw (1*u, u + basetable) -- (2*u, u + basetable) withcolor blue;
    draw (1*u, 0 + basetable) -- (2*u, 0 + basetable) withcolor blue;
    draw (1*u, 0 + basetable) -- (1*u, u + basetable) withcolor blue;
    draw (2*u, 0 + basetable) -- (2*u, u + basetable) withcolor blue;
    draw (0*u, u + basetable) -- (1*u, u + basetable) withcolor blue;
    draw (0*u, 0 + basetable) -- (1*u, 0 + basetable) withcolor blue;
    draw (0*u, 0 + basetable) -- (0*u, u + basetable) withcolor blue;
    draw (1*u, 0 + basetable) -- (1*u, u + basetable) withcolor blue;

    label.top("adresaz", (1*u + 0.5u, 0.1u)) withcolor blue;
    label.top("adresac", (0*u + 0.5u, -0.2u)) withcolor blue;
    label.top("41", (1*u + 0.5u, basetable+0.25u)) withcolor blue;
    label.top("43", (0*u + 0.5u, basetable+0.25u)) withcolor blue;

    arrow (3*u + 0.5u, 0.4u)--(3*u + 0.5u, basetable - 0.1u) withcolor blue;
    arrow (5*u + 0.5u, 0.4u)--(5*u + 0.5u, basetable - 0.1u) withcolor blue;
    arrow (1*u + 0.5u, 0.4u)--(1*u + 0.5u, basetable - 0.1u) withcolor blue;
    arrow (0*u + 0.5u, 0u)--(0*u + 0.5u, basetable - 0.1u) withcolor blue;

    arrow (1*u + 0.5u, basetable+0.8u){dir 60}..{dir -60}(3.5*u, basetable+0.8u) withcolor blue;
    arrow (0*u + 0.5u, basetable+0.8u){dir 60}..{dir -60}(5.5*u, basetable+0.8u) withcolor blue;

    draw (3*u, -0.3u) withcolor white;
endfig;
end;