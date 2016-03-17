signature ATK_REGISTRY =
  sig
    type 'a class
    type t = base class
    val getType : unit -> GObject.Type.t
  end
