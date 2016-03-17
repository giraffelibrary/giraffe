signature GTK_OVERLAY =
  sig
    type 'a class
    type 'a buildable_class
    type 'a widget_class
    type t = base class
    val asImplementorIface : 'a class -> base Atk.ImplementorIfaceClass.class
    val asBuildable : 'a class -> base buildable_class
    val getType : unit -> GObject.Type.t
    val new : unit -> base class
    val addOverlay :
      'a class
       -> 'b widget_class
       -> unit
    val getChildPositionSig : (base widget_class -> bool * Cairo.RectangleIntRecord.t) -> 'a class Signal.signal
  end
