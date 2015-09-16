signature GDK_PIXBUF_PIXBUF_LOADER =
  sig
    type 'a class_t
    type 'a pixbuf_animation_class_t
    type pixbuf_format_record_t
    type 'a pixbuf_class_t
    type t = base class_t
    val getType : unit -> GObject.Type.t
    val new : unit -> base class_t
    val newWithMimeType : string -> base class_t
    val newWithType : string -> base class_t
    val close : 'a class_t -> bool
    val getAnimation : 'a class_t -> base pixbuf_animation_class_t
    val getFormat : 'a class_t -> pixbuf_format_record_t
    val getPixbuf : 'a class_t -> base pixbuf_class_t
    val setSize :
      'a class_t
       -> LargeInt.int
       -> LargeInt.int
       -> unit
    val areaPreparedSig : (unit -> unit) -> 'a class_t Signal.signal
    val areaUpdatedSig :
      (LargeInt.int
        -> LargeInt.int
        -> LargeInt.int
        -> LargeInt.int
        -> unit)
       -> 'a class_t Signal.signal
    val closedSig : (unit -> unit) -> 'a class_t Signal.signal
    val sizePreparedSig :
      (LargeInt.int
        -> LargeInt.int
        -> unit)
       -> 'a class_t Signal.signal
  end
