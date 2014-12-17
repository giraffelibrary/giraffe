signature GTK_SOURCE_COMPLETION_ITEM =
  sig
    type 'a class_t
    type 'a completionproposalclass_t
    type t = base class_t
    val asCompletionProposal : 'a class_t -> base completionproposalclass_t
    val getType : unit -> GObject.Type.t
    val new :
      string
       -> string
       -> 'a GdkPixbuf.PixbufClass.t option
       -> string option
       -> base class_t
    val newFromStock :
      string option
       -> string
       -> string
       -> string option
       -> base class_t
    val newWithMarkup :
      string
       -> string
       -> 'a GdkPixbuf.PixbufClass.t option
       -> string option
       -> base class_t
    val iconProp : ('a class_t, base GdkPixbuf.PixbufClass.t option, 'b GdkPixbuf.PixbufClass.t option) Property.readwrite
    val infoProp : ('a class_t, string option, string option) Property.readwrite
    val labelProp : ('a class_t, string option, string option) Property.readwrite
    val markupProp : ('a class_t, string option, string option) Property.readwrite
    val textProp : ('a class_t, string option, string option) Property.readwrite
  end
