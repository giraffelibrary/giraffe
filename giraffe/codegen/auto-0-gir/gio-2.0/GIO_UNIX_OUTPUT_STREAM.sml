signature GIO_UNIX_OUTPUT_STREAM =
  sig
    type 'a class
    type 'a pollable_output_stream_class
    type t = base class
    val asPollableOutputStream : 'a class -> base pollable_output_stream_class
    val getType : unit -> GObject.Type.t
    val new :
      LargeInt.int
       -> bool
       -> base class
    val getCloseFd : 'a class -> bool
    val getFd : 'a class -> LargeInt.int
    val setCloseFd :
      'a class
       -> bool
       -> unit
    val closeFdProp : ('a class, bool, bool) Property.readwrite
    val fdProp : ('a class, LargeInt.int, LargeInt.int) Property.readwrite
  end
