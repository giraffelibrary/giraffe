signature GTK_RECENT_CHOOSER_MENU =
  sig
    type 'a class
    type 'a activatable_class
    type 'a buildable_class
    type 'a recent_chooser_class
    type 'a recent_manager_class
    type t = base class
    val asImplementorIface : 'a class -> base Atk.ImplementorIfaceClass.class
    val asActivatable : 'a class -> base activatable_class
    val asBuildable : 'a class -> base buildable_class
    val asRecentChooser : 'a class -> base recent_chooser_class
    val getType : unit -> GObject.Type.t
    val new : unit -> base class
    val newForManager : 'a recent_manager_class -> base class
    val getShowNumbers : 'a class -> bool
    val setShowNumbers :
      'a class
       -> bool
       -> unit
    val showNumbersProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
  end
