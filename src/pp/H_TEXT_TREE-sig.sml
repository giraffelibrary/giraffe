signature H_TEXT_TREE =
  sig
    type t

    type version
    type frame
    type 'a variant

    (* Constructors *)
    val empty : t
    val sp    : int -> t
    val str   : string -> t
    val chr   : char   -> t
    val seq   : t list -> t
    val var   : t variant -> t

    (* Derived constructors *)
    val seq1  : t list -> t
    val var1  : t variant -> t
    val concat : string list -> t

    (* Predicates *)
    val isEmpty : t -> bool variant

    (* Operations *)
    val size : t -> int variant
    val indentWith : t -> bool -> t -> t
    val addVersions : frame -> t * unit variant -> unit variant
    val versions : t -> version list
    val app : version option -> (string -> unit) -> t -> unit
    val strings : version option -> t -> string list
  end
