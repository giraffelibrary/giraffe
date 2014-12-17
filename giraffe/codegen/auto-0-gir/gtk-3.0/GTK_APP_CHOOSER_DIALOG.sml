signature GTK_APP_CHOOSER_DIALOG =
  sig
    type 'a class_t
    type 'a appchooserclass_t
    type 'a buildableclass_t
    type dialogflags_t
    type 'a windowclass_t
    type 'a widgetclass_t
    type t = base class_t
    val asImplementorIface : 'a class_t -> base Atk.ImplementorIfaceClass.t
    val asAppChooser : 'a class_t -> base appchooserclass_t
    val asBuildable : 'a class_t -> base buildableclass_t
    val getType : unit -> GObject.Type.t
    val new :
      'a windowclass_t option
       -> dialogflags_t
       -> 'b Gio.FileClass.t
       -> base class_t
    val newForContentType :
      'a windowclass_t option
       -> dialogflags_t
       -> string
       -> base class_t
    val getHeading : 'a class_t -> string
    val getWidget : 'a class_t -> base widgetclass_t
    val setHeading :
      'a class_t
       -> string
       -> unit
    val gfileProp : ('a class_t, base Gio.FileClass.t option, 'b Gio.FileClass.t option) Property.readwrite
    val headingProp : ('a class_t, string option, string option) Property.readwrite
  end
