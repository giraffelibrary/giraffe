signature GDK_COLOR =
  sig
    type t
    val getType : unit -> GObject.Type.t
    val copy : t -> t
    val equal :
      t
       -> t
       -> bool
    val hash : t -> LargeInt.int
    val toString : t -> string
    val parse : string -> t option
  end
