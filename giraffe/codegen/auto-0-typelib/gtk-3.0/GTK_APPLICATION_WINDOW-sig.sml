signature GTK_APPLICATION_WINDOW =
  sig
    type 'a class
    type 'a buildable_class
    type 'a application_class
    type 'a shortcuts_window_class
    type t = base class
    val asImplementorIface : 'a class -> base Atk.ImplementorIfaceClass.class
    val asActionGroup : 'a class -> base Gio.ActionGroupClass.class
    val asActionMap : 'a class -> base Gio.ActionMapClass.class
    val asBuildable : 'a class -> base buildable_class
    val getType : unit -> GObject.Type.t
    val new : 'a application_class -> base class
    val getHelpOverlay : 'a class -> base shortcuts_window_class option
    val getId : 'a class -> LargeInt.int
    val getShowMenubar : 'a class -> bool
    val setHelpOverlay :
      'a class
       -> 'b shortcuts_window_class option
       -> unit
    val setShowMenubar :
      'a class
       -> bool
       -> unit
    val showMenubarProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
  end
