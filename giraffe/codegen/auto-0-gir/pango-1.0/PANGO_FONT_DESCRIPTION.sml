signature PANGO_FONT_DESCRIPTION =
  sig
    type t
    type gravity_t
    type stretch_t
    type style_t
    type variant_t
    type weight_t
    type font_mask_t
    val getType : unit -> GObject.Type.t
    val new : unit -> t
    val betterMatch :
      t
       -> t option * t
       -> bool
    val copy : t -> t
    val copyStatic : t -> t
    val equal :
      t
       -> t
       -> bool
    val getFamily : t -> string
    val getGravity : t -> gravity_t
    val getSetFields : t -> font_mask_t
    val getSize : t -> LargeInt.int
    val getSizeIsAbsolute : t -> bool
    val getStretch : t -> stretch_t
    val getStyle : t -> style_t
    val getVariant : t -> variant_t
    val getWeight : t -> weight_t
    val hash : t -> LargeInt.int
    val merge :
      t
       -> t option * bool
       -> unit
    val mergeStatic :
      t
       -> t * bool
       -> unit
    val setAbsoluteSize :
      t
       -> real
       -> unit
    val setFamily :
      t
       -> string
       -> unit
    val setFamilyStatic :
      t
       -> string
       -> unit
    val setGravity :
      t
       -> gravity_t
       -> unit
    val setSize :
      t
       -> LargeInt.int
       -> unit
    val setStretch :
      t
       -> stretch_t
       -> unit
    val setStyle :
      t
       -> style_t
       -> unit
    val setVariant :
      t
       -> variant_t
       -> unit
    val setWeight :
      t
       -> weight_t
       -> unit
    val toFilename : t -> string
    val toString : t -> string
    val unsetFields :
      t
       -> font_mask_t
       -> unit
    val fromString : string -> t
  end
