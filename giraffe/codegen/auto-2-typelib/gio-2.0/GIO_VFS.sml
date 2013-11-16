signature GIO_VFS =
  sig
    type 'a class_t
    type 'a fileclass_t
    val getType : unit -> GObject.Type.t
    val getDefault : unit -> base class_t
    val getLocal : unit -> base class_t
    val getFileForPath :
      'a class_t
       -> string
       -> base fileclass_t
    val getFileForUri :
      'a class_t
       -> string
       -> base fileclass_t
    val isActive : 'a class_t -> bool
    val parseName :
      'a class_t
       -> string
       -> base fileclass_t
  end
