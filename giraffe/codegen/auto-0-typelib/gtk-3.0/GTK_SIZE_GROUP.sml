signature GTK_SIZE_GROUP =
  sig
    type 'a class_t
    type 'a buildableclass_t
    type 'a widgetclass_t
    type sizegroupmode_t
    type t = base class_t
    val asBuildable : 'a class_t -> base buildableclass_t
    val getType : unit -> GObject.Type.t
    val new : sizegroupmode_t -> base class_t
    val addWidget :
      'a class_t
       -> 'b widgetclass_t
       -> unit
    val getIgnoreHidden : 'a class_t -> bool
    val getMode : 'a class_t -> sizegroupmode_t
    val removeWidget :
      'a class_t
       -> 'b widgetclass_t
       -> unit
    val setIgnoreHidden :
      'a class_t
       -> bool
       -> unit
    val setMode :
      'a class_t
       -> sizegroupmode_t
       -> unit
    val ignoreHiddenProp : ('a class_t, bool, bool) Property.readwrite
    val modeProp : ('a class_t, sizegroupmode_t, sizegroupmode_t) Property.readwrite
  end
