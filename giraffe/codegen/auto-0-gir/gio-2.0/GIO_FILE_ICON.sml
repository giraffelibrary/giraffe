signature GIO_FILE_ICON =
  sig
    type 'a class_t
    type 'a icon_class_t
    type 'a loadable_icon_class_t
    type 'a file_class_t
    type t = base class_t
    val asIcon : 'a class_t -> base icon_class_t
    val asLoadableIcon : 'a class_t -> base loadable_icon_class_t
    val getType : unit -> GObject.Type.t
    val getFile : 'a class_t -> base file_class_t
    val fileProp : ('a class_t, base file_class_t option, 'b file_class_t option) Property.readwrite
  end
