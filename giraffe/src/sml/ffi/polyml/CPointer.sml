(* Copyright (C) 2012, 2016 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

structure CPointer =
  struct
    open PolyMLFFI

    type 'a p = Memory.Pointer.t
    type notnull = unit
    type t = notnull p

    fun eq (p, q) = p = q
    val null = Memory.Pointer.null
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

    type ('a, 'b) r = Memory.Pointer.t

    fun withNullRef f () = f Memory.Pointer.null
    fun withRef f p =
      let
        val mem = Memory.malloc Memory.Pointer.size
        val () = Memory.setPointer (mem, 0w0, p)
        fun freeMem () = Memory.free mem
      in
        let
          val ret = f mem
          val p' = Memory.getPointer (mem, 0w0)
          val () = freeMem ()
        in
          p' & ret
        end
          handle e => (freeMem (); raise e)
      end
    fun withRefVal f = withVal (withRef f)
    fun withRefOptVal f = withOptVal (withRef f)

    val add = Memory.Pointer.add
    val sub = Memory.Pointer.sub

    structure Type =
      struct
        type t = Memory.Pointer.t
        val size = Memory.Pointer.size
        fun get (p, n) = Memory.getPointer (p, Word.fromInt n)
        fun set (p, n, e) = Memory.setPointer (p, Word.fromInt n, e)
      end
    structure NotNullType = Type
    structure OptNullType = Type

    structure PolyML =
      struct
        val toSysWord = Memory.Pointer.toSysWord

        val cVal = cPointer
        val cOptVal = cPointer

        val cRef = cPointer
        val cRefIn = cPointer
        val cRefOut = cPointer
        val cRefInOut = cPointer
      end
  end
