(* Copyright (C) 2012, 2015 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

signature G_OBJECT_VALUE =
  sig
    type record_t
    type type_t

    type t = record_t


    val init : type_t -> record_t
 (* val copy : record_t * record_t -> unit  ?? should be called assign for consistency? *)
    val reset : record_t -> unit

    val getType : unit -> type_t
    val holds : type_t -> record_t -> bool
    val gTypeOf : record_t -> type_t
    val isValue : record_t -> bool
 

    type ('a, 'b) accessor

    val get : ('a, 'b) accessor -> record_t -> 'a
    val set : ('a, 'b) accessor -> record_t -> 'b -> unit
    val baseType : ('a, 'b) accessor -> type_t


    structure C :
      sig
        type notnull
        type 'a p

        val createAccessor :
          {
            getType  : unit -> type_t,
            getValue : notnull p -> 'a,
            setValue : (notnull p, 'b) pair -> unit
          }
            -> ('a, 'b) accessor

        structure Array :
          sig
            type 'a array_p
            val get : ('a, 'b) accessor -> notnull array_p -> word -> 'a
            val set : ('a, 'b) accessor -> notnull array_p -> word -> 'b -> unit
          end

        val set : ('a, 'b) accessor -> notnull p -> 'b -> unit

        val isValue : notnull p -> bool
      end
  end
