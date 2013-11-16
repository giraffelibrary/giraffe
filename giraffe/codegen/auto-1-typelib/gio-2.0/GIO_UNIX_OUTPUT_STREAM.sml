signature GIO_UNIX_OUTPUT_STREAM =
  sig
    type 'a class_t
    type 'a pollableoutputstreamclass_t
    val asPollableOutputStream : 'a class_t -> base pollableoutputstreamclass_t
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
