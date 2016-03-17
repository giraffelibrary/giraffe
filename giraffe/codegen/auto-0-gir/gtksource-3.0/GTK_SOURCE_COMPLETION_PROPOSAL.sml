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
    val getIcon : 'a class -> base GdkPixbuf.PixbufClass.class
    val getInfo : 'a class -> string
    val getLabel : 'a class -> string
    val getMarkup : 'a class -> string
    val getText : 'a class -> string
    val hash : 'a class -> LargeInt.int
    val changedSig : (unit -> unit) -> 'a class Signal.signal
  end
