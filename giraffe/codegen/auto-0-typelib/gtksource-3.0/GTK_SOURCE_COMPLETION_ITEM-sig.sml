signature GTK_SOURCE_COMPLETION_ITEM =
  sig
    type 'a class
    type 'a completion_proposal_class
    type t = base class
    val asCompletionProposal : 'a class -> base completion_proposal_class
    val getType : unit -> GObject.Type.t
    val new :
      string
       * string
       * 'a GdkPixbuf.PixbufClass.class option
       * string option
       -> base class
    val newFromStock :
      string option
       * string
       * string
       * string option
       -> base class
    val newWithMarkup :
      string
       * string
       * 'a GdkPixbuf.PixbufClass.class option
       * string option
       -> base class
    val giconProp : ('a class, unit -> base Gio.IconClass.class option, 'b Gio.IconClass.class option -> unit, 'b Gio.IconClass.class option -> unit) Property.t
    val iconProp : ('a class, unit -> base GdkPixbuf.PixbufClass.class option, 'b GdkPixbuf.PixbufClass.class option -> unit, 'b GdkPixbuf.PixbufClass.class option -> unit) Property.t
    val iconNameProp : ('a class, unit -> string option, string option -> unit, string option -> unit) Property.t
    val infoProp : ('a class, unit -> string option, string option -> unit, string option -> unit) Property.t
    val labelProp : ('a class, unit -> string option, string option -> unit, string option -> unit) Property.t
    val markupProp : ('a class, unit -> string option, string option -> unit, string option -> unit) Property.t
    val textProp : ('a class, unit -> string option, string option -> unit, string option -> unit) Property.t
  end
