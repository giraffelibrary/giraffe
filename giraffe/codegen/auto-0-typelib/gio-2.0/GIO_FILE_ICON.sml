signature GIO_FILE_ICON =
  sig
    type 'a class
    type 'a icon_class
    type 'a loadable_icon_class
    type 'a file_class
    type t = base class
    val asIcon : 'a class -> base icon_class
    val asLoadableIcon : 'a class -> base loadable_icon_class
    val getType : unit -> GObject.Type.t
    val new : 'a file_class -> base class
    val getFile : 'a class -> base file_class
    val fileProp : ('a class, base file_class option, 'b file_class option) Property.readwrite
  end
