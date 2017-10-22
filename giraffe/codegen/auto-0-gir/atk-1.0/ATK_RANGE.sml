signature ATK_RANGE =
  sig
    type t
    val getType : unit -> GObject.Type.t
    val new :
      real
       * real
       * string
       -> t
    val copy : t -> t
    val getDescription : t -> string
    val getLowerLimit : t -> real
    val getUpperLimit : t -> real
  end
