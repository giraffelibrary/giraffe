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
    val accelClosureProp :
      {
        get : 'a class -> GObject.ClosureRecord.t option,
        set :
          GObject.ClosureRecord.t option
           -> 'a class
           -> unit,
        new : GObject.ClosureRecord.t option -> 'a class Property.t
      }
    val accelWidgetProp :
      {
        get : 'a class -> base widget_class option,
        set :
          'b widget_class option
           -> 'a class
           -> unit,
        new : 'b widget_class option -> 'a class Property.t
      }
  end
