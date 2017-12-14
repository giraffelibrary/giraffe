signature GTK_FONT_SELECTION_DIALOG =
  sig
    type 'a class
    type 'a buildable_class
    type 'a widget_class
    type t = base class
    val asImplementorIface : 'a class -> base Atk.ImplementorIfaceClass.class
    val asBuildable : 'a class -> base buildable_class
    val getType : unit -> GObject.Type.t
    val new : string -> base class
    val getCancelButton : 'a class -> base widget_class
    val getFontName : 'a class -> string
    val getFontSelection : 'a class -> base widget_class
    val getOkButton : 'a class -> base widget_class
    val getPreviewText : 'a class -> string
    val setFontName :
      'a class
       -> string
       -> bool
    val setPreviewText :
      'a class
       -> string
       -> unit
  end
