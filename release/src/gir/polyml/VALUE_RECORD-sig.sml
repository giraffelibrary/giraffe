(* Copyright (C) 2017-2020 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

signature VALUE_RECORD =
  sig
    include VALUE_RECORD

    structure PolyML :
      sig
        val cPtr : FFI.non_opt FFI.p PolyMLFFI.conversion
        val cOptPtr : FFI.opt FFI.p PolyMLFFI.conversion
        val cOutRef : ('a, FFI.non_opt) FFI.r PolyMLFFI.conversion
        val cOutOptRef : ('a, FFI.opt) FFI.r PolyMLFFI.conversion
        val cInOutRef : (FFI.non_opt, FFI.non_opt) FFI.r PolyMLFFI.conversion
        val cInOutOptRef : (FFI.opt, FFI.opt) FFI.r PolyMLFFI.conversion
      end
  end
