(* Copyright (C) 2016-2020 Phil Clayton <phil.clayton@veonix.com>
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

    fun withNullRef f () = f Memory.Pointer.null

    fun withRef f x =
      let
        val r = Memory.malloc (size ())
        val () = set (r, x)
      in
        let
          val y = f r
          val x' = get r
          val () = Memory.free r
        in
          x' & y
        end
          handle e => (Memory.free r; raise e)
      end

    structure PolyML =
      struct
        val cRef = Memory.PolyML.cPointer
      end
  end
