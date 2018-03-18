signature GIO_BYTES_ICON =
  sig
    type 'a class
    type 'a icon_class
    type 'a loadable_icon_class
    type t = base class
    val asIcon : 'a class -> base icon_class
    val asLoadableIcon : 'a class -> base loadable_icon_class
    val getType : unit -> GObject.Type.t
    val new : GLib.BytesRecord.t -> base class
    val getBytes : 'a class -> GLib.BytesRecord.t
    val bytesProp :
      {
        get : 'a class -> GLib.BytesRecord.t option,
        new : GLib.BytesRecord.t option -> 'a class Property.t
      }
  end
