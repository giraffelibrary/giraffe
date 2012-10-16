(**
 * The signature C_ARRAY defines higher-level FFI support for null-terminated
 * C arrays such as character arrays, i.e. C strings, or arrays of C strings.
 *
 * Overview
 *
 * Conceptually, this signature describes a layer on top of an existing FFI.
 * In concrete terms, it defines functions that wrap the usual SML foreign
 * function bindings.  This approach does not limit the existing FFI except
 * that it requires specific FFI types to be used for C arrays.
 *
 * Use of this higher-level FFI support
 *
 *   - simplifies the FFI for C arrays by hiding details relating to
 *     memory allocation, null termination and use of optionally-null
 *     C pointers for optional arrays;
 *
 *   - can reduce conversion overhead between C arrays and SML values
 *     by providing an abstract type for C arrays, and
 *
 *   - reduces compiler-specific code.
 *
 * Synopsis
 *
 * The C_ARRAY signature defines a type `t` that represents C arrays.
 * More precisely, the type `t` represents arrays that can be used directly
 * by C functions.  Thus a value of type `t` could be held in the SML heap
 * if the FFI mechanism allows the value to be used directly by a C function.
 * Type `t` has the characteristics of a non-null pointer and the type
 * `t option` is used to represent an optionally-null pointer with `NONE`
 * representing the null pointer.  This supports the common idiom of C where
 * an optional array is represented by using the null pointer to indicate no
 * array.
 *
 * Functions are provided for converting between C and SML vectors.  As SML
 * vectors are more suitable for vector manipulation, minimal operations are
 * provided for C arrays: just `length` and `sub` to support tabulation using
 * functions such as `List.tabulate`.
 *
 * Wrapping foreign functions
 *
 * The structure C contains the wrapper functions that provide the higher-
 * level FFI support and the types that must be used in FFI type signatures.
 * These wrapper functions construct higher-level foreign functions whose
 * signatures have type `t` for arrays.  Typically, the type `t` is present
 * in the interface of these higher-level foreign functions.  The functions
 * `toVector` and `fromVector` (outside the structure C) would be used by
 * applications to convert to and from SML vector values where required.
 * Using type `t` rather than `vector` enables conversion between `t` and
 * `vector` to be minimized which, for some implementations, avoids
 * unnecesary internal copying.  However, in some cases, it makes sense for
 * a library to use type `vector` rather than type `t` in the interface of a
 * high-level function, for example when `vector` is `CharVector.vector`,
 * i.e. `string`.  This is done by further wrapping with the functions to
 * convert between `vector` and `t` as described.
 *
 * Mutability
 *
 * Each structure that implements this siganture can choose whether type `t`
 * is mutable.  If type `t` is not mutable, then the functions `withPtr` and
 * `withRefPtr` are pointless because they cannot be used.  In such
 * implementations, stubs should be provided for `withPtr` and `withRefPtr`
 * that raise the exception `Fail "mutable arguments are not supported"`.
 *
 * If type `t` is mutable, whether its mutability is exposed to applications
 * is a separate question and is determined by the choice of wrapper
 * functions: using `withPtr` to wrap a C function parameter that is modified
 * will expose mutability whereas using `withDupPtr` to wrap it will hide
 * mutability.
 *
 * If mutability is to be hidden, the wrapper function `withPtr` should
 * never be used: either the parameter is not modified, in which case
 * `withConstPtr` is used or the parameter is modified, in which case
 * `withDupPtr` is used.  Similarly `withRefPtr` should never be used: either
 * `withRefConstPtr` or `withRefDupPtr` should be used.
 *
 * Implementation notes
 *
 * The ability to implement this signature is heavily dependent on the
 * FFI capabilities of the target SML interpreter/compiler.  Notably, there
 * must be support for finalizable values, i.e. a hook into the garbage
 * collector to allow a user-defined function to be run just before an SML
 * value is garbage collected.  (This is used to free memory allocated for
 * strings in C.)
 *)
