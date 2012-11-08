input cmarrows.mp

setup_cmarrows(
  brace_name     = "extensiblebrace";
  parameter_file = "cmr10.mf";
  macro_name     = "brace"
);

beginfig(2);
     u=1cm;
     pickup pencircle scaled 2pt;
     for i=0 upto 10:
       	draw (i*u, 0)--(i*u, u);
     endfor

     for i=0 upto 9:
     	for j=0 upto 1:
     		draw (i*u, j*u) -- (i*u+u, j*u);
     	endfor;
      brace (i*u+u, 0)--(i*u, 0);
      label.top("1B", (i*u + 0.5u, -0.7u));
     endfor;

     for i=0 upto 9:
     	label.top(""&decimal (38+i), (i*u + 0.5u, u));
     endfor;

     draw (3*u, 1.5u) withcolor white;
     draw (3*u, -0.7u) withcolor white;
endfig;
end;