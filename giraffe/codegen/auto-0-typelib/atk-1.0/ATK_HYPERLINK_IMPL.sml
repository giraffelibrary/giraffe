signature ATK_HYPERLINK_IMPL =
  sig
    type 'a class_t
    type 'a hyperlink_class_t
    type t = base class_t
    val getType : unit -> GObject.Type.t
    val getHyperlink : 'a class_t -> base hyperlink_class_t
  end
