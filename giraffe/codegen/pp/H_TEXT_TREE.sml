signature H_TEXT_TREE =
  sig
    type t

    (* Constructors *)
    val empty : t
    val sp    : int -> t
    val str   : string -> t
    val chr   : char   -> t
    val seq   : t list -> t

    (* Derived constructors *)
    val concat : string list -> t

    (* Predicates *)
    val isEmpty : t -> bool

    (* Operations *)
    val size : t -> int
    val app : (string -> unit) -> t -> unit
    val toStrings : t -> string list
  end
