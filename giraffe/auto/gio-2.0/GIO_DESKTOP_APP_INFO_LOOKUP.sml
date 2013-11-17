signature GIO_DESKTOP_APP_INFO_LOOKUP =
  sig
    type 'a class_t
    val getType : unit -> GObject.Type.t
  end
