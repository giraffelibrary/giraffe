signature GIO_DESKTOP_APP_INFO_LOOKUP =
  sig
    type 'a class
    type t = base class
    val getType : unit -> GObject.Type.t
  end
