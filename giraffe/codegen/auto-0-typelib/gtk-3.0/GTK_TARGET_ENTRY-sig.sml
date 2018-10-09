signature GTK_TARGET_ENTRY =
  sig
    type t
    val getType : unit -> GObject.Type.t
    val new :
      string
       * LargeInt.int
       * LargeInt.int
       -> t
    val copy : t -> t
  end
