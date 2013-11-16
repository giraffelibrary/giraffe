signature GTK_EVENT_BOX =
  sig
    type 'a class_t
    type 'a buildableclass_t
    val asImplementorIface : 'a class_t -> base Atk.ImplementorIfaceClass.t
    val asBuildable : 'a class_t -> base buildableclass_t
    val getType : unit -> GObject.Type.t
    val new : unit -> base class_t
    val getAboveChild : 'a class_t -> bool
    val getVisibleWindow : 'a class_t -> bool
    val setAboveChild :
      'a class_t
       -> bool
       -> unit
    val setVisibleWindow :
      'a class_t
       -> bool
       -> unit
    val aboveChildProp : ('a class_t, bool, bool) Property.readwrite
    val visibleWindowProp : ('a class_t, bool, bool) Property.readwrite
  end
