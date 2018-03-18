signature GTK_COLOR_CHOOSER_WIDGET =
  sig
    type 'a class
    type 'a buildable_class
    type 'a color_chooser_class
    type 'a orientable_class
    type t = base class
    val asImplementorIface : 'a class -> base Atk.ImplementorIfaceClass.class
    val asBuildable : 'a class -> base buildable_class
    val asColorChooser : 'a class -> base color_chooser_class
    val asOrientable : 'a class -> base orientable_class
    val getType : unit -> GObject.Type.t
    val new : unit -> base class
    val showEditorProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
  end
