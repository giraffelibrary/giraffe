(* Copyright (C) 2012, 2015, 2017 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

signature VALUE_ACCESSOR =
  sig
    type ('a, 'b) t

    type type_t
    type value_t

    val get : ('a, 'b) t -> value_t -> 'a
    val set : ('a, 'b) t -> value_t -> 'b -> unit
    val baseType : ('a, 'b) t -> type_t

    structure C :
      sig
        type value_v

        val createAccessor :
          {
            getType  : unit -> type_t,
            getValue : value_v -> 'a,
            setValue : (value_v, 'b) pair -> unit
          }
            -> ('a, 'b) t

        val get : ('a, 'b) t -> value_v -> 'a
        val set : ('a, 'b) t -> value_v -> 'b -> unit

        val isValue : value_v -> bool
      end

    structure Types :
      sig
        val boolean : (bool, bool) t
        val int : (LargeInt.int, LargeInt.int) t
        val uint : (LargeInt.int, LargeInt.int) t
        val long : (LargeInt.int, LargeInt.int) t
        val ulong : (LargeInt.int, LargeInt.int) t
        val int64 : (LargeInt.int, LargeInt.int) t
        val uint64 : (LargeInt.int, LargeInt.int) t
        val float : (real, real) t
        val double : (real, real) t
        val char : (char, char) t
        val string : (string, string) t
        val stringOpt : (string option, string option) t

        (* temporary *)
        val int32 : (LargeInt.int, LargeInt.int) t
        val uint32 : (LargeInt.int, LargeInt.int) t
      end
  end
