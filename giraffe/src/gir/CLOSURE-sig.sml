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

    val null : t
    val make : callback -> t
    val free : t -> unit
    val call : t -> callback
  end
