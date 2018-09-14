(* Copyright (C) 2016-2017 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

functor CRef(CValueType : C_VALUE_TYPE) :>
  C_REF
    where type v = CValueType.v =
  struct
    open CValueType

    type r = p

    fun withRef f x =
      let
        val r = malloc (size ())
        val () = set (r, x)
        fun freeRef () = free r
      in
        let
          val y = f r
          val x' = get r
          val () = freeRef ()
        in
          x' & y
        end
          handle e => (freeRef (); raise e)
      end

    structure PolyML =
      struct
        val cRef = CValueType.PolyML.cPtr
      end
  end
