(* Copyright (C) 2012-2020 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

(**
 * The functor CPointerInternal provides the implementation common to both
 * CPointer and CTypedPointer.  The internal representation of optional
 * pointers must be exposed to allow the extensions in CTypedPointer but this
 * loss of type safety does not matter as CPointerInternal is used only in the
 * implementations of CPointer and CTypedPointer and these do not expose the
 * internal representation.
 *)
functor CPointerInternal(Memory : C_MEMORY) :>
  C_POINTER
    where type 'a p = Memory.Pointer.t =
  struct
    type 'a p = Memory.Pointer.t
    type opt = unit
    type non_opt = unit
    type t = non_opt p

    fun eq (p, q) = p = q
    val null = Memory.Pointer.null
    fun isNull p = p = null
    exception Null

    fun notNullId p = if not (isNull p) then p else raise Null
    val toNonOptPtr = notNullId
    val toOptPtr = notNullId

    fun toOpt p = if isNull p then NONE else SOME p
    val fromOpt = fn NONE => null | SOME p => toOptPtr p

    fun mapNonNullPtr f p = if isNull p then p else toOptPtr (f p)
    fun appNonNullPtr f p = if isNull p then () else f p

    val fromVal = Fn.id
    val fromOptVal = toOpt

    val withVal = Fn.id
    fun withOptVal f = withVal f o fromOpt

    type ('a, 'b) r = Memory.Pointer.t

    fun withNullRef f () = f Memory.Pointer.null
    fun withRef f p =
      let
        val mem = Memory.malloc Memory.Pointer.size
        val () = Memory.setPointer (mem, 0, p)
      in
        let
          val ret = f mem
          val p' = Memory.getPointer (mem, 0)
          val () = Memory.free mem
        in
          p' & ret
        end
          handle e => (Memory.free mem; raise e)
      end
    fun withRefVal f = withVal (withRef f)
    fun withRefOptVal f = withOptVal (withRef f)

    fun add w p = Memory.Pointer.add (p, w)
    fun sub w p = Memory.Pointer.sub (p, w)

    val malloc = Memory.malloc
    val malloc0 = Memory.malloc0
    val free = Memory.free

    structure Type =
      struct
        type t = Memory.Pointer.t
        type v = Memory.Pointer.t
        type p = Memory.Pointer.t
        structure PolyML =
          struct
            val cVal = Memory.PolyML.cPointer
            val cPtr = Memory.PolyML.cPointer
          end

        val isRef = false
        val null = Memory.Pointer.null
        val size : unit -> word =
          Fn.const Memory.Pointer.size

        val toC = Fn.id
        val updateC = Fn.const Fn.ignore
        val fromC = Fn.id

        val new : unit -> v = Fn.const null
        val delete = Fn.ignore
        val clear = Fn.ignore

        fun get p = Memory.getPointer (p, 0)
        fun set (p, x) = Memory.setPointer (p, 0, x)

        structure Memory = Memory
      end
    structure NonOptValueType = Type
    structure OptValueType = Type

    structure PolyML =
      struct
        val toSysWord = Memory.Pointer.toSysWord

        val symbolAsAddress = Memory.PolyML.symbolAsAddress

        val cVal = Memory.PolyML.cPointer
        val cOptVal = Memory.PolyML.cPointer

        val cOptOutRef = Memory.PolyML.cPointer
        val cInOptOutRef = Memory.PolyML.cPointer
        val cRef = Memory.PolyML.cPointer
        val cInRef = Memory.PolyML.cPointer
      end
  end
