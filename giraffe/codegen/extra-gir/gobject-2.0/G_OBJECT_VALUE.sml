(* Copyright (C) 2012, 2015 Phil Clayton <phil.clayton@veonix.com>
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
 (* val copy : t * t -> unit  ?? should be called assign for consistency? *)
    val reset : t -> unit

    val getType : unit -> type_t
    val holds : type_t -> t -> bool
    val gTypeOf : t -> type_t
    val isValue : t -> bool
 

    type ('a, 'b) accessor

    val get : ('a, 'b) accessor -> t -> 'a
    val set : ('a, 'b) accessor -> t -> 'b -> unit
    val baseType : ('a, 'b) accessor -> type_t


    structure C :
      sig
        type v

        val createAccessor :
          {
            getType  : unit -> type_t,
            getValue : v -> 'a,
            setValue : (v, 'b) pair -> unit
          }
            -> ('a, 'b) accessor

        val get : ('a, 'b) accessor -> v -> 'a
        val set : ('a, 'b) accessor -> v -> 'b -> unit

        val isValue : v -> bool
      end
  end
