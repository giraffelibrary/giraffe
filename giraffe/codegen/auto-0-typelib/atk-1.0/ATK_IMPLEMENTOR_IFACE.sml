signature ATK_IMPLEMENTOR_IFACE =
  sig
    type 'a class_t
    val getType : unit -> GObject.Type.t
  end
