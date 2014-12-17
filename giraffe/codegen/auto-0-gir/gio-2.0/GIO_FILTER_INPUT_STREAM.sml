signature GIO_FILTER_INPUT_STREAM =
  sig
    type 'a class_t
    type 'a inputstreamclass_t
    type t = base class_t
    val getType : unit -> GObject.Type.t
    val getBaseStream : 'a class_t -> base inputstreamclass_t
    val getCloseBaseStream : 'a class_t -> bool
    val setCloseBaseStream :
      'a class_t
       -> bool
       -> unit
    val baseStreamProp : ('a class_t, base inputstreamclass_t option, 'b inputstreamclass_t option) Property.readwrite
    val closeBaseStreamProp : ('a class_t, bool, bool) Property.readwrite
  end
