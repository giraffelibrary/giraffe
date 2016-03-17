signature GTK_WINDOW_GROUP =
  sig
    type 'a class
    type 'a widget_class
    type 'a window_class
    type t = base class
    val getType : unit -> GObject.Type.t
    val new : unit -> base class
    val addWindow :
      'a class
       -> 'b window_class
       -> unit
    val getCurrentDeviceGrab :
      'a class
       -> 'b Gdk.DeviceClass.class
       -> base widget_class
    val getCurrentGrab : 'a class -> base widget_class
    val removeWindow :
      'a class
       -> 'b window_class
       -> unit
  end
