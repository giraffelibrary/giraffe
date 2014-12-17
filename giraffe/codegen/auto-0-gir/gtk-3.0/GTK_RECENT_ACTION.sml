signature GTK_RECENT_ACTION =
  sig
    type 'a class_t
    type 'a buildableclass_t
    type 'a recentchooserclass_t
    type 'a recentmanagerclass_t
    type t = base class_t
    val asBuildable : 'a class_t -> base buildableclass_t
    val asRecentChooser : 'a class_t -> base recentchooserclass_t
    val getType : unit -> GObject.Type.t
    val new :
      string
       -> string option
       -> string option
       -> string option
       -> base class_t
    val newForManager :
      string
       -> string option
       -> string option
       -> string option
       -> 'a recentmanagerclass_t option
       -> base class_t
    val getShowNumbers : 'a class_t -> bool
    val setShowNumbers :
      'a class_t
       -> bool
       -> unit
    val showNumbersProp : ('a class_t, bool, bool) Property.readwrite
  end
