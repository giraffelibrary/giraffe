(* Copyright (C) 2012 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

(**
 * The signature CALLBACK defines a callback table abstract machine: a
 * monomorphic instance of the callback table abstract data type as defined
 * by the signature CALLBACK_TABLE.
 *)
signature CALLBACK =
  sig
    eqtype id
    val fmtId : id -> string

    type callback
    val add : callback -> id
    val remove : id -> unit
    val lookup : id -> callback option
  end
