(* Copyright (C) 2012, 2016 Phil Clayton <phil.clayton@veonix.com>
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
    where type 'a p = MLton.Pointer.t =
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

    val fromVal = Fn.id
    val fromOptVal = toOpt

    val withVal = Fn.id
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
        type v = MLton.Pointer.t
        type p = MLton.Pointer.t
        structure MLtonVector =
          struct
            val e = MLton.Pointer.null
          end

        val isRef = false
        val null = MLton.Pointer.null
        val size : unit -> word =
          Fn.const MLton.Pointer.sizeofPointer

        val toC = Fn.id
        val updateC = Fn.const Fn.ignore
        val fromC = Fn.id

        val new : unit -> v = Fn.const null
        val delete = Fn.ignore
        val clear = Fn.ignore

        fun get p = MLton.Pointer.getPointer (p, 0)
        fun set (p, x) = MLton.Pointer.setPointer (p, 0, x)

        val malloc_ = _import "g_malloc" : C_Size.t -> t;
        val free_ = _import "g_free" : t -> unit;
        fun malloc n = malloc_ (C_Size.fromLargeWord (Word.toLargeWord n))
        val free = free_
      end
    structure NotNullType = Type
    structure OptNullType = Type

    structure MLton = 
      struct
        fun toRef x = ref x
        fun fromRef x = ! x
      end
  end
