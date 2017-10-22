signature GIO_UNIX_INPUT_STREAM =
  sig
    type 'a class
    type 'a file_descriptor_based_class
    type 'a pollable_input_stream_class
    type t = base class
    val asFileDescriptorBased : 'a class -> base file_descriptor_based_class
    val asPollableInputStream : 'a class -> base pollable_input_stream_class
    val getType : unit -> GObject.Type.t
    val new : LargeInt.int * bool -> base class
    val getCloseFd : 'a class -> bool
    val getFd : 'a class -> LargeInt.int
    val setCloseFd :
      'a class
       -> bool
       -> unit
    val closeFdProp : ('a class, bool, bool) Property.readwrite
    val fdProp : ('a class, LargeInt.int, LargeInt.int) Property.readwrite
  end
