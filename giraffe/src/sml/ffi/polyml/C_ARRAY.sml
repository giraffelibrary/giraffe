(* Copyright (C) 2016-2017 Phil Clayton <phil.clayton@veonix.com>
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
        val cInPtr     : FFI.notnull FFI.in_p PolyMLFFI.conversion
        val cInOptPtr  : unit        FFI.in_p PolyMLFFI.conversion

        val cOutPtr    : FFI.notnull FFI.out_p PolyMLFFI.conversion
        val cOutOptPtr : unit        FFI.out_p PolyMLFFI.conversion

        val cOutRef      : (unit,        FFI.notnull) FFI.r PolyMLFFI.conversion
        val cOutOptRef   : (unit,        unit)        FFI.r PolyMLFFI.conversion
        val cInOutRef    : (FFI.notnull, FFI.notnull) FFI.r PolyMLFFI.conversion
        val cInOutOptRef : (unit,        unit)        FFI.r PolyMLFFI.conversion
      end
  end
