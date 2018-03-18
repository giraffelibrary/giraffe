signature GTK_FONT_SELECTION =
  sig
    type 'a class
    type 'a buildable_class
    type 'a orientable_class
    type 'a widget_class
    type t = base class
    val asImplementorIface : 'a class -> base Atk.ImplementorIfaceClass.class
    val asBuildable : 'a class -> base buildable_class
    val asOrientable : 'a class -> base orientable_class
    val getType : unit -> GObject.Type.t
    val new : unit -> base class
    val getFace : 'a class -> base Pango.FontFaceClass.class
    val getFaceList : 'a class -> base widget_class
    val getFamily : 'a class -> base Pango.FontFamilyClass.class
    val getFamilyList : 'a class -> base widget_class
    val getFontName : 'a class -> string
    val getPreviewEntry : 'a class -> base widget_class
    val getPreviewText : 'a class -> string
    val getSize : 'a class -> LargeInt.int
    val getSizeEntry : 'a class -> base widget_class
    val getSizeList : 'a class -> base widget_class
    val setFontName :
      'a class
       -> string
       -> bool
    val setPreviewText :
      'a class
       -> string
       -> unit
    val fontNameProp :
      {
        get : 'a class -> string option,
        set :
          string option
           -> 'a class
           -> unit,
        new : string option -> 'a class Property.t
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
  end
