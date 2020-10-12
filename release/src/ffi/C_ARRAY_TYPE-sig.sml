(* Copyright (C) 2016-2020 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

signature C_ARRAY_TYPE (* includes C_POINTER_TYPE *) =
  sig
    type t
    type elem

    structure ElemSequence :
      MONO_SEQUENCE
        where type t = t
        where type elem = elem

    structure Pointer : C_POINTER
    type opt = Pointer.opt
    type non_opt = Pointer.non_opt
    type 'a p = 'a Pointer.p

    type 'a from_p

    type e

    structure ElemType :
      sig
        (* `free ~1` must be applied to the pointer returned by `toC` once
         * it is not required.
         *)
        val free  : int -> e -> unit
        val toC   : elem -> e
        val fromC : e -> elem
      end

    (**
     * `new n` returns a pointer to a newly allocated C array with
     * `n` elements (excluding the null terminator if the array is null-
     * terminated) that are initalized to zero.  `free 1` must be applied
     * to the pointer returned by `new` once it is not required.
     *)
    val new : int -> non_opt p

    (**
     * `dup d p` and `free d p` duplicate and free, respectively, the
     * data referenced by the C pointer `p` where `d` indicates the depth
     * to duplicate and free, respectively, to.  `d = 0` effects no
     * operation, `d = 1` duplicates and frees, respectively, only the
     * top-level structure, `d = 2` the top two levels, etc.  `d = ~1`
     * duplicates and frees, respectively, all levels.  For data that is
     * reference-counted, duplicating increments the reference count and
     * freeing decrements the reference count and deallocates memory iff
     * the count reaches zero.
     *)
    val dup  : int -> (non_opt p -> non_opt p) from_p
    val free : int -> (non_opt p -> unit) from_p

    (**
     * Following `set p (i, e)` or `setElem p (i, elem)`, `ElemType.free ~1`
     * must be applied to the element at index `i` of `p` once it is no
     * longer required.  (This could be achieved by applying `free ~1` to
     * `p`.)
     *
     * Note that `getElem p` is equivalent to `ElemType.fromC o get p` but is
     * included for uniformity.
     *)
    val len     : (non_opt p -> int) from_p
    val get     : (non_opt p -> int -> e)    from_p
    val getElem : (non_opt p -> int -> elem) from_p
    val set     : (non_opt p -> int * e    -> unit) from_p
    val setElem : (non_opt p -> int * elem -> unit) from_p

    (**
     * `init set (n, f)` returns a pointer to a newly allocated C array with
     * `n` elements (excluding the null terminator if the array is null-
     * terminated) where, for all i, 0 <= i < n, the element at (zero-based)
     * index i, is set to `f i` using `set`.
     *
     * `set p (i, f i)` returns ownership for the element at index i so
     * `free ~1` must be applied to the pointer returned by `init` once it is
     * not required.
     *)
    val init :
      (non_opt p -> int * 'a -> unit) from_p
       -> int * (int -> 'a)
       -> non_opt p

    (**
     * Conversion to and from the C representation is provided by `toC`
     * and `fromC`.  `fromC p` copies data referenced by the C pointer
     * `p` and `toC t` copies data referenced by C pointers in `t`, if
     * any exist.  For data that is reference-counted, copying increments
     * the reference count.
     *
     * `free ~1` must be applied to the pointer returned by `toC t` once
     * it is not required.
     *)
    val toC : (t -> non_opt p) from_p
    val fromC : (non_opt p -> t) from_p
  end
