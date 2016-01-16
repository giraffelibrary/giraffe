(* Copyright (C) 2012, 2016 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

signature POINTER =
  sig
    include POINTER

    (**
     * The structure PolyML provides versions of functions provided by the
     * PolyML module PolyMLFFI for use with null-type-safe pointers.
     *
     * Note that null-type-safety does not extend through mutable values so
     * the conversion `cPointer` does not preserve null-type-safety: the
     * pointer returned by the load function can be whatever its type
     * inference context requires.
     *)
    structure PolyML :
      sig
        val toSysWord : 'a t -> SysWord.word

        val cVal : 'a t PolyMLFFI.conversion
        val POINTER : 'a t PolyMLFFI.conversion  (* for compatibility *)

        type ref_
        val nullRef : ref_
        val withRef : (ref_ -> 'c) -> 'a t -> ('b t, 'c) pair
        val cRef : ref_ PolyMLFFI.conversion
      end
  end
