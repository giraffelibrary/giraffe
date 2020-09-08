signature GTK_FONT_CHOOSER =
  sig
    type 'a class
    type t = base class
    val getType : unit -> GObject.Type.t
    val getFont : 'a class -> string option
    val getFontDesc : 'a class -> Pango.FontDescriptionRecord.t option
    val getFontFace : 'a class -> base Pango.FontFaceClass.class option
    val getFontFamily : 'a class -> base Pango.FontFamilyClass.class option
    val getFontMap : 'a class -> base Pango.FontMapClass.class option
    val getFontSize : 'a class -> LargeInt.int
    val getPreviewText : 'a class -> string
    val getShowPreviewEntry : 'a class -> bool
    val setFont :
      'a class
       -> string
       -> unit
    val setFontDesc :
      'a class
       -> Pango.FontDescriptionRecord.t
       -> unit
    val setFontMap :
      'a class
       -> 'b Pango.FontMapClass.class option
       -> unit
    val setPreviewText :
      'a class
       -> string
       -> unit
    val setShowPreviewEntry :
      'a class
       -> bool
       -> unit
    val fontActivatedSig : (string -> unit) -> 'a class Signal.t
    val fontProp : ('a class, unit -> string option, string option -> unit, string option -> unit) Property.t
    val fontDescProp : ('a class, unit -> Pango.FontDescriptionRecord.t option, Pango.FontDescriptionRecord.t option -> unit, Pango.FontDescriptionRecord.t option -> unit) Property.t
    val previewTextProp : ('a class, unit -> string option, string option -> unit, string option -> unit) Property.t
    val showPreviewEntryProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
  end
