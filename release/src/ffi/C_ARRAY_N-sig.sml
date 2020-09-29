(* Copyright (C) 2020 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

(**
 * The signature C_ARRAY_N specifies the interface to C arrays that are
 * an initial slice of a larger underlying C array.
 *)
signature C_ARRAY_N =
  sig
    (**
     * The interface is the same as for a C array but the type `t` represents
     * a C array that is an initial slice of an underlying C array.  The type
     * `t` can be viewed as a pair `(array, n)` where `n` is the length of the
     * initial slice of the C array `array` and satisfies the constraint
     * `0 <= n <= length array`.  The function `length` returns the length of
     * the initial slice.
     *)
    include C_ARRAY

    (**
     * `full t` returns an initial slice that is the whole of the underlying
     * C array referenced by `t`.
     *)
    val full : t -> t

    (* `subslice (t, len)` returns an initial slice of `t` with length `len`
     * if `0 <= len <= length t` and raises Subscript otherwise.  Therefore
     * `subslice (t, ...)` cannot return a slice longer than `t`.  In order
     * to increase the length of the slice, it is necessary to use `full`
     * first, i.e `subslice (full t, len)`.
     *)
    val subslice : t * int -> t
  end
