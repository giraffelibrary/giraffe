signature GTK_SIZE_GROUP =
  sig
    type 'a class
    type 'a buildable_class
    type 'a widget_class
    type size_group_mode_t
    type t = base class
    val asBuildable : 'a class -> base buildable_class
    val getType : unit -> GObject.Type.t
    val new : size_group_mode_t -> base class
    val addWidget :
      'a class
       -> 'b widget_class
       -> unit
    val getIgnoreHidden : 'a class -> bool
    val getMode : 'a class -> size_group_mode_t
    val removeWidget :
      'a class
       -> 'b widget_class
       -> unit
    val setIgnoreHidden :
      'a class
       -> bool
       -> unit
    val setMode :
      'a class
       -> size_group_mode_t
       -> unit
    val ignoreHiddenProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val modeProp : ('a class, unit -> size_group_mode_t, size_group_mode_t -> unit, size_group_mode_t -> unit) Property.t
  end
