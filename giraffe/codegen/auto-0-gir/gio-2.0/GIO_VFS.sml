signature GIO_VFS =
  sig
    type 'a class
    type 'a file_class
    type t = base class
    val getType : unit -> GObject.Type.t
    val getDefault : unit -> base class
    val getLocal : unit -> base class
    val getFileForPath :
      'a class
       -> string
       -> base file_class
    val getFileForUri :
      'a class
       -> string
       -> base file_class
    val isActive : 'a class -> bool
    val parseName :
      'a class
       -> string
       -> base file_class
  end
