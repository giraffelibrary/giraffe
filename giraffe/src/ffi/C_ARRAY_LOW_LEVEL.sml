(* Copyright (C) 2012, 2016-2017 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

(**
 * The signature C_ARRAY_LOW_LEVEL is an extension of C_ARRAY that introduces
 * the type `vector` to provide a separate view of the type `t`.  This allows
 * the type `t` to be abstract, in particular, allowing it to refer to arrays
 * in the C heap.  It would be advantageous for such a type `t` to be used in
 * the bindings to C functions because it allows an array returned by one
 * function to be passed to another without conversion via SML types.  However
 * this is problematic for at least two reasons:
 *
 *  1. It is too clunky for application code to have to convert between
 *     the two views explicitly.  For example, a C character array could
 *     not be used as an SML string: it must be converted explicitly.
 *     (Perhaps the proposed view types of SuccessorML could help in this
 *     respect?)
 *
 *  2. The signature of a module that specifies a C function binding would
 *     need to refer to the abstract array type 't' for the array type of
 *     any parameters or the return value that is a C array.  Therefore
 *     the structure that implements C_ARRAY_INTERNAL must be declared
 *     before the signature.  The problem is where to declare it.  This
 *     structure cannot be declared premptively in the namespace that
 *     introduces the element type because this would introduce a huge
 *     numbers of structures just in case they are required - arrays of
 *     arrays etc.  The structure cannot be declared by the library that
 *     requires it either because two different libraries would construct
 *     two separate versions, which will have different types.  (Functor
 *     application is generative, not applicative.)  Code generated for one
 *     library must be independent of code generated for another library.
 *     (Perhaps the proposed type class of SuccessorML could help in this
 *     respect?)
 *
 * Given these issues, the specification of a function binding in a signature
 * uses a Basis Library sequence type (list or vector) and each structure
 * that implements the signature declares local structures that implement
 * C_ARRAY for the required C array types.
 *
 * The functors that create structure that implement C_ARRAY internally
 * create a structure that implements C_ARRAY_LOW_LEVEL which proides a low-
 * level C array interface.
 *)
signature C_ARRAY_LOW_LEVEL =
  sig
    include C_ARRAY

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
     * `sub t i` returns the element at (zero-based) index `i` of `t`.  It
     * raises `Subscript` if `i < 0` or `length t <= i`.  Note, therefore,
     * that `i` cannot index a null terminator if one is present in the
     * internal representation.
     *)
    val sub : t -> int -> elem

    (**
     * The structure Vector provides vector operations for the types `vector`
     * and `elem`.
     *)
  end
