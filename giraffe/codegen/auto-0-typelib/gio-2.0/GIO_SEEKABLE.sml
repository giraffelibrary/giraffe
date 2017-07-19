signature GIO_SEEKABLE =
  sig
    type 'a class
    type 'a cancellable_class
    type t = base class
    val getType : unit -> GObject.Type.t
    val canSeek : 'a class -> bool
    val canTruncate : 'a class -> bool
    val seek :
      'a class
       -> LargeInt.int
           * GLib.SeekType.t
           * 'b cancellable_class option
       -> bool
    val tell : 'a class -> LargeInt.int
    val truncate :
      'a class
       -> LargeInt.int * 'b cancellable_class option
       -> bool
  end
