signature PANGO_GLYPH_ITEM =
  sig
    type record_t
    type t = record_t
    val getType : unit -> GObject.Type.t
    val copy : record_t -> record_t
    val split :
      record_t
       -> string
       -> LargeInt.int
       -> record_t
  end
