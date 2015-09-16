signature GTK_WINDOW_GROUP =
  sig
    type 'a class_t
    type 'a widget_class_t
    type 'a window_class_t
    type t = base class_t
    val getType : unit -> GObject.Type.t
    val new : unit -> base class_t
    val addWindow :
      'a class_t
       -> 'b window_class_t
       -> unit
    val getCurrentDeviceGrab :
      'a class_t
       -> 'b Gdk.DeviceClass.t
       -> base widget_class_t
    val getCurrentGrab : 'a class_t -> base widget_class_t
    val removeWindow :
      'a class_t
       -> 'b window_class_t
       -> unit
  end
