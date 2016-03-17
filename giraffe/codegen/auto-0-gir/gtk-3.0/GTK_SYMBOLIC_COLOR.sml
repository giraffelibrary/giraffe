signature GTK_SYMBOLIC_COLOR =
  sig
    type t
    type 'a style_properties_class
    val getType : unit -> GObject.Type.t
    val newAlpha :
      t
       -> real
       -> t
    val newLiteral : Gdk.RgbaRecord.t -> t
    val newMix :
      t
       -> t
       -> real
       -> t
    val newName : string -> t
    val newShade :
      t
       -> real
       -> t
    val resolve :
      t
       -> 'a style_properties_class option
       -> Gdk.RgbaRecord.t option
    val toString : t -> string
  end
