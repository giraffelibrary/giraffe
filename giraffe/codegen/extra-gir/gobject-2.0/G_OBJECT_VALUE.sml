(* Copyright (C) 2012, 2015, 2017 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

signature G_OBJECT_VALUE =
  sig
    type t
    type type_t

    val init : type_t -> t
    val reset : t -> unit

    val getType : unit -> type_t
    val holds : type_t -> t -> bool
    val gTypeOf : t -> type_t
    val isValue : t -> bool
  end
