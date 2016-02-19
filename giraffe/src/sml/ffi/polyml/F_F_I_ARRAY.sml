(* Copyright (C) 2013, 2016 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

signature F_F_I_ARRAY =
  sig
    type t

    structure C :
      sig
        type notnull
        type 'a in_p
        type 'a out_p
        type ('a, 'b) r
        val withNullRef : (('a, 'b) r -> 'r) -> unit -> 'r
        val withPtr : ('a in_p -> 'b) -> t -> 'b
        val withOptPtr : (unit in_p -> 'a) -> t option -> 'a
        val withRefPtr : (('a, 'b) r -> 'c) -> t -> ('b out_p, 'c) pair
        val withRefOptPtr : ((unit, 'a) r -> 'b) -> t option -> ('a out_p, 'b) pair
        val withRefDupPtr : (('a, 'b) r -> 'c) -> t -> ('b out_p, 'c) pair
        val withRefDupOptPtr : ((unit, 'a) r -> 'b) -> t option -> ('a out_p, 'b) pair
        type 'a from_p
        val fromPtr : bool -> notnull out_p -> t from_p
        val fromOptPtr : bool -> 'a out_p -> t option from_p
      end

    structure PolyML :
      sig
        val INPTR : C.notnull C.in_p PolyMLFFI.conversion
        val INOPTPTR : unit C.in_p PolyMLFFI.conversion
        val OUTREF : (unit, C.notnull) C.r PolyMLFFI.conversion
        val OUTOPTREF : (unit, unit) C.r PolyMLFFI.conversion
        val INOUTREF : (C.notnull, C.notnull) C.r PolyMLFFI.conversion
        val RETPTR : C.notnull C.out_p PolyMLFFI.conversion
        val RETOPTPTR : unit C.out_p PolyMLFFI.conversion
      end
  end
