signature GIO_SEEKABLE =
  sig
    type 'a class_t
    type 'a cancellableclass_t
    val getType : unit -> GObject.Type.t
    val canSeek : 'a class_t -> bool
    val canTruncate : 'a class_t -> bool
    val seek :
      'a class_t
       -> LargeInt.int
       -> GLib.SeekType.t
       -> 'b cancellableclass_t option
       -> bool
    val tell : 'a class_t -> LargeInt.int
    val truncate :
      'a class_t
       -> LargeInt.int
       -> 'b cancellableclass_t option
       -> bool
  end
