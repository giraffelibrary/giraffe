signature GTK_SYMBOLIC_COLOR =
  sig
    type record_t
    type 'a stylepropertiesclass_t
    val getType : unit -> GObject.Type.t
    val newAlpha :
      record_t
       -> real
       -> record_t
    val newLiteral : Gdk.RgbaRecord.t -> record_t
    val newMix :
      record_t
       -> record_t
       -> real
       -> record_t
    val newName : string -> record_t
    val newShade :
      record_t
       -> real
       -> record_t
    val resolve :
      record_t
       -> 'a stylepropertiesclass_t option
       -> Gdk.RgbaRecord.t option
    val toString : record_t -> string
  end
