(* Copyright (C) 2013 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

signature POLY_M_L_F_F_I =
  sig
    type 'a conversion = 'a CInterface.Conversion

    type ('a, 'b) func
    val &&> : 'a conversion * ('b, 'c) func -> (('a, 'b) pair, 'c) func
    val --> : 'a conversion * 'b conversion -> ('a, 'b) func

    type dylib = CInterface.dylib
    type sym = CInterface.sym
    val load_sym : dylib -> string -> sym
    val load_lib : string -> dylib

    val call : sym -> ('a, 'b) func -> 'a -> 'b
  end
