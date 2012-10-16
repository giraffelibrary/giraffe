signature GTK_SOURCE_COMPLETION_PROPOSAL =
  sig
    type 'a class_t
    val getType : unit -> GObject.Type.t
    val changed : 'a class_t -> unit
    val equal :
      'a class_t
       -> 'b class_t
       -> bool
    val getIcon : 'a class_t -> base GdkPixbuf.PixbufClass.t
    val getInfo : 'a class_t -> string
    val getLabel : 'a class_t -> string
    val getMarkup : 'a class_t -> string
    val getText : 'a class_t -> string
    val hash : 'a class_t -> LargeInt.int
    val changedSig : (unit -> unit) -> 'a class_t Signal.signal
  end
