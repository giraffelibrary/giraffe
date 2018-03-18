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
    val fontProp :
      {
        get : 'a class -> string option,
        set :
          string option
           -> 'a class
           -> unit,
        new : string option -> 'a class Property.t
      }
    val fontDescProp :
      {
        get : 'a class -> Pango.FontDescriptionRecord.t option,
        set :
          Pango.FontDescriptionRecord.t option
           -> 'a class
           -> unit,
        new : Pango.FontDescriptionRecord.t option -> 'a class Property.t
      }
    val previewTextProp :
      {
        get : 'a class -> string option,
        set :
          string option
           -> 'a class
           -> unit,
        new : string option -> 'a class Property.t
      }
    val showPreviewEntryProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
  end
