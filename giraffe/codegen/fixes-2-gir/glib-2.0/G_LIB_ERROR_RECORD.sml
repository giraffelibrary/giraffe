signature G_LIB_ERROR_RECORD =
  sig
    include RECORD
    val t : (t, t) GObject.Value.accessor
    val tOpt : (t option, t option) GObject.Value.accessor

    type quark_t
    val domain : {get : t -> quark_t}
    val code : {get : t -> Int32.int}
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
    val handleError : ((unit, unit) C.r -> 'a) -> handler list -> 'a

    val makeHandler : string * (FFI.Enum.C.val_ -> 'a) * ('a -> exn) -> handler
  end
