(* Copyright (C) 2012, 2016-2020 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

(**
 * The signature C_ARRAY specifies the interface to C arrays and their high-
 * level FFI.
 *)
signature C_ARRAY =
  sig
    (**
     * The type `t` represents a C array, for example, a C character array
     * (i.e. C string) or a C string array.
     *)
    type t

    (**
     * The type `elem` represents array element values in SML.
     *)
    type elem

    (**
     * `length t` returns the length of `t` (excluding any null terminator
     * that may be present in the internal representation).
     *)
    val length : t -> int

    (**
     * `sub t i` returns the element at (zero-based) index i of t.  It
     * raises `Subscript` if `i < 0` or `length t <= i`.  Note, therefore,
     * that `i` cannot index a null terminator if one is present in the
     * internal representation.
     *)
    val sub : t -> int -> elem

    (**
     * `tabulate (n, f)` returns a C array t such that `length t` is n
     * and, for all i, 0 <= i < n, `sub t i` is `f i`.  It raises
     * `Size` if n < 0.
     *)
    val tabulate : int * (int -> elem) -> t

    (**
     * Conversion between SML list and C array.
     *
     * For an array that is not null terminated, `fromList es` returns a
     * C array whose elements are from `es` and `toList t` returns an SML
     * list whose elements are from `t`.
     *
     * For an array that is null terminated, the elements of the SML list can
     * represent the null terminator value.  `fromList es` returns a C array
     * whose elements are from some prefix of `es` that includes at least all
     * elements before the first null terminator if such an element exists
     * and, otherwise, all elements.  Similarly, `toList t` returns an SML
     * list whose elements are from some prefix of `t` that includes at least
     * all elements before the first null terminator if such an element
     * exists and, otherwise, all elements.
     *
     * For example, for a null-terminated character array, i.e. where type
     * `sequence` is `string` and type `elem` is `char`, an implementation
     * may have the following behaviour:
     *
     *   toList (fromList [#"a", #"\000", #"b", #"c"]) = [#"a"]
     *   toList (fromList [#"\000", #"a", #"b", #"c"]) = []
     *
     * or, for any character list `cs`, an implementation may have the
     * following property:
     *
     *   toList (fromList cs) = cs
     *
     *)
    val fromList : elem list -> t
    val toList : t -> elem list

    (**
     * Conversion between SML sequence and C array.
     *
     * The type `sequence` represents array values in SML.
     *
     * For an array that is not null terminated, `fromSequence v` returns a
     * C array whose elements are from `v` and `toSequence t` returns an SML
     * sequence whose elements are from `t`.
     *
     * For an array that is null terminated, the elements of the SML sequence
     * can represent the null terminator value.  `fromSequence v` returns a
     * C array whose elements are from some prefix of `v` that includes at
     * least all elements before the first null terminator if such an element
     * exists and, otherwise, all elements.  Similarly, `toSequence t`
     * returns an SML sequence whose elements are from some prefix of `t`
     * that includes at least all elements before the first null terminator
     * if such an element exists and, otherwise, all elements.
     *
     * For example, for a null-terminated character array, i.e. where type
     * `sequence` is `string`, an implementation may have the following
     * behaviour:
     *
     *   toSequence (fromSequence "a\000bc") = "a"
     *   toSequence (fromSequence "\000abc") = ""
     *
     * or, for any string `s`, an implementation may have the following
     * property:
     *
     *   toSequence (fromSequence s) = s
     *
     *)
    type sequence
    val fromSequence : sequence -> t
    val toSequence : t -> sequence

    (**
     * The structure C provides the underlying C array representation and
     * operations.
     *)
    structure C :
      sig
        structure Pointer : C_POINTER
        type opt = Pointer.opt
        type non_opt = Pointer.non_opt
        type 'a p = 'a Pointer.p
        type ('a, 'b) r = ('a, 'b) Pointer.r

        structure ArrayType :
          C_ARRAY_TYPE
            where type t = sequence
            where type elem = elem
            where type opt = opt
            where type non_opt = non_opt
            where type 'a p = 'a p
      end

    (**
     * The structure FFI provides the wrapper functions and FFI types.
     *
     * Support for particular FFI mechanisms may be provided in additional
     * structures with platform-specific names.
     *)
    structure FFI :
      sig
        type opt = C.opt
        type non_opt = C.non_opt

        (**
         * Return values
         *
         * The type `'a out_p` is the FFI type for a pointer to a C array
         * returned by a C function, either as the return value or 'exported'
         * from a reference parameter.  `opt out_p` and `non_opt out_p`
         * represent an optional and non-optional pointer, respectively.
         *)
        type 'a out_p = 'a C.p

        (* The pointer returned by a function may not, on its own, be enough
         * to read the array, in particular, the C array may not contain any
         * information about its size.  For example, a C string may not be
         * null-terminated.
         *
         * The type `'a from_p` is the function type that returns the array
         * representation 'a from the pointer type `'b out_p`.  For example,
         * an implementation that requires the size of the array would
         * define
         *
         *   'a from_p = int -> 'a
         *
         * Alternatively, if the array size can be determined from just the
         * pointer, an implementation would define
         *
         *   'a from_p = 'a
         *
         *)
        type 'a from_p = 'a C.ArrayType.from_p

        (* An array returned by or exported from a C function is wrapped
         * according to:
         *   - whether the caller must free the C array;
         *   - the persistence of the C array.
         *
         * When a returned C array is either
         *   - static or
         *   - an allocated array that must be freed by the caller
         * the C array will be in memory for as long as necessary.  In these
         * cases, `from[Opt]Ptr d` can be used where `d`, the depth to free
         * to, would be 0 for a static array.  In other cases, keeping a
         * reference to the C array may be unreliable so either
         * `fromDup[Opt]Ptr d` should be used to duplicate the top `d` levels
         * or `copyPtr tab d` should be used to copy the whole array using
         * the tabulator `tab` and free the top `d` levels.
         *)
        type 'a tabulator = int * (int -> elem) -> 'a

        val fromPtr    : int -> non_opt out_p -> t from_p
        val fromDupPtr : int -> non_opt out_p -> t from_p
        val copyPtr    : 'a tabulator -> int -> non_opt out_p -> 'a from_p

        val fromOptPtr    : int -> opt out_p -> t option from_p
        val fromDupOptPtr : int -> opt out_p -> t option from_p
        val copyOptPtr    : 'a tabulator -> int -> opt out_p -> 'a option from_p

        (**
         * Value parameters
         *
         * The type `'a in_p` is the FFI type for a pointer to a C array
         * passed by value to a C function.  The phantom type parameter 'a
         * indicates whether the pointer is an optional pointer or a
         * non-optional pointer, as for type `'a out_p` above.  By specifying
         * `'a` as `non_opt`, wrapper functions that derive a pointer
         * argument from a `t option` value cannot be used, ensuring that the
         * pointer is not treated as an optional pointer.
         *
         * Note
         *
         *   The implementation of type `'a in_p` is not necessarily just a
         *   pointer because an implementation may need to pass multiple
         *   arguments that are transformed by C side interface code.
         *
         * `withPtr f arr` ...
         *
         *
         * `withDupPtr depth f arr` ...
         *
         *
         * `withOptPtr f optArr` ...
         *
         *
         * `withDupOptPtr depth f optArr` ...
         *
         *   The C function `f` must return an allocated array whose
         *   ownership, i.e. responsibility for freeing, is transferred.
         *
         *
         * Considerations
         *
         * ...
         *)
        type 'a in_p

        val withPtr    : (non_opt in_p -> 'r) -> t -> 'r
        val withDupPtr : int -> (non_opt in_p -> 'r) -> t -> (non_opt out_p, 'r) pair

        val withOptPtr    : (opt in_p -> 'r) -> t option -> 'r
        val withDupOptPtr : int -> (opt in_p -> 'r) -> t option -> (opt out_p, 'r) pair

        (**
         * Reference parameters
         *
         * The type `('in, 'out) r` is the FFI type for a pointer to a
         * C array passed by reference to a C function.  The phantom type
         * parameters `'in` and `'out` indicate whether the imported and
         * exported pointer, respectively, is an optional pointer or a
         * non-optional pointer, as for types `'a in_p` and `'a out_p` above.
         * By specifying `'in` as `non_opt`, wrapper functions that derive an
         * imported pointer value from a `t option` value cannot be used,
         * which ensures that the imported pointer is non-optional.  The
         * wrapper functions return the exported pointer as type `'out p` for
         * use with the return value wrapper functions above.
         *
         * Note
         *
         *   The implementation of type `('a, 'b) r` is not necessarily
         *   just a pointer because an implementation may need to pass
         *   multiple arguments that are transformed by C side interface
         *   code.
         *
         * `withNullRef f ()` ...
         *
         *
         * `withRefPtr f arr` ...
         *
         *
         * `withRefDupPtr depth f arr` ...
         *
         *
         * `withRefOptPtr f optArr` ...
         *
         *
         * `withRefDupOptPtr depth f optArr` ...
         *
         *
         * Considerations
         *
         * For `withRefPtr f cArr` with result `(p, _)`, when `f` does not
         * update the reference, `p` is a pointer to `cArr`.  In such cases,
         * `p` should be ignored.  For some implementations, `p` may even be
         * an unreliable pointer, for example, a pointer into the SML heap.
         *)
        type ('a, 'b) r

        val withNullRef : (('a, 'b) r -> 'r) -> unit -> 'r

        val withRefPtr    : ((non_opt, 'b) r -> 'r) -> t -> ('b out_p, 'r) pair
        val withRefDupPtr : int -> ((non_opt, 'b) r -> 'r) -> t -> ('b out_p, 'r) pair

        val withRefOptPtr    : ((opt, 'b) r -> 'r) -> t option -> ('b out_p, 'r) pair
        val withRefDupOptPtr : int -> ((opt, 'b) r -> 'r) -> t option -> ('b out_p, 'r) pair
      end
  end
