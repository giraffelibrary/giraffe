signature GTK_CELL_EDITABLE =
  sig
    type 'a class
    type t = base class
    val getType : unit -> GObject.Type.t
    val editingDone : 'a class -> unit
    val removeWidget : 'a class -> unit
    val startEditing :
      'a class
       -> 'b Gdk.Event.union option
       -> unit
    val editingDoneSig : (unit -> unit) -> 'a class Signal.signal
    val removeWidgetSig : (unit -> unit) -> 'a class Signal.signal
    val editingCanceledProp : ('a class, bool, bool) Property.readwrite
  end
