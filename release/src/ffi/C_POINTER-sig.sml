(* Copyright (C) 2012-2020 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

signature C_POINTER =
  sig
    (**
     * The type `'a p` respresents a C pointer.  The type parameter is a
     * placeholder for a phantom type that determines whether the pointer is
     * an optional pointer, where the null value represents no value, or a
     * non-optional pointer as follows:
     *
     *   `opt p`       optional pointer
     *   `non_opt p`   non-optional pointer
     *
     * Note that null can be a valid value for a non-optional pointer.  For
     * example, malloc returns a non-optional pointer but the function in the
     * C standard library may return null if the number of bytes to allocate
     * is zero.  In this case, null is fine because the pointer would never
     * be dereferenced as there are no bytes to dereference.
     *
     * The types `opt` and `non_opt` are the phantom type used to indicate
     * that a pointer is optional and non-optional, respectively.
     *)
    eqtype 'a p
    eqtype opt
    eqtype non_opt

    (**
     * The type `t` is an abbreviation for a non-optional pointer.
     *)
    type t = non_opt p

    (**
     * `eq` is an equality test on pointers that may be of different types.
     * (The built-in equality provides a test on pointers of the same type.)
     *)
    val eq : 'a p * 'b p -> bool

    (**
     * `null` is the null pointer which can be treated as either an optional
     * or a non-optional pointer.  `isNull` tests whether an optional or
     * non-optional pointer is null.  The exception `Null` should be raised
     * by any function that requires a null optional pointer to be treated as
     * a null non-optional pointer or vice-versa.
     *)
    val null : 'a p
    val isNull : 'a p -> bool
    exception Null

    (**
     * `toNonOptPtr` and `toOptPtr` convert between an optional pointer and a
     * non-optional pointer.  Both functions return the pointer unchanged if
     * it is not null and raise `Null` otherwise.
     *)
    val toNonOptPtr : 'a p -> t
    val toOptPtr : 'a p -> opt p

    (**
     * `toOpt` and `fromOpt` convert between an optional pointer and an
     * option value where the value is a non-optional pointer.
     *
     * These functions can be defined in terms of other member of this
     * signature as follows:
     *
     *   fun toOpt p = SOME (toNonOptPtr p) handle Null => NONE
     *   val fromOpt = fn NONE => null | SOME p => toOptPtr p
     *)
    val toOpt : opt p -> t option
    val fromOpt : t option -> opt p

    (**
     * `mapNonNullPtr f p` maps the function `f` on non-optional pointers to
     * the pointer `p` if it is not null.  `f` can assume that its argument
     * is non-null.  `Null` is raised if `f p` returns null.
     *)
    val mapNonNullPtr : (t -> t) -> 'a p -> 'a p

    (**
     * `appOptPtr f p` applies the function `f` on non-optional pointers to
     * the pointer `p` if it is not null.  `f` can assume that its argument
     * is non-null.
     *)
    val appNonNullPtr : (t -> unit) -> 'a p -> unit

    (**
     * These functions convert a pointer to a string representation of its
     * numeric value.
     *
     * `fmt radix p` returns a string containing the digits in base `radix`.
     * `toString p` returns a string containing the hexadecimal digits, with
     * prefix "0x".  `toOptString p` returns "NULL" if `p` is null and
     * otherwise returns `toString p`.
     *)
    val fmt : StringCvt.radix -> 'a p -> string
    val toString : non_opt p -> string
    val toOptString : opt p -> string

    (**
     * C memory operations on a pointer
     *)
    structure Memory : C_MEMORY where type Pointer.t = non_opt p

    (**
     * C value types based on a pointer
     *)
    structure ValueType :
      C_VALUE_EQ_TYPE
        where type t = non_opt p
        where type v = non_opt p

    structure OptValueType :
      C_VALUE_EQ_NULL_TYPE
        where type t = opt p
        where type v = opt p

    (**
     * Support for constructing a high-level FFI based on a pointer
     *
     * The type `('in, 'out) r` represents a reference to a C pointer.  The
     * type parameter `'in` is a placeholder for a phantom type to indicate
     * whether the pointer stored to a reference is an optional pointer or a
     * non-optional pointer as follows:
     *
     *   `opt`          optional pointer
     *   `non_opt`      non-optional pointer
     *
     * Similarly, the type parameter `'out` indicates whether the pointer
     * loaded from a reference is an optional pointer or a non-optional
     * pointer.
     *)
    type ('in, 'out) r

    val fromVal    : non_opt p -> t
    val fromOptVal : opt p     -> t option

    val withVal    : (non_opt p -> 'a) -> t        -> 'a
    val withOptVal : (opt p     -> 'a) -> t option -> 'a

    val withNullRef   : (('a,      'b) r -> 'c) -> unit     -> 'c
    val withRefVal    : ((non_opt, 'a) r -> 'b) -> t        -> ('a p, 'b) pair
    val withRefOptVal : ((opt,     'a) r -> 'b) -> t option -> ('a p, 'b) pair
  end
