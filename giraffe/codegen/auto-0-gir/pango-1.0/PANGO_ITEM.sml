signature PANGO_ITEM =
  sig
    type t
    val getType : unit -> GObject.Type.t
    val new : unit -> t
    val copy : t -> t
    val split :
      t
       -> LargeInt.int * LargeInt.int
       -> t
  end
