(* Copyright (C) 2012, 2016-2021 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

(**
 * The signature C_ARRAY specifies the interface to a C array and its high-
 * level FFI.  The array is mutable or immutable according to the
 * implementation of the type `'a update`.
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
     * `get t i` gets the element at (zero-based) index `i` of `t`.  It
     * raises `Subscript` if `i < 0` or `length t <= i`.  Note, therefore,
     * that `i` cannot index a null terminator if `t` is a null-terminated
     * array.
     *
     * `sub (t, i)` is equivalent to `get t i`.
     *)
    val get : t -> int -> elem
    val sub : t * int -> elem

    (**
     * The type `'a update` is implemented by
     *   - `unit` for a mutable array
     *   - `'a `  for an immutable array
     *
     * For a mutable array, `set t (i, e)` modifies `t` by replacing the
     * element at (zero-based) index `i` with `e`.  For an immutable array,
     * `set t (i, e)` returns a copy of `t` with the element at (zero-based)
     * index `i` replaced by `e`.  In either case, `set t (i, e)` raises
     * `Subscript` if `i < 0` or `length t <= i`.  Otherwise, it raises
     * `Null` if `t` is a null-terminated array and `e` is the null value.
     * Note, therefore, that `i` cannot index a null terminator and `e`
     * cannot equal the null value if `t` is a null-terminated array.
     *
     * `update (t, i, e)` is equivalent to `set t (i, e)`.
     *)
    type 'a update
    val set : t -> int * elem -> t update
    val update : t * int * elem -> t update

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

        type 'a from_p

        structure PointerType :
          C_POINTER_TYPE
            where type t = sequence
            where type opt = opt
            where type non_opt = non_opt
            where type 'a p = 'a p
            where type 'a from_p = 'a from_p

        type e

        structure ArrayType :
          C_ARRAY_TYPE
            where type t = sequence
            where type elem = elem
            where type e = e
            where type opt = opt
            where type non_opt = non_opt
            where type 'a p = 'a p
            where type 'a from_p = 'a from_p

        val takePtr : non_opt p -> t from_p
        val giveDupPtr : (non_opt p -> 'a) from_p -> t -> 'a
        val touchPtr : t -> unit
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
        type 'a p = 'a C.p

        (**
         * Reference a C array to ensure that a pointer it still available.
         *)
        val touchPtr    : t        -> unit
        val touchOptPtr : t option -> unit

        (* A pointer returned from a function may not, on its own, be enough
         * to read the array, in particular, the C array may not contain any
         * information about its size.  For example, a C string may not be
         * null-terminated.
         *
         * The type `'a from_p` captures any addiional arguments needed to
         * read an array from a pointer.  For example, an implementation that
         * requires the size of the array would define
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

        (**
         * Return values
         *
         * The type `'a out_p` is the FFI type for a pointer to a C array
         * returned by a C function, either as the return value or 'exported'
         * from a reference parameter.  `opt out_p` and `non_opt out_p`
         * represent an optional and non-optional pointer, respectively.
         *)
        type 'a out_p = 'a p

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
         * `from[Opt]Ptr d` should be used to duplicate the top `d` levels
         * or `copyPtr tab d` should be used to copy the whole array using
         * the tabulator `tab` and free the top `d` levels.
         *)
        type 'a tabulator = int * (int -> elem) -> 'a

        val fromPtr    :                 int -> non_opt out_p -> t        from_p
        val fromOptPtr :                 int -> opt     out_p -> t option from_p
        val copyPtr    : 'a tabulator -> int -> non_opt out_p -> 'a        from_p
        val copyOptPtr : 'a tabulator -> int -> opt     out_p -> 'a option from_p

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
         * `withPtr depth f arr` ...
         *
         *
         * `withDupPtr depth f arr` ...
         *
         *
         * `withOptPtr depth f optArr` ...
         *
         *
         * `withDupOptPtr depth f optArr` ...
         *
         *
         * `withNewPtr f n` ...
         *
         *
         * Considerations
         *
         * ...
         *)
        type 'a in_p

        val withPtr    : int -> (non_opt in_p -> 'r) -> t        -> 'r
        val withOptPtr : int -> (opt     in_p -> 'r) -> t option -> 'r

        val withDupPtr    : int -> (non_opt in_p -> 'r) -> t        -> (non_opt out_p, 'r) pair
        val withDupOptPtr : int -> (opt     in_p -> 'r) -> t option -> (opt     out_p, 'r) pair

        val withNewPtr : (non_opt in_p -> 'r) -> int -> (non_opt out_p, 'r) pair

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
         * `withRefPtr depth f arr` ...
         *
         *
         * `withRefOptPtr depth f optArr` ...
         *
         *
         * Considerations
         *
         * For `withRefPtr 0 f cArr` with result `(p, _)`, when `f` does not
         * update the reference, `p` is a pointer to `cArr`.  In such cases,
         * `p` should be ignored.  For some implementations, `p` may even be
         * an unreliable pointer, for example, a pointer into the SML heap.
         *)
        type ('a, 'b) r

        val withNullRef : (('a, 'b) r -> 'r) -> unit -> 'r

        val withRefPtr : int -> ((non_opt, 'b) r -> 'r) -> t -> ('b out_p, 'r) pair
        val withRefOptPtr : int -> ((opt, 'b) r -> 'r) -> t option -> ('b out_p, 'r) pair
      end
  end
