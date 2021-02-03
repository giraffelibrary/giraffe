signature V_TEXT_TREE =
  sig
    type t
    type h

    type version
    type frame
    type 'a variant

    (* Constructors
     *)
    val empty : t
    val sp    : int -> t
    val line  : h -> t
    val seq   : t list -> t
    val var   : t variant -> t

    val seq1  : t list -> t
    val var1  : t variant -> t
    val str    : string -> t
    val concat : h list -> t

    (* Predicates
     *)
    val isEmpty : t -> bool variant

    (* Operations
     *)
    val size : t -> int variant
    val indentWith : h -> bool -> t -> t
    val indentWith1 : h * h -> bool -> t -> t
    val addVersions : frame -> t * unit variant -> unit variant
    val versions : t -> version list
    val app : version option -> (unit -> unit) * (string -> unit) -> t -> unit
    val strings : version option -> t -> string list list
  end
