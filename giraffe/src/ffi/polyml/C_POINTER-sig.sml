(* Copyright (C) 2012, 2016 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

signature C_POINTER =
  sig
    include C_POINTER

    (**
     * The structure PolyML provides conversions for using null-type-safe
     * pointers in the low-level FFI.
     *)
    structure PolyML :
      sig
        val toSysWord : 'a p -> SysWord.word

        val cVal    : notnull p PolyMLFFI.conversion
        val cOptVal : unit    p PolyMLFFI.conversion

        val cOptOutRef   : ('a,      unit) r PolyMLFFI.conversion
        val cInOptOutRef : (notnull, unit) r PolyMLFFI.conversion
        val cRef         : ('a,      'b)   r PolyMLFFI.conversion
        val cInRef       : (notnull, 'a)   r PolyMLFFI.conversion
      end
  end
