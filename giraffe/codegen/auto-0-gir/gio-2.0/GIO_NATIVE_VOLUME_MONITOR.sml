signature GIO_NATIVE_VOLUME_MONITOR =
  sig
    type 'a class
    type t = base class
    val getType : unit -> GObject.Type.t
  end
