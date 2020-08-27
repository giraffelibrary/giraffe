(* Copyright (C) 2018-2020 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

signature CLOSURE =
  sig
    type t

    type args
    type ret
    type callback = args -> ret

    (* `null` is some closure that is never returned by `make`.
     *
     * `free` has no effect if applied to a closure not returned by `make` or
     * a closure that `free` has already been applied to and may report an
     * error but does not raise an exception.
     *
     * `call` returns an implementation-defined value if applied to a closure
     * not returned by `make` or a closure that `free` has already been
     * applied to and may report an error but does not raise an exception.
     *)
    val null : t
    val make : callback -> t
    val free : t -> unit
    val call : t -> callback
  end
