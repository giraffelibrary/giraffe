signature ATK_HYPERLINK_IMPL =
  sig
    type 'a class_t
    type 'a hyperlinkclass_t
    val getType : unit -> GObject.Type.t
    val getHyperlink : 'a class_t -> base hyperlinkclass_t
  end
