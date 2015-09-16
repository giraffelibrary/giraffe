signature GTK_APP_CHOOSER_DIALOG =
  sig
    type 'a class_t
    type 'a app_chooser_class_t
    type 'a buildable_class_t
    type dialog_flags_t
    type 'a window_class_t
    type 'a widget_class_t
    type t = base class_t
    val asImplementorIface : 'a class_t -> base Atk.ImplementorIfaceClass.t
    val asAppChooser : 'a class_t -> base app_chooser_class_t
    val asBuildable : 'a class_t -> base buildable_class_t
    val getType : unit -> GObject.Type.t
    val new :
      'a window_class_t option
       -> dialog_flags_t
       -> 'b Gio.FileClass.t
       -> base class_t
    val newForContentType :
      'a window_class_t option
       -> dialog_flags_t
       -> string
       -> base class_t
    val getHeading : 'a class_t -> string
    val getWidget : 'a class_t -> base widget_class_t
    val setHeading :
      'a class_t
       -> string
       -> unit
    val gfileProp : ('a class_t, base Gio.FileClass.t option, 'b Gio.FileClass.t option) Property.readwrite
    val headingProp : ('a class_t, string option, string option) Property.readwrite
  end
