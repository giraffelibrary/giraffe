signature GTK_APP_CHOOSER_DIALOG =
  sig
    type 'a class
    type 'a app_chooser_class
    type 'a buildable_class
    type dialog_flags_t
    type 'a window_class
    type 'a widget_class
    type t = base class
    val asImplementorIface : 'a class -> base Atk.ImplementorIfaceClass.class
    val asAppChooser : 'a class -> base app_chooser_class
    val asBuildable : 'a class -> base buildable_class
    val getType : unit -> GObject.Type.t
    val new :
      'a window_class option
       * dialog_flags_t
       * 'b Gio.FileClass.class
       -> base class
    val newForContentType :
      'a window_class option
       * dialog_flags_t
       * string
       -> base class
    val getHeading : 'a class -> string
    val getWidget : 'a class -> base widget_class
    val setHeading :
      'a class
       -> string
       -> unit
    val gfileProp : ('a class, base Gio.FileClass.class option, 'b Gio.FileClass.class option) Property.readwrite
    val headingProp : ('a class, string option, string option) Property.readwrite
  end
