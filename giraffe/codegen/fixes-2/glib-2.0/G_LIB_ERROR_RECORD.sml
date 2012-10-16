signature G_LIB_ERROR_RECORD =
  sig
    type t

    (**
     * The exception Error is raised for any GLib (or derived library)
     * function that reports an error.  For `Error (dom, err)`
     *
     *   `dom` is an abstract representation of error's domain that
     *     can be pattern matched in exception handlers and
     *
     *   `err` is the underlying error structure from which the error
     *     message can be extracted.
     *
     * `dom` has type `exn` to allow the set of constructors to be extended
     * arbitrarily for the error domain of each module.  `dom` itself should
     * never be raised.
     *
     * In the case of an error whose domain is not recognised, `dom` is
     * `Fail "unknown domain"`.  For an error whose code is not recognized,
     * `dom` is `Fail "unknown code",  However, applications should not
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

    type quark_t
    val domain : {get : t -> quark_t}
    val code : {get : t -> FFI.Enum.val_}
    val message : {get : t -> string}

    (**
     * A handler is used to convert an error to an exception for a particular
     * error domain.  The type `handler` represents a handler and has the
     * form `(domain, makeDomainExn)` where
     *
     *   `domain` is the string that identifes an error domain;
     *   typically this has the form "<namespace>-<module-name>-error-quark";
     *
     *   `makeDomainExn` is the exception constructor for the error domain.
     *
     *)
    type handler
    val makeHandler : string * (FFI.Enum.val_ -> 'a) * ('a -> exn) -> handler

    structure C :
      sig
        type notnull
        type 'a p
        type ('a, 'b) r
        val withPtr :
          (notnull p -> 'a)
           -> t
           -> 'a
        val withOptPtr :
          (unit p -> 'a)
           -> t option
           -> 'a
        val withRefPtr :
          (('a, 'b) r -> 'c)
            -> t
            -> ('b p, 'c) pair
        val withRefOptPtr :
          ((unit, 'a) r -> 'b)
            -> t option
            -> ('a p, 'b) pair
        val fromPtr :
          bool
           -> notnull p
           -> t
        val fromOptPtr :
          bool
           -> unit p
           -> t option
        val handleError :
          ((unit, unit) r -> 'b)
           -> handler list
           -> 'b
      end
  end
