(* Copyright (C) 2013, 2016-2020 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

signature G_LIB_ERROR_RECORD =
  sig
    include RECORD
    val t : (t, t) ValueAccessor.t
    val tOpt : (t option, t option) ValueAccessor.t

    type quark_t
    val domain : {get : t -> quark_t}
    val code : {get : t -> LargeInt.int}
    val message : {get : t -> string}

    (**
     * The exception Error is raised for any GLib (or derived library)
     * function that reports an error.  In `Error (dom, err)`
     *
     *   `dom` is an exception value that represents the error domain
     *     and code that can be pattern matched in exception handlers;
     *
     *   `err` is the underlying error record from which the error
     *     message can be extracted.
     *
     * `dom` has type `exn` to allow the set of constructors to be extended
     * arbitrarily for the error domain of each module.  `dom` itself should
     * never be raised.
     *
     * In the case of an error whose domain is not recognised, `dom` is
     * `Fail "unknown domain"`.  For an error whose code is not recognized,
     * `dom` is `Fail "unknown code"`,  However, applications should not
     * handle these explicitly.
     *
     *   Rationale
     *
     *   This representation of error exceptions is motivated by the
     *   possibility of needing to return an error from SML to C at some
     *   point in future: all Glib errors, can be caught (for any possible
     *   library extension) and sufficient information is available to
     *   reconstruct a Glib error structure.
     *
     *)
    exception Error of exn * t

    (**
     * A handler is used to convert an error to an exception for a particular
     * error domain.  `makeHandler (domain, fromVal, domainExn)` creates a
     * handler where
     *
     *   `domain` is the string that identifes an error domain;
     *   typically this has the form "<namespace>-<module-name>-error-quark";
     *
     *   `fromVal` converts the error code to the enum type of the domain;
     *
     *   `domainExn` is the exception constructor for the error domain.
     *
     *)
    type handler
    val handleError : ((FFI.opt, FFI.opt) FFI.r -> 'a) -> handler list -> 'a

    val makeHandler : string * (GInt.FFI.val_ -> 'a) * ('a -> exn) -> handler
  end
