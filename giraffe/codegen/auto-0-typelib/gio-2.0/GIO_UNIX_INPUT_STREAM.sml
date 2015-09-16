signature GIO_UNIX_INPUT_STREAM =
  sig
    type 'a class_t
    type 'a pollable_input_stream_class_t
    type t = base class_t
    val asPollableInputStream : 'a class_t -> base pollable_input_stream_class_t
    val getType : unit -> GObject.Type.t
    val new :
      LargeInt.int
       -> bool
       -> base class_t
    val getCloseFd : 'a class_t -> bool
    val getFd : 'a class_t -> LargeInt.int
    val setCloseFd :
      'a class_t
       -> bool
       -> unit
    val closeFdProp : ('a class_t, bool, bool) Property.readwrite
    val fdProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
  end
