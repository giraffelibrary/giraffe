(* Copyright (C) 2012 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

signature POINTER =
  sig
    (**
     * The type `'a t` respresents pointers.  The type parameter is a
     * placeholder for a phantom type to indicate whether the pointer is an
     * optionally-null pointer or a non-null pointer as follows:
     *
     *   `unit t`       optionally-null pointer
     *   `notnull t`    non-null pointer (see type `notnull` below)
     *
     * It rarely makes sense for a function to have a parameter of type
     * `unit t` because this requires a optionally-null pointer but does not
     * allow a non-null pointer.  Thus functions would typically use the type
     * `'a t` for pointer parameters that can be null.  One scenario in which
     * `unit t` may be desirable for a function parameter is when there is a
     * corresponding function with a parameter of type `notnull t`.  This
     * ensures a particular function is called depending on the null-ness of
     * the pointer argument, which may have advantages, e.g. efficiency.
     *)
    type 'a t

    (**
     * `eq` is an equality test on pointers.
     *)
    val eq : 'a t * 'b t -> bool

    (**
     * `null` is the null pointer.  `isNull` tests for the null pointer.  The
     * exception `Null` should be raised by any function that would otherwise
     * dereference a null pointer.
     *)
    val null : unit t
    val isNull : 'a t -> bool
    exception Null

    (**
     * The type `notnull` is a phantom type used to indicate that a pointer
     * is not null.  The only way to construct the type `notnull t` is via
     * the function `toNotNull`.
     *
     * `toNotNull` converts a pointer to a non-null pointer by returning the
     * pointer if it is not null and raising `Null` otherwise.
     *
     * If the type `notnull t` is used for the return value or reference
     * parameter of a foreign function, extreme caution should be taken to
     * ensure that a `notnull t` value really is a non-null pointer.
     *)
    type notnull
    val toNotNull : 'a t -> notnull t

    (**
     * `toOptNull` casts any pointer to a optionally-null pointer.  In an
     * implementation, this should simply be the identity function.
     *)
    val toOptNull : 'a t -> unit t

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
    val toOpt : 'a t -> notnull t option
    val fromOpt : 'a t option -> unit t

    (**
     * `add (p, w)` returns the pointer `w` bytes after the pointer `p`.
     * `sub (p, w)` returns the pointer `w` bytes before the pointer `p`.
     *)
    val add : 'a t * word -> unit t
    val sub : 'a t * word -> unit t
  end
