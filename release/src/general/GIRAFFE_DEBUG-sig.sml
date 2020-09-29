(* Copyright (C) 2012 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

signature GIRAFFE_DEBUG =
  sig
    (* `isEnabled` is fixed at compile-time. *)
    val isEnabled : bool

    val getRefCount : unit -> bool
    val getClosure : unit -> bool
  end
