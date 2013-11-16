signature STYLE_PROPERTY =
  sig
    (*
     * Types of properties with moded access
     *)
    type ('objectclass, 'a) readonly = {get : 'objectclass -> 'a}

    (*
     * Declaration of properties with moded access
     *)
    type 'a widgetclass_t

    val get : string -> ('a, 'b) GObjectValue.accessor -> 'c widgetclass_t -> 'a
  end
