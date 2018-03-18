signature GIO_UNIX_OUTPUT_STREAM =
  sig
    type 'a class
    type 'a file_descriptor_based_class
    type 'a pollable_output_stream_class
    type t = base class
    val asFileDescriptorBased : 'a class -> base file_descriptor_based_class
    val asPollableOutputStream : 'a class -> base pollable_output_stream_class
    val getType : unit -> GObject.Type.t
    val new : LargeInt.int * bool -> base class
    val getCloseFd : 'a class -> bool
    val getFd : 'a class -> LargeInt.int
    val setCloseFd :
      'a class
       -> bool
       -> unit
    val closeFdProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
    val fdProp :
      {
        get : 'a class -> LargeInt.int,
        new : LargeInt.int -> 'a class Property.t
      }
  end
