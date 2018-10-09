signature GIO_FILE_DESCRIPTOR_BASED =
  sig
    type 'a class
    type t = base class
    val getType : unit -> GObject.Type.t
    val getFd : 'a class -> LargeInt.int
  end
