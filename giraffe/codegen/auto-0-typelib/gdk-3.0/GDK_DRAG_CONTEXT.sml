signature GDK_DRAG_CONTEXT =
  sig
    type 'a class
    type drag_protocol_t
    type 'a window_class
    type drag_action_t
    type 'a device_class
    type t = base class
    val getType : unit -> GObject.Type.t
    val getActions : 'a class -> drag_action_t
    val getDestWindow : 'a class -> base window_class
    val getDevice : 'a class -> base device_class
    val getProtocol : 'a class -> drag_protocol_t
    val getSelectedAction : 'a class -> drag_action_t
    val getSourceWindow : 'a class -> base window_class
    val getSuggestedAction : 'a class -> drag_action_t
    val setDevice :
      'a class
       -> 'b device_class
       -> unit
  end
