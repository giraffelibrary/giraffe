signature GDK_RGBA =
  sig
    type t
    val getType : unit -> GObject.Type.t
    val copy : t -> t
    val equal :
      t
       -> t
       -> bool
    val hash : t -> LargeInt.int
    val parse : string -> t option
    val toString : t -> string
  end
