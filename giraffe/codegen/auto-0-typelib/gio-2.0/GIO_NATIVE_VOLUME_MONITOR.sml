signature GIO_NATIVE_VOLUME_MONITOR =
  sig
    type 'a class_t
    type t = base class_t
    val getType : unit -> GObject.Type.t
  end
