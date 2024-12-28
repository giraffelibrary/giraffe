(* Copyright (C) 2024 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

signature GIRAFFE_GC =
  sig
    (**
     * `full ()` performs full garbage collection.  The function is
     * synchronous, returning only after garbage collection has completed.
     *)
    val full : unit -> unit
  end
