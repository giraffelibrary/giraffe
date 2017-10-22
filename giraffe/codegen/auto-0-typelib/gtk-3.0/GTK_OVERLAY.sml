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
    val getOverlayPassThrough :
      'a class
       -> 'b widget_class
       -> bool
    val reorderOverlay :
      'a class
       -> 'b widget_class * LargeInt.int
       -> unit
    val setOverlayPassThrough :
      'a class
       -> 'b widget_class * bool
       -> unit
    val getChildPositionSig : (base widget_class -> bool * Gdk.RectangleRecord.t) -> 'a class Signal.t
  end
