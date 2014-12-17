signature GDK_PIXBUF_PIXBUF_LOADER =
  sig
    type 'a class_t
    type 'a pixbufanimationclass_t
    type pixbufformatrecord_t
    type 'a pixbufclass_t
    type t = base class_t
    val getType : unit -> GObject.Type.t
    val new : unit -> base class_t
    val newWithMimeType : string -> base class_t
    val newWithType : string -> base class_t
    val close : 'a class_t -> bool
    val getAnimation : 'a class_t -> base pixbufanimationclass_t
    val getFormat : 'a class_t -> pixbufformatrecord_t
    val getPixbuf : 'a class_t -> base pixbufclass_t
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
