(* Copyright (C) 2013 Phil Clayton <phil.clayton@veonix.com>
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
        val withConstPtr : ('a in_p -> 'b) -> t -> 'b
        val withConstOptPtr : (unit in_p -> 'a) -> t option -> 'a
        val withRefConstPtr : (('a, 'b) r -> 'c) -> t -> ('b out_p, 'c) pair
        val withRefConstOptPtr : ((unit, 'a) r -> 'b) -> t option -> ('a out_p, 'b) pair
        val withRefDupPtr : (('a, 'b) r -> 'c) -> t -> ('b out_p, 'c) pair
        val withRefDupOptPtr : ((unit, 'a) r -> 'b) -> t option -> ('a out_p, 'b) pair
        val fromPtr : bool -> 'a out_p -> t
        val fromOptPtr : bool -> 'a out_p -> t option
      end
    structure PolyML :
      sig
        val INPTR : C.notnull C.in_p CInterface.Conversion
        val INOPTPTR : unit C.in_p CInterface.Conversion
        val OUTREF : (unit, C.notnull) C.r CInterface.Conversion
        val OUTOPTREF : (unit, unit) C.r CInterface.Conversion
        val INOUTREF : (C.notnull, C.notnull) C.r CInterface.Conversion
        val RETPTR : C.notnull C.out_p CInterface.Conversion
        val RETOPTPTR : unit C.out_p CInterface.Conversion
      end
  end
