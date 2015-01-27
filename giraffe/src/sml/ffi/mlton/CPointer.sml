(* Copyright (C) 2012 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

structure CPointer :>
  sig
    include POINTER

    (**
     * The structure MLton provides versions of functions provided by the
     * MLton module MLton.Pointer for use with null-type-safe pointers.
     * Other functions are as follows:
     *
     * fromPointer, fromOptPointer
     *
     * For two abstract pointer types, p1 and p2, where p1 is a pointer
     * to an array of pointers of type p2, it is not possible to construct
     * a function
     *
     *   getPointer : p1 * int -> p2
     *
     * from
     *
     *   MLton.Pointer.getPointer : MLton.Pointer.t * int -> MLton.Pointer.t
     *
     * because there is no scope in which both p1 and p2 can be unified with
     * `MLton.Pointer.t`, their internal representation.  The interface
     * includes
     *
     *   val getPointer : notnull t * int -> MLton.Pointer.t
     *   val fromPointer : MLton.Pointer.t -> notnull t
     *   val fromOptPointer : MLton.Pointer.t -> unit t
     *
     * `fromPointer` and `fromOptPointer` (for type p2) enable the result of
     * `getPointer` (for type p1) to be cast to the required pointer type.
     * Clearly these function can break null-type-safety so should be used
     * with care.
     *
     * unsafeRefConv
     *
     * MLton supports C function reference parameters by using the SML type
     * `t ref` for a C function parameter.  Although the underlying type of
     * the referenced value must be the same both before and after a call to
     * the C function, a different SML type for before and after values is
     * still meaningful when the types differ only in the values of phantom
     * type variables as the values of phantom type variables do not affect
     * the underlying type.  Due to the typing of reference parameters, it is
     * not possible to have a different SML type for before and after values.
     *
     * For example, we may want to specify that a pointer reference function
     * parameter is optionally-null beforehand and non-null afterwards.
     * However, as `unit t` and `notnull t` are different SML types, this
     * is not possible, even though both types have the same underlying type.
     *
     * The function `unsafeRefConv` is provided to circumvent this issue at
     * a higher level.  Clearly this function can break null-type-safety so
     * should be used with care.
     *)
    structure MLton :
      sig
        val getWord8 : notnull t * int -> Word8.word

        val getPointer : notnull t * int -> MLton.Pointer.t
        val fromPointer : MLton.Pointer.t -> notnull t
        val fromOptPointer : MLton.Pointer.t -> unit t

        val unsafeRefConv : 'a t ref -> 'b t ref
      end
  end =
  struct
    type 'a t = MLton.Pointer.t
    fun eq (p, q) = p = q
    val null = MLton.Pointer.null
    fun isNull p = p = null
    exception Null

    type notnull = unit
    fun toNotNull p = if isNull p then raise Null else p

    fun toOptNull p = p

    fun toOpt p = SOME (toNotNull p) handle Null => NONE
    val fromOpt = fn NONE => null | SOME x => x

    val add = MLton.Pointer.add
    val sub = MLton.Pointer.sub

    structure MLton = 
      struct
        open MLton.Pointer
        fun fromPointer p = p
        fun fromOptPointer p = p
        fun unsafeRefConv p = p
      end
  end
