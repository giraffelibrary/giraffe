signature GTK_FONT_CHOOSER =
  sig
    type 'a class
    type t = base class
    val getType : unit -> GObject.Type.t
    val getFont : 'a class -> string
    val getFontDesc : 'a class -> Pango.FontDescriptionRecord.t
    val getFontFace : 'a class -> base Pango.FontFaceClass.class
    val getFontFamily : 'a class -> base Pango.FontFamilyClass.class
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
    val setPreviewText :
      'a class
       -> string
       -> unit
    val setShowPreviewEntry :
      'a class
       -> bool
       -> unit
    val fontActivatedSig : (string -> unit) -> 'a class Signal.signal
    val fontProp : ('a class, string option, string option) Property.readwrite
    val fontDescProp : ('a class, Pango.FontDescriptionRecord.t option, Pango.FontDescriptionRecord.t option) Property.readwrite
    val previewTextProp : ('a class, string option, string option) Property.readwrite
    val showPreviewEntryProp : ('a class, bool, bool) Property.readwrite
  end
