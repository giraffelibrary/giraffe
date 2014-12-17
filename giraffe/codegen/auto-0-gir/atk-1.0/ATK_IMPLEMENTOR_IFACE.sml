signature ATK_IMPLEMENTOR_IFACE =
  sig
    type 'a class_t
    type t = base class_t
    val getType : unit -> GObject.Type.t
  end
