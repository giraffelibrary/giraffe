signature GDK_DRAG_CONTEXT =
  sig
    type 'a class
    type drag_protocol_t
    type 'a window_class
    type 'a device_class
    type drag_action_t
    type drag_cancel_reason_t
    type t = base class
    val getType : unit -> GObject.Type.t
    val getActions : 'a class -> drag_action_t
    val getDestWindow : 'a class -> base window_class
    val getDevice : 'a class -> base device_class
    val getDragWindow : 'a class -> base window_class option
    val getProtocol : 'a class -> drag_protocol_t
    val getSelectedAction : 'a class -> drag_action_t
    val getSourceWindow : 'a class -> base window_class
    val getSuggestedAction : 'a class -> drag_action_t
    val manageDnd :
      'a class
       -> 'b window_class * drag_action_t
       -> bool
    val setDevice :
      'a class
       -> 'b device_class
       -> unit
    val setHotspot :
      'a class
       -> LargeInt.int * LargeInt.int
       -> unit
    val actionChangedSig : (drag_action_t -> unit) -> 'a class Signal.t
    val cancelSig : (drag_cancel_reason_t -> unit) -> 'a class Signal.t
    val dndFinishedSig : (unit -> unit) -> 'a class Signal.t
    val dropPerformedSig : (LargeInt.int -> unit) -> 'a class Signal.t
  end
