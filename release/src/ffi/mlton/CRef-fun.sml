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
    type v = CValueType.v

    type r = v ref

    fun withNullRef f = raise Fail "withNullRef not supported"

    fun withRef f x =
      let
        val r = ref x
        val y = f r
        val x' = ! r
      in
        x' & y
      end

    structure MLton = 
      struct
        fun toRef x = ref x
        fun fromRef x = ! x
      end
  end
