signature GTK_ACCEL_LABEL =
  sig
    type 'a class_t
    type 'a widgetclass_t
    type 'a buildableclass_t
    val asImplementorIface : 'a class_t -> base Atk.ImplementorIfaceClass.t
    val asBuildable : 'a class_t -> base buildableclass_t
    val getType : unit -> GObject.Type.t
    val new : string -> base class_t
    val getAccelWidget : 'a class_t -> base widgetclass_t
    val getAccelWidth : 'a class_t -> LargeInt.int
    val refetch : 'a class_t -> bool
    val setAccelClosure :
      'a class_t
       -> GObject.ClosureRecord.t
       -> unit
    val setAccelWidget :
      'a class_t
       -> 'b widgetclass_t
       -> unit
    val accelClosureProp : ('a class_t, GObject.ClosureRecord.t option, GObject.ClosureRecord.t option) Property.readwrite
    val accelWidgetProp : ('a class_t, base widgetclass_t option, 'b widgetclass_t option) Property.readwrite
  end
