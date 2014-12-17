signature GTK_WINDOW_GROUP =
  sig
    type 'a class_t
    type 'a widgetclass_t
    type 'a windowclass_t
    type t = base class_t
    val getType : unit -> GObject.Type.t
    val new : unit -> base class_t
    val addWindow :
      'a class_t
       -> 'b windowclass_t
       -> unit
    val getCurrentDeviceGrab :
      'a class_t
       -> 'b Gdk.DeviceClass.t
       -> base widgetclass_t
    val getCurrentGrab : 'a class_t -> base widgetclass_t
    val removeWindow :
      'a class_t
       -> 'b windowclass_t
       -> unit
  end
