(* Copyright (C) 2018-2020 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

signature CALLBACK =
  sig
    include CALLBACK

    structure PolyML :
      sig
        val cClosure : FFI.non_opt FFI.closure PolyMLFFI.conversion
        val cOptClosure : FFI.opt FFI.closure PolyMLFFI.conversion
        val cDispatch : FFI.non_opt FFI.dispatch PolyMLFFI.conversion
        val cOptDispatch : FFI.opt FFI.dispatch PolyMLFFI.conversion
        val cDestroyNotify : FFI.destroy_notify PolyMLFFI.conversion
      end
  end
