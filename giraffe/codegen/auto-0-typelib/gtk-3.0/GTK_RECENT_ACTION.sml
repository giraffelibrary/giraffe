signature GTK_RECENT_ACTION =
  sig
    type 'a class_t
    type 'a buildable_class_t
    type 'a recent_chooser_class_t
    type 'a recent_manager_class_t
    type t = base class_t
    val asBuildable : 'a class_t -> base buildable_class_t
    val asRecentChooser : 'a class_t -> base recent_chooser_class_t
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
       -> 'a recent_manager_class_t option
       -> base class_t
    val getShowNumbers : 'a class_t -> bool
    val setShowNumbers :
      'a class_t
       -> bool
       -> unit
    val showNumbersProp : ('a class_t, bool, bool) Property.readwrite
  end
