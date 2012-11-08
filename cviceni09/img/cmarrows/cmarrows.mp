vardef setup_cmarrows(text argument_list) =

  save sfile;
  string sfile;

  save arrow_name, brace_name, parameter_file, macro_name;
  string arrow_name, brace_name, parameter_file, macro_name;
  
  argument_list;
  
  if not known arrow_name:
    arrow_name := brace_name;
  fi  
  
  if     arrow_name="Bigbrace"           : sfile = "tgbx0001.mp";
  elseif arrow_name="Biggbrace"          : sfile = "tgbx0002.mp";
  elseif arrow_name="bigbrace"           : sfile = "tgbx0003.mp";
  elseif arrow_name="biggbrace"          : sfile = "tgbx0004.mp";
  elseif arrow_name="extensiblebrace"    : sfile = "tgbx0005.mp";
  elseif arrow_name="parallelarrows"     : sfile = "tgbx0006.mp";
  elseif arrow_name="twoheadarrow"       : sfile = "tgbx0007.mp";
  elseif arrow_name="twowayoldarrow"     : sfile = "tgbx0008.mp";
  elseif arrow_name="paralleloppositearrows": sfile = "tgbx0009.mp";
  elseif arrow_name="twowayarrow"        : sfile = "tgbx0010.mp";
  elseif arrow_name="twowaydoublearrow"  : sfile = "tgbx0011.mp";
  elseif arrow_name="hookleftarrow"      : sfile = "tgbx0012.mp";
  elseif arrow_name="hookrightarrow"     : sfile = "tgbx0013.mp";
  elseif arrow_name="doublearrow"        : sfile = "tgbx0014.mp";
  elseif arrow_name="lefthalfarrow"      : sfile = "tgbx0015.mp";
  elseif arrow_name="paralleloppositerighthalfarrows": sfile = "tgbx0016.mp";
  elseif arrow_name="mapstoarrow"        : sfile = "tgbx0017.mp";
  elseif arrow_name="oldtexarrow"        : sfile = "tgbx0018.mp";
  elseif arrow_name="righthalfarrow"     : sfile = "tgbx0019.mp";
  elseif arrow_name="paralleloppositelefthalfarrows" : sfile = "tgbx0020.mp";
  elseif arrow_name="shortaxisarrow"     : sfile = "tgbx0021.mp";
  elseif arrow_name="texarrow"           : sfile = "tgbx0022.mp";
  elseif arrow_name="tailarrow"       : sfile = "tgbx0023.mp";
  elseif arrow_name="tripplearrow"       : sfile = "tgbx0024.mp";
  else                              : errmessage "unknown options";
  fi

  expandafter save scantokens ("setup_" & arrow_name);

  scantokens ("input " & sfile);

  scantokens ("setup_" & arrow_name & "(" & 
      ditto & parameter_file & ditto & "," &
      ditto & macro_name & ditto & ");" );

enddef;
