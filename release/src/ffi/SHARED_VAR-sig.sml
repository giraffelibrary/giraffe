(* Copyright (C) 2023 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

(* The signature SHARED_VAR defines a mutable type `'a t` and operations
 * that provide thread-safe access to mutable values of the type.
 *)
signature SHARED_VAR =
  sig
    type 'a t

    val new : 'a -> 'a t
    val get : 'a t -> 'a

    val map : 'a t -> ('a -> 'a) -> unit
    val foldmap : 'a t -> ('b * 'a -> 'c * 'a) -> 'b -> 'c
  end
