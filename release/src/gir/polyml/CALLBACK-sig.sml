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
        val cPtr : FFI.non_opt FFI.p PolyMLFFI.conversion
        val cOptPtr : FFI.opt FFI.p PolyMLFFI.conversion
        val cDispatchPtr : FFI.non_opt FFI.dispatch_p PolyMLFFI.conversion
        val cOptDispatchPtr : FFI.opt FFI.dispatch_p PolyMLFFI.conversion
        val cDestroyNotifyPtr : FFI.destroy_notify_p PolyMLFFI.conversion
      end
  end
