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
     * The structure PolyML provides versions of functions provided by the
     * PolyML module CInterface for use with null-type-safe pointers.
     *
     * CInterface provides the type `vol` for volatiles.  Essentially, a
     * volatile represents a C value.  (In fact, a volatile represents a 1-D
     * array and is said to 'encapsulate' such an array value --- see Poly/ML
     * CInterface documentation for details.)  The operations on volatiles
     * offer much of the flexibility of C but with absolutely no C-level type
     * checking.  As the onus is on the ML program to combine volatiles in the
     * correct way, extreme care is required when using volatiles.  Ideally,
     * volatiles would be wrapped up in a module using phantom types to
     * provide some sort of static C-level type checking.  For now, we simply
     * provide null-type-safe operations for volatiles that are pointers but
     * cannot enforce their correctly-typed use as pointers.
     *
     * fromVol
     *
     * In order for SML to be able to assume that a pointer held in a `vol`
     * is non-null without checking, there must be 'hole' in the null-type-
     * safe interface.  `fromVol` is that hole: the returned pointer can
     * be whatever its type inference context requires.  The conversion 
     * `POINTER` also contains this hole as it uses `fromVol` internally.
     *)
    structure PolyML :
      sig
        (**
         * Support where a `vol` is anything.
         *)
        val addressFromVol : CInterface.vol -> notnull t
        val derefToVol : notnull t -> CInterface.vol

        val derefOffset : 'a CInterface.Conversion -> notnull t -> int -> 'a

        (**
         * Support where a `vol` is a pointer.
         *)
        val toVol : 'a t -> CInterface.vol
        val fromVol : CInterface.vol -> 'a t
        val POINTER : 'a t CInterface.Conversion

        val assign : CInterface.vol -> 'a t -> unit

        val fromCstring : notnull t -> string
        val toCstring : string -> notnull t

        val setFinal : CInterface.sym -> notnull t -> unit
      end
  end =
  struct
    open CInterface

    type 'a t = vol
    fun eq (p, q) = fromClong p = fromClong q
    val null = null
    fun isNull p = fromClong p = 0
    exception Null

    type notnull = unit
    fun toNotNull p = if isNull p then raise Null else p

    fun toOptNull p = p

    fun toOpt p = SOME (toNotNull p) handle Null => NONE
    val fromOpt = fn NONE => null | SOME x => x

    fun add (p, w) = toClong (fromClong p + Word.toInt w)
    fun sub (p, w) = toClong (fromClong p - Word.toInt w)

    structure PolyML =
      struct
        (**
         * `copyPointer` creates a new `vol` that has the same value as an
         * existing `vol`, for volatiles that represent pointers.
         *)
        fun copyPointer p =
          let
            val v = alloc 1 voidStar
          in
            assign voidStar v p;
            v
          end

        (**
         * Internally, type `'a t` is `CInterface.vol` and values of this
         * type can be destructively updated by `CInterface.assign`.  This
         * presents an issue for null-type-safety because the `vol` that
         * provides `notnull t` value could be assigned null.  To ensure
         * null-type-safety, the `vol` that provides a pointer must never be
         * accessible.  (Even the `vol` that provides an optionally-null
         * pointer must never be accessible because such a pointer can be
         * converted to a non-null pointer when its value is not null.)
         *
         * Ensuring that the `vol` values of pointers cannot leak out of the
         * interface requires a little care.  Clearly, when converting
         * between a pointer and a `vol` in either direction, a copy must be
         * made.  If no copy is made, `fromVol` would break null-type-safety
         * as follows:
         *
         *   (* given `v : vol` that is not null *)
         *   val ptr : notnull t = toNotNull (fromVol v);
         *   let open CInterface in assign voidStar v null end
         *   (* `ptr : notnull t` is null *)
         *
         * and `toVol` as follows:
         *
         *   (* given `ptr : notnull t` *)
         *   let open CInterface in assign voidStar (toVol ptr) null end
         *   (* `ptr : notnull t` is null *)
         *
         * Furthermore, when taking the address of a pointer, it is necessary
         * to take the address of a copy of the pointer: otherwise the
         * address provides a reference to the underlying `vol` of the
         * pointer which can leak out, even though `toVol` and `fromVol` do
         * not, themselves, allow a `vol` to leak:
         *
         *   (* given `ptr : notnull t` *)
         *   val v = toVol (address ptr)
         *   let open CInterface in assign voidStar (deref v) null end
         *   (* `ptr : notnull t` is null *)
         *
         * For similar reasons, dereferencing must make a copy of the
         * referenced `vol` before returning it as a pointer because a
         * reference to it could already exist:
         *
         *   (* given `v : vol` that is not null *)
         *   val ptr : notnull t =
         *     toNotNull (deref (toNotNull (fromVol (CInterface.address v))));
         *   let open CInterface in assign voidStar v null end
         *   (* `ptr : notnull t` is null *)
         *)
        val toVol = copyPointer
        val fromVol = copyPointer

        val POINTER = CInterface.mkConversion fromVol toVol voidStar

        val assign = CInterface.assign voidStar

        val addressFromVol = CInterface.address
        val derefToVol = CInterface.deref

        val fromCstring = CInterface.fromCstring
        val toCstring = CInterface.toCstring

        val setFinal = CInterface.setFinal

        (* Although copying the result of dereferencing prevents a `vol`
         * alias existing for the pointer returned by `deref`, the copy
         * operation makes `deref` unsuitable for working with an array of
         * pointers that is to be subscripted.
         *
         * With the Poly/ML C primitives, given a vol `v` that is a pointer
         * to an array of pointers, we may lookup index `i` by
         *
         *   offset i voidStar (deref p)
         *
         * (Unlike a subcript in C, the dereference is performed first.)
         * Using `deref` (with the final copy operation) prior to an offset
         * is problematic for two separate reasons:
         *
         *   1. The returned copy is, internally, a `vol` that encapsulates
         *      an array of size one --- containing just the first element
         *      of the referenced array.  A subsequent offset operation would
         *      be relative to this copy, not the original array.
         *
         *   2. When subscripting several indices, it is preferable to
         *      perform the `deref` only once by having a subscript function
         *      evaluate it in a partial evaluation.  However, for empty
         *      arrays, the subscript function would never be fully evaluated
         *      because no valid index exists.  The copy operation would
         *      accesses the first element during the partial evaluation,
         *      so makes the assumption that the array is non-empty.
         *
         * For these reasons, the interface provides a subscript operation
         * `derefOffset` that combines the `deref` and `offset` operations
         * and does not provide an offset operation for type `'a t`.
         * Note that use of `derefOffset POINTER` for subscripting an array
         * of pointers will ensure that the dereferenced `vol` is copied.
         *)
        fun derefOffset conv p =
          (* partial evaluation to avoid performing deref per index *)
          let
            val (fromC, _, Ctype) = breakConversion conv
            val q = CInterface.deref p
          in
            fn i => fromC (CInterface.offset i Ctype q)
          end
      end
  end
