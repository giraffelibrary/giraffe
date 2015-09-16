signature GTK_SIZE_GROUP =
  sig
    type 'a class_t
    type 'a buildable_class_t
    type 'a widget_class_t
    type size_group_mode_t
    type t = base class_t
    val asBuildable : 'a class_t -> base buildable_class_t
    val getType : unit -> GObject.Type.t
    val new : size_group_mode_t -> base class_t
    val addWidget :
      'a class_t
       -> 'b widget_class_t
       -> unit
    val getIgnoreHidden : 'a class_t -> bool
    val getMode : 'a class_t -> size_group_mode_t
    val removeWidget :
      'a class_t
       -> 'b widget_class_t
       -> unit
    val setIgnoreHidden :
      'a class_t
       -> bool
       -> unit
    val setMode :
      'a class_t
       -> size_group_mode_t
       -> unit
    val ignoreHiddenProp : ('a class_t, bool, bool) Property.readwrite
    val modeProp : ('a class_t, size_group_mode_t, size_group_mode_t) Property.readwrite
  end
