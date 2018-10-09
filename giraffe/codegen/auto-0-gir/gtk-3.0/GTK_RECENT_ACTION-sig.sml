signature GTK_RECENT_ACTION =
  sig
    type 'a class
    type 'a buildable_class
    type 'a recent_chooser_class
    type 'a recent_manager_class
    type t = base class
    val asBuildable : 'a class -> base buildable_class
    val asRecentChooser : 'a class -> base recent_chooser_class
    val getType : unit -> GObject.Type.t
    val new :
      string
       * string option
       * string option
       * string option
       -> base class
    val newForManager :
      string
       * string option
       * string option
       * string option
       * 'a recent_manager_class option
       -> base class
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
