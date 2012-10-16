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
