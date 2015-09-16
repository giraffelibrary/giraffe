signature GDK_DRAG_CONTEXT =
  sig
    type 'a class_t
    type drag_protocol_t
    type 'a window_class_t
    type drag_action_t
    type 'a device_class_t
    type t = base class_t
    val getType : unit -> GObject.Type.t
    val getActions : 'a class_t -> drag_action_t
    val getDestWindow : 'a class_t -> base window_class_t
    val getDevice : 'a class_t -> base device_class_t
    val getProtocol : 'a class_t -> drag_protocol_t
    val getSelectedAction : 'a class_t -> drag_action_t
    val getSourceWindow : 'a class_t -> base window_class_t
    val getSuggestedAction : 'a class_t -> drag_action_t
    val setDevice :
      'a class_t
       -> 'b device_class_t
       -> unit
  end
