signature GTK_SOURCE_COMPLETION_ITEM =
  sig
    type 'a class
    type 'a completion_proposal_class
    type t = base class
    val asCompletionProposal : 'a class -> base completion_proposal_class
    val getType : unit -> GObject.Type.t
    val new :
      string
       -> string
       -> 'a GdkPixbuf.PixbufClass.class option
       -> string option
       -> base class
    val newFromStock :
      string option
       -> string
       -> string
       -> string option
       -> base class
    val newWithMarkup :
      string
       -> string
       -> 'a GdkPixbuf.PixbufClass.class option
       -> string option
       -> base class
    val iconProp : ('a class, base GdkPixbuf.PixbufClass.class option, 'b GdkPixbuf.PixbufClass.class option) Property.readwrite
    val infoProp : ('a class, string option, string option) Property.readwrite
    val labelProp : ('a class, string option, string option) Property.readwrite
    val markupProp : ('a class, string option, string option) Property.readwrite
    val textProp : ('a class, string option, string option) Property.readwrite
  end
