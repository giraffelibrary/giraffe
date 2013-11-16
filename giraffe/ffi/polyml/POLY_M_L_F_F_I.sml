signature POLY_M_L_F_F_I =
  sig
    type 'a conv = 'a CInterface.Conversion

    type ('a, 'b) func
    val &&> : 'a conv * ('b, 'c) func -> (('a, 'b) pair, 'c) func
    val --> : 'a conv * 'b conv -> ('a, 'b) func

    type dylib = CInterface.dylib
    type sym = CInterface.sym
    val load_sym : dylib -> string -> sym

    val call : sym -> ('a, 'b) func -> 'a -> 'b
  end
