signature GTK_CELL_EDITABLE =
  sig
    type 'a class_t
    type t = base class_t
    val getType : unit -> GObject.Type.t
    val editingDone : 'a class_t -> unit
    val removeWidget : 'a class_t -> unit
    val startEditing :
      'a class_t
       -> 'b Gdk.Event.t option
       -> unit
    val editingDoneSig : (unit -> unit) -> 'a class_t Signal.signal
    val removeWidgetSig : (unit -> unit) -> 'a class_t Signal.signal
    val editingCanceledProp : ('a class_t, bool, bool) Property.readwrite
  end
