(* Copyright (C) 2012, 2016-2020 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

signature C_POINTER =
  sig
    include C_POINTER

    (**
     * The structure PolyML provides conversions for using optional pointers
     * in the low-level FFI.
     *)
    structure PolyML :
      sig
        val toSysWord : 'a p -> SysWord.word

        val cVal    : non_opt p PolyMLFFI.conversion
        val cOptVal : opt     p PolyMLFFI.conversion

        val cOptOutRef   : ('a,      opt) r PolyMLFFI.conversion
        val cInOptOutRef : (non_opt, opt) r PolyMLFFI.conversion
        val cRef         : ('a,      'b)  r PolyMLFFI.conversion
        val cInRef       : (non_opt, 'a)  r PolyMLFFI.conversion
      end
  end
