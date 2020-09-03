(* Copyright (C) 2012, 2015, 2017, 2020 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

signature G_OBJECT_VALUE =
  sig
    type t
    type type_t
    val getType : unit -> type_t
    val new : unit -> t  (* new value is initialized to zero *)
    val copy :
      t
       -> t
       -> unit
    val fitsPointer : t -> bool
    val init :
      t
       -> type_t
       -> unit
    val reset : t -> unit
    val transform :
      t
       -> t
       -> bool
    val unset : t -> unit
    val typeCompatible : type_t * type_t -> bool
    val typeTransformable : type_t * type_t -> bool
    val holds : type_t -> t -> bool
    val gTypeOf : t -> type_t
    val isValue : t -> bool
  end
