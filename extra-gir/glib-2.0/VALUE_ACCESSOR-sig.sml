(* Copyright (C) 2012, 2015, 2017-2018, 2020-2021 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

signature VALUE_ACCESSOR =
  sig
    type 'a t

    type type_t
    type value_t

    val new : 'a t -> 'a -> value_t
    val get : 'a t -> value_t -> 'a
    val set : 'a t -> value_t -> 'a -> unit
    val gtype : 'a t -> type_t

    val map : ('a -> 'b) * ('b -> 'a) -> 'a t -> 'b t

    structure C :
      sig
        type value_v

        val createAccessor :
          {
            getType  : unit -> type_t,
            getValue : value_v -> 'a,
            setValue : (value_v, 'a) pair -> unit
          }
           -> 'a t

        val gtype : 'a t -> unit -> type_t
        val get : 'a t -> value_v -> 'a
        val set : 'a t -> value_v -> 'a -> unit

        val init : value_v -> type_t -> unit

        val isValue : value_v -> bool
      end

    structure Types :
      sig
        val boolean : bool t
        val int : LargeInt.int t
        val uint : LargeInt.int t
        val long : LargeInt.int t
        val ulong : LargeInt.int t
        val int64 : LargeInt.int t
        val uint64 : LargeInt.int t
        val float : real t
        val double : real t
        val char : char t
        val string : string t
        val stringOpt : string option t
      end
  end
