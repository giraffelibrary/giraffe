signature V_TEXT_TREE =
  sig
    type t
    type h

    (* Constructors
     *)
    val empty : t
    val sp    : int -> t
    val line  : h -> t
    val seq   : t list -> t

    val seq1  : t list -> t
    val str    : string -> t
    val concat : h list -> t

    (* Predicates
     *)
    val isEmpty : t -> bool
    val isMulti : t -> bool

    (* Operations
     *)
    val size : t -> int
    val indentWith : h -> bool -> t -> t
    val flattenWith : h -> t -> h
    val app : (unit -> unit) * (string -> unit) -> t -> unit
    val toStrings : t -> string list list

    (* Iteration
     *
     * The structure Iter provides functions to iterate over the
     * lines of vertical text.  The iteration state is represented
     * by the type `t list list`.  Additional functions are included
     * to work with the iteration state.
     *)
    structure Iter :
      sig
        type state = t list list

        val fromText : t -> state  (* fun fromText t = [[t]] *)
        val toText : state -> t

        val getLine : state -> (h * state) option

        val isEmpty : state -> bool
        val isMulti : state -> bool
      end
  end
