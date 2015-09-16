signature PANGO_FONT_DESCRIPTION =
  sig
    type record_t
    type gravity_t
    type stretch_t
    type style_t
    type variant_t
    type weight_t
    type font_mask_t
    type t = record_t
    val getType : unit -> GObject.Type.t
    val new : unit -> record_t
    val betterMatch :
      record_t
       -> record_t option
       -> record_t
       -> bool
    val copy : record_t -> record_t
    val copyStatic : record_t -> record_t
    val equal :
      record_t
       -> record_t
       -> bool
    val getFamily : record_t -> string
    val getGravity : record_t -> gravity_t
    val getSetFields : record_t -> font_mask_t
    val getSize : record_t -> LargeInt.int
    val getSizeIsAbsolute : record_t -> bool
    val getStretch : record_t -> stretch_t
    val getStyle : record_t -> style_t
    val getVariant : record_t -> variant_t
    val getWeight : record_t -> weight_t
    val hash : record_t -> LargeInt.int
    val merge :
      record_t
       -> record_t option
       -> bool
       -> unit
    val mergeStatic :
      record_t
       -> record_t
       -> bool
       -> unit
    val setAbsoluteSize :
      record_t
       -> real
       -> unit
    val setFamily :
      record_t
       -> string
       -> unit
    val setFamilyStatic :
      record_t
       -> string
       -> unit
    val setGravity :
      record_t
       -> gravity_t
       -> unit
    val setSize :
      record_t
       -> LargeInt.int
       -> unit
    val setStretch :
      record_t
       -> stretch_t
       -> unit
    val setStyle :
      record_t
       -> style_t
       -> unit
    val setVariant :
      record_t
       -> variant_t
       -> unit
    val setWeight :
      record_t
       -> weight_t
       -> unit
    val toFilename : record_t -> string
    val toString : record_t -> string
    val unsetFields :
      record_t
       -> font_mask_t
       -> unit
    val fromString : string -> record_t
  end
