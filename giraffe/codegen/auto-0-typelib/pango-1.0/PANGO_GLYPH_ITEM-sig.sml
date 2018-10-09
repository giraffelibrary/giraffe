signature PANGO_GLYPH_ITEM =
  sig
    type t
    val getType : unit -> GObject.Type.t
    val copy : t -> t option
    val split :
      t
       -> string * LargeInt.int
       -> t
  end
