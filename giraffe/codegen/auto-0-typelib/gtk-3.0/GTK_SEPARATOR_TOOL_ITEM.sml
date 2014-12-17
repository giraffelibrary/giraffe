signature GTK_SEPARATOR_TOOL_ITEM =
  sig
    type 'a class_t
    type 'a activatableclass_t
    type 'a buildableclass_t
    type t = base class_t
    val asImplementorIface : 'a class_t -> base Atk.ImplementorIfaceClass.t
    val asActivatable : 'a class_t -> base activatableclass_t
    val asBuildable : 'a class_t -> base buildableclass_t
    val getType : unit -> GObject.Type.t
    val new : unit -> base class_t
    val getDraw : 'a class_t -> bool
    val setDraw :
      'a class_t
       -> bool
       -> unit
    val drawProp : ('a class_t, bool, bool) Property.readwrite
  end
