signature PROPERTY =
  sig
    (*
     * Types of properties with moded access
     *)
    type ('objectclass, 'a) readonly = {get : 'objectclass -> 'a}
    type ('objectclass, 'a) writeonly = {set : 'a -> 'objectclass -> unit}
    type ('objectclass, 'a, 'b) readwrite =
      {
        get : 'objectclass -> 'a,
        set : 'b -> 'objectclass -> unit
      }

    (*
     * Declaration of properties with moded access
     *)
    type ('a, 'b) accessor
    type 'a objectclass_t

    val get : string -> ('a, 'b) accessor -> 'c objectclass_t -> 'a
    val set : string -> ('a, 'b) accessor -> 'b -> 'c objectclass_t -> unit
  end
