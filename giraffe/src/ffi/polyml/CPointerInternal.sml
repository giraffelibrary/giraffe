(* Copyright (C) 2012-2020 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

(**
 * CPointerInternal exposes the internal pointer representation in order to
 * proivde implementations of C_POINTER within other structures.  It does not
 * matter that null type-safety from the type constraints of the signature
 * C_POINTER is ineffective because CPointerInternal is only used internally.
 *)
structure CPointerInternal :>
  C_POINTER
    where type 'a p = PolyMLFFI.Memory.Pointer.t =
  struct
    open PolyMLFFI

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
        fun freeMem () = Memory.free mem
      in
        let
          val ret = f mem
          val p' = Memory.getPointer (mem, 0)
          val () = freeMem ()
        in
          p' & ret
        end
          handle e => (freeMem (); raise e)
      end
    fun withRefVal f = withVal (withRef f)
    fun withRefOptVal f = withOptVal (withRef f)

    fun add w p = Memory.Pointer.add (p, w)
    fun sub w p = Memory.Pointer.sub (p, w)

    structure Type =
      struct
        type t = Memory.Pointer.t
        type v = Memory.Pointer.t
        type p = Memory.Pointer.t
        structure PolyML =
          struct
            val cVal = cPointer
            val cPtr = cPointer
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

        local
          open PolyMLFFI
        in
          val g_malloc_sym = getSymbol "g_malloc"
          val g_free_sym = getSymbol "g_free"
          fun malloc n = call g_malloc_sym (cUlong --> cPointer) (Word.toInt n)
          val free = call g_free_sym (cPointer --> cVoid)
        end
      end
    structure NonOptValueType = Type
    structure OptValueType = Type

    structure PolyML =
      struct
        val toSysWord = Memory.Pointer.toSysWord

        val cVal = cPointer
        val cOptVal = cPointer

        val cOptOutRef = cPointer
        val cInOptOutRef = cPointer
        val cRef = cPointer
        val cInRef = cPointer
      end
  end
