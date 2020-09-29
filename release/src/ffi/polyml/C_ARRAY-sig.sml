(* Copyright (C) 2016-2020 Phil Clayton <phil.clayton@veonix.com>
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
        val cInPtr     : FFI.non_opt FFI.in_p PolyMLFFI.conversion
        val cInOptPtr  : FFI.opt     FFI.in_p PolyMLFFI.conversion

        val cOutPtr    : FFI.non_opt FFI.out_p PolyMLFFI.conversion
        val cOutOptPtr : FFI.opt     FFI.out_p PolyMLFFI.conversion

        val cOutRef      : ('a,          FFI.non_opt) FFI.r PolyMLFFI.conversion
        val cOutOptRef   : ('a,          FFI.opt)     FFI.r PolyMLFFI.conversion
        val cInOutRef    : (FFI.non_opt, FFI.non_opt) FFI.r PolyMLFFI.conversion
        val cInOutOptRef : (FFI.opt,     FFI.opt)     FFI.r PolyMLFFI.conversion
      end
  end
