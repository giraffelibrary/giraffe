signature ATK_HYPERLINK_IMPL =
  sig
    type 'a class
    type 'a hyperlink_class
    type t = base class
    val getType : unit -> GObject.Type.t
    val getHyperlink : 'a class -> base hyperlink_class
  end
