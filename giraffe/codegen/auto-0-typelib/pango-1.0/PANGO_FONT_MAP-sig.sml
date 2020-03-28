signature PANGO_FONT_MAP =
  sig
    type 'a class
    type font_family_class_c_array_n_t
    type 'a font_class
    type 'a fontset_class
    type language_t
    type font_description_t
    type 'a context_class
    type t = base class
    val getType : unit -> GObject.Type.t
    val changed : 'a class -> unit
    val createContext : 'a class -> base context_class
    val getSerial : 'a class -> LargeInt.int
    val getShapeEngineType : 'a class -> string
    val listFamilies : 'a class -> font_family_class_c_array_n_t
    val loadFont :
      'a class
       -> 'b context_class * font_description_t
       -> base font_class option
    val loadFontset :
      'a class
       -> 'b context_class
           * font_description_t
           * language_t
       -> base fontset_class option
  end
