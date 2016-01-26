(* Copyright (C) 2012, 2016 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

(**
 * The signature contraint C_POINTER is applied later to allow CPointer to be
 * used for the implementation of CTypedPointer.
 *)
structure CPointer =
  struct
    type 'a p = MLton.Pointer.t
    type notnull = unit
    type t = notnull p

    fun eq (p, q) = p = q
    val null = MLton.Pointer.null
    fun isNull p = p = null
    exception Null

    fun toNotNull p = if isNull p then raise Null else p
    fun fromNotNull p = p
    fun toOptNull p = p

    fun toOpt p = SOME (toNotNull p) handle Null => NONE
    val fromOpt = fn NONE => null | SOME x => x
    fun mapOpt f = fromOpt o Option.map f o toOpt
    fun appOpt f = Option.app f o toOpt

    val fromVal = I
    val fromOptVal = toOpt

    val withVal = I
    fun withOptVal f = withVal f o fromOpt

    type ('a, 'b) r = MLton.Pointer.t ref

    fun withNullRef f = raise Fail "withNullRef not supported"
    fun withRef f p =
      let
        val r = ref p
        val ret = f r
        val p' = ! r
      in
        p' & ret
      end
    fun withRefVal f = withVal (withRef f)
    fun withRefOptVal f = withOptVal (withRef f)

    val add = MLton.Pointer.add
    val sub = MLton.Pointer.sub

    structure Type =
      struct
        type t = MLton.Pointer.t
        val size = MLton.Pointer.sizeofPointer
        val get = MLton.Pointer.getPointer
        val set = MLton.Pointer.setPointer
      end
    structure NotNullType = Type
    structure OptNullType = Type

    structure MLton = 
      struct
        fun toRef x = ref x
        fun fromRef x = ! x
      end
  end
