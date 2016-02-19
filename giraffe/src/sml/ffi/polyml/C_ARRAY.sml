(* Copyright (C) 2016 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

signature C_ARRAY =
  sig
    include C_ARRAY

    structure PolyML :
      sig
        val cOutPtr    : C.notnull C.out_p PolyMLFFI.conversion
        val cOptOutPtr : unit      C.out_p PolyMLFFI.conversion

        val cInPtr     : C.notnull C.in_p PolyMLFFI.conversion
        val cOptInPtr  : unit      C.in_p PolyMLFFI.conversion

        val cOptOutRef   : ('a,        unit) C.r PolyMLFFI.conversion
        val cInOptOutRef : (C.notnull, unit) C.r PolyMLFFI.conversion
        val cRef         : ('a,        'b)   C.r PolyMLFFI.conversion
        val cInRef       : (C.notnull, 'a)   C.r PolyMLFFI.conversion
      end
  end