signature C_ARRAY =
  sig
    (**
     * The type `t` represents a C array, for example, a C character array
     * (i.e. C string) or a C string array.  More precisely, the type `t`
     * represents arrays that can be used directly by C functions.
     *)
    type t

    (**
     * Conversion between SML values and C arrays.
     *
     * The type `vector` represents array values in SML.
     *
     * When the elements of the SML vector can represent the null terminator
     * value, `fromVector v` returns the C array that is the longest prefix
     * of `v` not containing a null terminator.  For example, for a character
     * array, i.e. where type `vector` is `string`, we would have:
     *
     *   toVector (fromVector "a\000bc") = "a"
     *   toVector (fromVector "\000abc") = ""
     *
     *)
    type vector
    val fromVector : vector -> t
    val toVector : t -> vector

    (**
     * `length t` returns the length of `t` (excluding any null terminator
     * that may be present in the internal representation).
     *)
    val length : t -> int

    (**
     * The type `elem` represents array element values in SML.  This is not
     * necessarily the same type as elements of `vector`, that is to say,
     * `elem` is not necessarily the type returned by the subscript operation
     * on the type `vector`.  The type `elem` is likely to be determined by
     * the element type required when using `length` and `sub` with a
     * tabulation function, e.g. `List.tabulate`.
     *
     * `sub t i` returns the element at (zero-based) index `i` of `t`.  It
     * raises `Subscript` if `i < 0` or `length t <= i`.  Note, therefore,
     * that `i` cannot index a null terminator if one is present in the
     * internal representation.
     *)
    type elem
    val sub : t -> int -> elem

    (**
     * The structure C provides the wrapper functions and FFI types.
     *
     * Support for particular FFI mechanisms may be provided in additional
     * structures with platform-specific names.
     *)
    structure C :
      sig
        type notnull

        (**
         * Return values
         *
         * The type `'a out_p` is the FFI type for a pointer to a C array
         * returned by a C function, either as the return value or 'exported'
         * from a reference parameter.  `unit out_p` and `notnull out_p`
         * represent an optionally-null and non-null pointer, respectively.
         *
         * Note
         *
         *   Bindings to foreign functions that return a pointer to an array
         *   _must_ apply a type constraint to ensure that the return type is
         *   either `unit out_p` or `notnull out_p`.  Failure to do this can
         *   result can result in the function's context inferring
         *   `notnull out_p`, even though a function could return a null
         *   pointer.  Furthermore, functions that return an optionally-null
         *   pointer should still be constrained to `unit out_p` as it is
         *   good practice and, otherwise, under certain circumstances,
         *   warnings will be generated by the compiler indicating that a
         *   polymorphic type has been fixed, e.g. `'a` fixed as `_a`, and a
         *   subsequent type error will occur.  However, these compiler
         *   warnings/errors are not a reliable means of detecting missing
         *   type contraints.
         *
         * Note
         *
         *   The implementation of type `'a out_p` is not necessarily just a
         *   pointer because an implementation may need to pass multiple
         *   arguments that are transformed by C side interface code.
         *
         *
         * A C array returned by a C function is wrapped according to
         *   - whether the caller must free the C array;
         *   - the persistence of the C array.
         *
         * When a returned C array is either
         *   - static or
         *   - an allocated array that must be freed by the caller
         * the C array will be in memory for as long as necessary.  In these
         * cases, `from[Opt]Ptr` and `fromNew[Opt]Ptr`, respectively,
         * should be used.  In other cases, keeping a reference to the
         * C array may be unreliable so `copy[New][Opt]Ptr[To...]` should
         * be used to take a copy immediately.
         *
         * `copy[...]ToTabulated` functions are provided to allow a non-
         * vector data structure to be constructed directly rather than going
         * via a vector.
         *)
        structure OutPointer : POINTER where type notnull = notnull
        type 'a out_p = 'a OutPointer.t

        val fromPtr               : notnull out_p -> t
        val fromNewPtr            : notnull out_p -> t
        val copyPtr               : notnull out_p -> t
        val copyNewPtr            : notnull out_p -> t
        val copyPtrToVector       : notnull out_p -> vector
        val copyNewPtrToVector    : notnull out_p -> vector

        type 'a tabulator = int * (int -> elem) -> 'a
        val copyPtrToTabulated    : 'a tabulator -> notnull out_p -> 'a
        val copyNewPtrToTabulated : 'a tabulator -> notnull out_p -> 'a

        val fromOptPtr               : 'a out_p -> t option
        val fromNewOptPtr            : 'a out_p -> t option
        val copyOptPtr               : 'a out_p -> t option
        val copyNewOptPtr            : 'a out_p -> t option
        val copyOptPtrToVector       : 'a out_p -> vector option
        val copyNewOptPtrToVector    : 'a out_p -> vector option
        val copyOptPtrToTabulated    : 'a tabulator -> 'b out_p -> 'a option
        val copyNewOptPtrToTabulated : 'a tabulator -> 'b out_p -> 'a option

        (**
         * Value parameters
         *
         * The type `'a in_p` is the FFI type for a pointer to a C array
         * passed by value to a C function.  The phantom type parameter 'a
         * indicates whether the pointer is an optionally-null pointer or a
         * non-null pointer, as for type `'a out_p` above.  By specifying
         * `'a` as `notnull`, wrapper functions that derive a pointer
         * argument from a `t option` value cannot be used, ensuring that the
         * pointer is non-null.
         *
         * Note
         *
         *   The implementation of type `'a in_p` is not necessarily just a
         *   pointer because an implementation may need to pass multiple
         *   arguments that are transformed by C side interface code.
         *
         * `withPtr f cArr` ...
         *
         *
         * `withConstPtr f cArr` ...
         *
         *
         * `withDupPtr f cArr` ...
         *
         *
         * `withOptPtr f cArr` ...
         *
         *
         * `withConstOptPtr f cArr` ...
         *
         *
         * `withDupOptPtr f cArr` ...
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

        val withPtr      : ('a in_p -> 'r) -> t -> 'r
        val withConstPtr : ('a in_p -> 'r) -> t -> 'r
        val withDupPtr   : ('a in_p -> 'r) -> t -> (notnull out_p, 'r) pair

        val withOptPtr      : (unit in_p -> 'r) -> t option -> 'r
        val withConstOptPtr : (unit in_p -> 'r) -> t option -> 'r
        val withDupOptPtr   : (unit in_p -> 'r) -> t option -> (unit out_p, 'r) pair

        (**
         * Reference parameters
         *
         * The type `('in, 'out) r` is the FFI type for a pointer to a
         * C array passed by reference to a C function.  The phantom type
         * parameters `'in` and `'out` indicate whether the imported and
         * exported pointer, respectively, is an optionally-null pointer or
         * a non-null pointer, as for types `'a in_p` and `'a out_p` above.
         * By specifying `'in` as `notnull`, wrapper functions that derive an
         * imported pointer value from a `t option` value cannot be used,
         * which ensures that the imported pointer is non-null.  The wrapper
         * functions return the exported pointer as type `'out p` for use
         * with the return value wrapper functions above.
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
         * `withRefPtr f cArr` ...
         *
         *
         * `withRefConstPtr f cArr` ...
         *
         *
         * `withRefDupPtr f cArr` ...
         *
         *
         * `withRefOptPtr f cArr` ...
         *
         *
         * `withRefConstOptPtr f cArr` ...
         *
         *
         * `withRefDupOptPtr f cArr` ...
         *
         *   The C function `f` must return an allocated array whose
         *   ownership, i.e. responsibility for freeing, is transferred.
         *
         *
         * Considerations
         *
         * For `withRefPtr f cArr` or `withRefConstPtr f cArr` with
         * result `(p, _)`, when `f` does not update the reference, `p` is a
         * pointer to `cArr`.  In such cases, `p` should be ignored.  For
         * some implementations, `p` may even be an unreliable pointer, for
         * example, a pointer into the SML heap.
         *)
        type ('a, 'b) r

        val withNullRef : (('a, 'b) r -> 'r) -> unit -> 'r

        val withRefPtr      : (('a, 'b) r -> 'r) -> t -> ('b out_p, 'r) pair
        val withRefConstPtr : (('a, 'b) r -> 'r) -> t -> ('b out_p, 'r) pair
        val withRefDupPtr   : (('a, 'b) r -> 'r) -> t -> ('b out_p, 'r) pair

        val withRefOptPtr      : ((unit, 'b) r -> 'r) -> t option -> ('b out_p, 'r) pair
        val withRefConstOptPtr : ((unit, 'b) r -> 'r) -> t option -> ('b out_p, 'r) pair
        val withRefDupOptPtr   : ((unit, 'b) r -> 'r) -> t option -> ('b out_p, 'r) pair
      end
  end
