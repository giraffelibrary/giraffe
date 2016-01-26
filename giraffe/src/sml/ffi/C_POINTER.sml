(* Copyright (C) 2012, 2016 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

signature C_POINTER =
  sig
    (**
     * The type `'a p` respresents a C pointer.  The type parameter is a
     * placeholder for a phantom type to indicate whether the pointer is an
     * optionally-null pointer or a non-null pointer as follows:
     *
     *   `unit p`       optionally-null pointer
     *   `notnull p`    non-null pointer (see type `notnull` below)
     *
     * It rarely makes sense for a function to have a parameter of type
     * `unit p` because this requires a optionally-null pointer but does not
     * allow a non-null pointer.  Thus functions would typically use the type
     * `'a p` for pointer parameters that can be null.  One scenario in which
     * `unit p` may be desirable for a function parameter is when there is a
     * corresponding function with a parameter of type `notnull p`.  This
     * ensures a particular function is called depending on the null-ness of
     * the pointer argument, which may have advantages, e.g. efficiency.
     *
     * If the type `notnull p` is used for the return value or reference
     * parameter of a foreign function, care should be taken to ensure that
     * a `notnull p` value really is a non-null pointer.
     *)
    eqtype 'a p

    (**
     * The type `notnull` is the phantom type used to indicate that a pointer
     * is not null.  The only way to construct the type `notnull p` is via
     * the function `toNotNull`.
     *
     * The type `t` is an abbreviation for a non-null pointer.
     *)
    type notnull
    type t = notnull p

    (**
     * `eq` is an equality test on pointers.
     *)
    val eq : 'a p * 'b p -> bool

    (**
     * `null` is the null pointer.  `isNull` tests for the null pointer.  The
     * exception `Null` should be raised by any function that would otherwise
     * dereference a null pointer.
     *)
    val null : unit p
    val isNull : 'a p -> bool
    exception Null

    (**
     * `toNotNull` converts a pointer to a non-null pointer by returning the
     * pointer if it is not null and raising `Null` otherwise.  `fromNotNull`
     * converts a non-null pointer to any type of pointer.
     *)
    val toNotNull : 'a p -> notnull p
    val fromNotNull : notnull p -> 'a p

    (**
     * `toOptNull` casts any pointer to a optionally-null pointer.  In an
     * implementation, this should simply be the identity function.
     *)
    val toOptNull : 'a p -> unit p

    (**
     * `toOpt` and `fromOpt` convert between optionally-null pointers and
     * optional pointers.  When `toOpt` returns `SOME p`, the return type
     * indicates that `p` is a non-null pointer.
     *
     * These functions can be defined in terms of other member of this
     * signature as follows:
     *
     *   fun toOpt p = SOME (toNotNull p) handle Null => NONE
     *   val fromOpt = fn NONE => null | SOME x => x
     *)
    val toOpt : 'a p -> notnull p option
    val fromOpt : 'a p option -> unit p

    (**
     * `mapOpt f p` and `appOpt f p` apply the function `f` on a non-null
     * pointer to any pointer `p`.  `f` is applied only in the case that `p`
     * is not null.  `mapOpt` cannot be defined in terms of other functions
     * in this signature.
     *)
    val mapOpt : (notnull p -> notnull p) -> 'a p -> 'a p
    val appOpt : (notnull p -> unit) -> 'a p -> unit

    (**
     * `add (p, w)` returns a pointer `w` bytes after `p`.
     * `sub (p, w)` returns a pointer `w` bytes before `p`.
     *)
    val add : 'a p * word -> 'a p
    val sub : 'a p * word -> 'a p

    (**
     * The type `('in, 'out) r` respresents a reference to a C pointer.  The
     * type parameter `'in` is a placeholder for a phantom type to indicate
     * whether the pointer stored to a reference is an optionally-null
     * pointer or a non-null pointer as follows:
     *
     *   `unit p`       optionally-null pointer
     *   `notnull p`    non-null pointer
     *
     * Similarly, the type parameter `'out` indicates whether the pointer
     * loaded from a reference is an optionally-null pointer or a non-null
     * pointer but /this is assumed/ and, therefore, /reading a pointer from
     * a reference does not preserve null-type-safety/.
     *)
    type ('in, 'out) r

    (**
     * Support for using a pointer value in the high-level FFI.
     *)
    val fromVal    : notnull p -> t
    val fromOptVal : 'a p      -> t option

    val withVal    : ('a p   -> 'b) -> t        -> 'b
    val withOptVal : (unit p -> 'a) -> t option -> 'a

    val withNullRef   : (('a, 'b) r   -> 'c) -> unit     -> 'c
    val withRefVal    : (('a, 'b) r   -> 'c) -> t        -> ('b p, 'c) pair
    val withRefOptVal : ((unit, 'a) r -> 'b) -> t option -> ('a p, 'b) pair

    (**
     * C type representation of a pointer
     *)
    structure NotNullType : C_TYPE where type t = notnull p
    structure OptNullType : C_TYPE where type t = unit p
  end
