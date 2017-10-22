signature GTK_ACCEL_LABEL =
  sig
    type 'a class
    type 'a buildable_class
    type 'a widget_class
    type t = base class
    val asImplementorIface : 'a class -> base Atk.ImplementorIfaceClass.class
    val asBuildable : 'a class -> base buildable_class
    val getType : unit -> GObject.Type.t
    val new : string -> base class
    val getAccel : 'a class -> LargeInt.int * Gdk.ModifierType.t
    val getAccelWidget : 'a class -> base widget_class option
    val getAccelWidth : 'a class -> LargeInt.int
    val refetch : 'a class -> bool
    val setAccel :
      'a class
       -> LargeInt.int * Gdk.ModifierType.t
       -> unit
    val setAccelClosure :
      'a class
       -> GObject.ClosureRecord.t
       -> unit
    val setAccelWidget :
      'a class
       -> 'b widget_class
       -> unit
    val accelClosureProp : ('a class, GObject.ClosureRecord.t option, GObject.ClosureRecord.t option) Property.readwrite
    val accelWidgetProp : ('a class, base widget_class option, 'b widget_class option) Property.readwrite
  end
