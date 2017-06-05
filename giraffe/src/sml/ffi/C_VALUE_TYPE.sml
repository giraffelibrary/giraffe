(* Copyright (C) 2016 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

signature C_VALUE_TYPE =
  sig
    (**
     * The signature C_VALUE provides types `t` and `v` that represent the
     * C value and type `p` that represents a C pointer to the C value.
     * `t` is a portable type (same for all compilers) and `v` is the
     * compiler-specific FFI type.
     *)
    include C_VALUE

    (**
     * The type `v` may be either immutable or mutable.  `isRef`is true
     * if `v` is mutable, i.e. a reference, and false otherwise.
     *)
    val isRef : bool

    (**
     * `size` returns the number of bytes used by the C representation
     * of the C value.  Note that this is a function because the value
     * may need to be determined by a call to a C function at run-time,
     * so cannot be a val with Poly/ML.
     *)
    val size : unit -> word

    (**
     * `toC` and `updateC` convert to the C representation.  If type `v` is
     * immutable (`isRef` is false) then `toC t` returns the conversion of
     * `t`.  If type `v` is mutable (`isRef` is true) then `updateC t v`
     * assigns the conversion of `t` to `v`.  If type `t` represents a wider
     * range of values than type `v` then conversion raises an exception for
     * values that type `v` cannot represent.
     *
     * `clear` must be applied to the value assigned by `updateC` before it
     * is overwritten by `updateC` again or deleted by `delete`.  `clear` is
     * required only if the value has been initialized by `updateC`.
     *
     * `fromC` converts from the C representation.
     *)
    val toC : t -> v
    val updateC : t -> v -> unit
    val fromC : v -> t

    (**
     * If type `v` is mutable (`isRef` is true) then `clear v` frees all
     * resources whose lifespan is tied to the lifespan of the value of `v`
     * and sets `v` to a value that represents the uninitialized state.
     * `clear v` has no effect if `v` is already in an uninitialized state.
     * If type `v` is immutable (`isRef` is false) then `clear v` serves no
     * purpose and has no effect.
     *)
    val clear : v -> unit

    (**
     * If type `v` is mutable (`isRef` is true) then `new ()` allocates
     * resources for a new instance of type `v` and returns the new
     * uninitialized instance.  `delete` must be applied to the mutable value
     * returned by `new ()` once it is no longer required.  `delete v` frees
     * all resources for `v`.  For example, if `v` is allocated on the heap,
     * then the allocated memory is freed.
     *
     * If type `v` is immutable (`isRef` is false) then `new ()` returns some
     * value of type `v`.  `delete` serves no purpose and has no effect.
     *
     *)
    val new : unit -> v
    val delete : v -> unit

    val get : p -> v
    val set : p * v -> unit
    val malloc : word -> p
    val free : p -> unit
  end
