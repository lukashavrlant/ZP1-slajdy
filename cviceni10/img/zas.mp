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

    vardef bunka(expr x, y, hodn) =
        defaultscale := 1;
        label.bot("hodnota:", (x+0.7u,y+2u));
        label.bot("predchozi:", (x+0.8u,y+1u));
        defaultscale := 2;
        label.bot(""&decimal hodn, (x+2.1u,y+1.8u));
        draw (x,y) -- (x+3u, y) -- (x+3u, y+2u) -- (x, y+2u) -- cycle;
        draw (x,y+u) -- (x+3u, y+u);
        defaultscale := 1;
    enddef;

    vardef dalsi(expr x, y) =
        arrow (x*u, y*u)--(x*u+1.9u, y*u);
    enddef;

    % prazdny
    label.bot("vrchol", (-2u, 1.3u));
    arrow (-1.2u, 1u) -- (-0.1u, 1u);
    label.bot("NULL", (0.7u, 1.25u));

    % pridame 5
    bunka(0,-2u,5);
    label.bot("vrchol", (-2u, -0.7u));    
    arrow (-1.2u, -0.9u) -- (-0.1u, -0.9u);
    label.bot("NULL", (2u, -1.3u));

    % pridame 7
    label.bot("vrchol", (-2u, -3.7u));
    bunka(0,-5u,7);
    arrow (-1.2u, -3.9u) -- (-0.1u, -3.9u);
    dalsi(2, -4.5);
    bunka(4u, -5.5u,5);
    label.bot("NULL", (6u, -4.8u));
    arrow (-1.2u, -4u){dir -75}..{dir 70}(3.85u, -4.6u);
    draw (-0.3u, -6.1u)--(0.3u,-5.3u);
    draw (-0.3u, -5.1u)--(0.3u,-6.3u);
endfig;


beginfig(2);
    pickup pencircle scaled 2pt;
    % pridame 7
    label.bot("vrchol", (-2u, -3.7u));
    bunka(0,-5u,7);
    arrow (-1.2u, -3.9u) -- (-0.1u, -3.9u);
    dalsi(2, -4.5);
    bunka(4u, -5.5u,5);
    label.bot("NULL", (6u, -4.8u));
    arrow (-1.4u, -4u){dir -75}..{dir 70}(3.85u, -4.6u);
    draw (-1u, -3.5u)--(-0.2u, -4.5u);
    draw (-1u, -4.5u)--(-0.2u, -3.5u);

    draw (-0.5u, -3u) -- (3.5u, -5u);
    draw (-0.5u, -5u) -- (3.5u, -3u);


    bunka(0,-9u,5);
    label.bot("vrchol", (-2u, -7.7u));    
    arrow (-1.2u, -7.9u) -- (-0.1u, -7.9u);
    label.bot("NULL", (2u, -8.3u));
endfig;
end;