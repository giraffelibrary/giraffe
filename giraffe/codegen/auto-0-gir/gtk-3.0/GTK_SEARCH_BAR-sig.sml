signature GTK_SEARCH_BAR =
  sig
    type 'a class
    type 'a buildable_class
    type 'a entry_class
    type t = base class
    val asImplementorIface : 'a class -> base Atk.ImplementorIfaceClass.class
    val asBuildable : 'a class -> base buildable_class
    val getType : unit -> GObject.Type.t
    val new : unit -> base class
    val connectEntry :
      'a class
       -> 'b entry_class
       -> unit
    val getSearchMode : 'a class -> bool
    val getShowCloseButton : 'a class -> bool
    val handleEvent :
      'a class
       -> 'b Gdk.Event.union
       -> bool
    val setSearchMode :
      'a class
       -> bool
       -> unit
    val setShowCloseButton :
      'a class
       -> bool
       -> unit
    val searchModeEnabledProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
    val showCloseButtonProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
  end
