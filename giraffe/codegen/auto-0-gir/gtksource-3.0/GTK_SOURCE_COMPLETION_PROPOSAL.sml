signature GTK_SOURCE_COMPLETION_PROPOSAL =
  sig
    type 'a class
    type t = base class
    val getType : unit -> GObject.Type.t
    val changed : 'a class -> unit
    val equal :
      'a class
       -> 'b class
       -> bool
    val getGicon : 'a class -> base Gio.IconClass.class option
    val getIcon : 'a class -> base GdkPixbuf.PixbufClass.class option
    val getIconName : 'a class -> string option
    val getInfo : 'a class -> string option
    val getLabel : 'a class -> string
    val getMarkup : 'a class -> string
    val getText : 'a class -> string
    val hash : 'a class -> LargeInt.int
    val changedSig : (unit -> unit) -> 'a class Signal.t
  end
