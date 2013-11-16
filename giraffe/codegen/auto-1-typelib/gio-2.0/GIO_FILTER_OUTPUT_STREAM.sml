signature GIO_FILTER_OUTPUT_STREAM =
  sig
    type 'a class_t
    type 'a outputstreamclass_t
    val getType : unit -> GObject.Type.t
    val getBaseStream : 'a class_t -> base outputstreamclass_t
    val getCloseBaseStream : 'a class_t -> bool
    val setCloseBaseStream :
      'a class_t
       -> bool
       -> unit
    val baseStreamProp : ('a class_t, base outputstreamclass_t option, 'b outputstreamclass_t option) Property.readwrite
    val closeBaseStreamProp : ('a class_t, bool, bool) Property.readwrite
  end
