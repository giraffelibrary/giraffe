signature GDK_PIXBUF_PIXBUF_LOADER =
  sig
    type 'a class
    type 'a pixbuf_animation_class
    type pixbuf_format_t
    type 'a pixbuf_class
    type t = base class
    val getType : unit -> GObject.Type.t
    val new : unit -> base class
    val newWithMimeType : string -> base class
    val newWithType : string -> base class
    val close : 'a class -> unit
    val getAnimation : 'a class -> base pixbuf_animation_class
    val getFormat : 'a class -> pixbuf_format_t option
    val getPixbuf : 'a class -> base pixbuf_class
    val setSize :
      'a class
       -> LargeInt.int * LargeInt.int
       -> unit
    val write :
      'a class
       -> Word8Vector.vector
       -> unit
    val writeBytes :
      'a class
       -> GLib.BytesRecord.t
       -> unit
    val areaPreparedSig : (unit -> unit) -> 'a class Signal.t
    val areaUpdatedSig :
      (LargeInt.int
        * LargeInt.int
        * LargeInt.int
        * LargeInt.int
        -> unit)
       -> 'a class Signal.t
    val closedSig : (unit -> unit) -> 'a class Signal.t
    val sizePreparedSig : (LargeInt.int * LargeInt.int -> unit) -> 'a class Signal.t
  end
