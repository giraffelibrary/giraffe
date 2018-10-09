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
    val actionGroupProp :
      {
        get : 'a class -> base Gio.ActionGroupClass.class option,
        new : 'b Gio.ActionGroupClass.class option -> 'a class Property.t
      }
    val padProp :
      {
        get : 'a class -> base Gdk.DeviceClass.class option,
        new : 'b Gdk.DeviceClass.class option -> 'a class Property.t
      }
  end
