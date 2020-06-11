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

    type ('a, 'b) r = Memory.Pointer.t ref

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
        structure MLtonVector =
          struct
            val e = Memory.Pointer.null
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

    structure MLton = 
      struct
        fun toRef x = ref x
        fun fromRef x = ! x
      end
  end
