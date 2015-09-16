signature GTK_ACCEL_LABEL =
  sig
    type 'a class_t
    type 'a buildable_class_t
    type 'a widget_class_t
    type t = base class_t
    val asImplementorIface : 'a class_t -> base Atk.ImplementorIfaceClass.t
    val asBuildable : 'a class_t -> base buildable_class_t
    val getType : unit -> GObject.Type.t
    val new : string -> base class_t
    val getAccelWidget : 'a class_t -> base widget_class_t
    val getAccelWidth : 'a class_t -> LargeInt.int
    val refetch : 'a class_t -> bool
    val setAccelClosure :
      'a class_t
       -> GObject.ClosureRecord.t
       -> unit
    val setAccelWidget :
      'a class_t
       -> 'b widget_class_t
       -> unit
    val accelClosureProp : ('a class_t, GObject.ClosureRecord.t option, GObject.ClosureRecord.t option) Property.readwrite
    val accelWidgetProp : ('a class_t, base widget_class_t option, 'b widget_class_t option) Property.readwrite
  end
