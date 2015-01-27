(* Copyright (C) 2012 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

(**
 * The structure Finalizable is provided for Poly/ML primarily to create an
 * abstraction of finalizable values similar to MLton.Finalizable to allow
 * greater sharing of source code between MLton and Poly/ML.
 *
 * The MLton.Finalizable interface cannot be replicated exactly because, in
 * Poly/ML,
 *
 *   1. finalizers are attached to vols in the vol array, rather than
 *      arbitrary ML objects and
 *
 *   2. the finalizer is a C function rather than an arbitrary ML function.
 *
 * Consequently, the type of `addFinalizer` must differ in that
 *
 *   1. the first tuple argument must have type `vol` and, in this context,
 *      it makes sense to require that it is a non-null pointer (which is
 *      internally a `vol`) and
 *
 *   2. the second tuple argument is a C symbol identifing the C function
 *      that performs finalization, so the argument type is `CInterface.sym`
 *      rather than `'a -> unit`.
 *
 * These difference do not present an issue for source code reuse beacuse
 * the types of the arguments to `addFinalizer` are never explicitly stated.
 *)
structure Finalizable :>
  sig
    type 'a t
    val new : 'a -> 'a t
    val withValue : 'a t * ('a -> 'b) -> 'b
    val addFinalizer : CPointer.notnull CPointer.t t * CInterface.sym -> unit
  end
=
  struct
    type 'a t = 'a
    fun new x = x
    fun withValue (x, f) = f x
    fun addFinalizer (x, sym) = CPointer.PolyML.setFinal sym x
  end
