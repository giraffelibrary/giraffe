(* Copyright (C) 2023 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

signature WEAK =
  sig
    type 'a t = unit -> 'a option

    type 'a object_class

    val new : 'a object_class -> 'a object_class t

    val app : ('a -> unit) -> 'a t -> unit
    val app1 : ('a -> 'b -> unit) -> 'a t -> 'b -> unit

    val map : ('a -> 'b) -> 'a t * 'b -> 'b
    val map1 : ('a -> 'b -> 'c) -> 'a t * 'c -> 'b -> 'c
  end
