signature GIO_FILE_ICON =
  sig
    type 'a class_t
    type 'a iconclass_t
    type 'a loadableiconclass_t
    type 'a fileclass_t
    type t = base class_t
    val asIcon : 'a class_t -> base iconclass_t
    val asLoadableIcon : 'a class_t -> base loadableiconclass_t
    val getType : unit -> GObject.Type.t
    val getFile : 'a class_t -> base fileclass_t
    val fileProp : ('a class_t, base fileclass_t option, 'b fileclass_t option) Property.readwrite
  end
