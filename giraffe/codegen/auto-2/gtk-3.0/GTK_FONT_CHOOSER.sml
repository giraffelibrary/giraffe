signature GTK_FONT_CHOOSER =
  sig
    type 'a class_t
    val getType : unit -> GObject.Type.t
    val getFont : 'a class_t -> string
    val getFontDesc : 'a class_t -> Pango.FontDescriptionRecord.t
    val getFontFace : 'a class_t -> base Pango.FontFaceClass.t
    val getFontFamily : 'a class_t -> base Pango.FontFamilyClass.t
    val getFontSize : 'a class_t -> LargeInt.int
    val getPreviewText : 'a class_t -> string
    val getShowPreviewEntry : 'a class_t -> bool
    val setFont :
      'a class_t
       -> string
       -> unit
    val setFontDesc :
      'a class_t
       -> Pango.FontDescriptionRecord.t
       -> unit
    val setPreviewText :
      'a class_t
       -> string
       -> unit
    val setShowPreviewEntry :
      'a class_t
       -> bool
       -> unit
    val fontActivatedSig : (string -> unit) -> 'a class_t Signal.signal
    val fontProp : ('a class_t, string option, string option) Property.readwrite
    val fontDescProp : ('a class_t, Pango.FontDescriptionRecord.t option, Pango.FontDescriptionRecord.t option) Property.readwrite
    val previewTextProp : ('a class_t, string option, string option) Property.readwrite
    val showPreviewEntryProp : ('a class_t, bool, bool) Property.readwrite
  end
