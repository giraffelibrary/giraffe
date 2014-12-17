signature GTK_RECENT_CHOOSER_MENU =
  sig
    type 'a class_t
    type 'a activatableclass_t
    type 'a buildableclass_t
    type 'a recentchooserclass_t
    type 'a recentmanagerclass_t
    type t = base class_t
    val asImplementorIface : 'a class_t -> base Atk.ImplementorIfaceClass.t
    val asActivatable : 'a class_t -> base activatableclass_t
    val asBuildable : 'a class_t -> base buildableclass_t
    val asRecentChooser : 'a class_t -> base recentchooserclass_t
    val getType : unit -> GObject.Type.t
    val new : unit -> base class_t
    val newForManager : 'a recentmanagerclass_t -> base class_t
    val getShowNumbers : 'a class_t -> bool
    val setShowNumbers :
      'a class_t
       -> bool
       -> unit
    val showNumbersProp : ('a class_t, bool, bool) Property.readwrite
  end
