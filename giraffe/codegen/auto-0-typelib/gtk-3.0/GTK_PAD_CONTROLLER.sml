signature GTK_PAD_CONTROLLER =
  sig
    type 'a class
    type 'a window_class
    type pad_action_type_t
    type t = base class
    val getType : unit -> GObject.Type.t
    val new :
      'a window_class
       * 'b Gio.ActionGroupClass.class
       * 'c Gdk.DeviceClass.class option
       -> base class
    val setAction :
      'a class
       -> pad_action_type_t
           * LargeInt.int
           * LargeInt.int
           * string
           * string
       -> unit
    val actionGroupProp : ('a class, base Gio.ActionGroupClass.class option, 'b Gio.ActionGroupClass.class option) Property.readwrite
    val padProp : ('a class, base Gdk.DeviceClass.class option, 'b Gdk.DeviceClass.class option) Property.readwrite
  end
