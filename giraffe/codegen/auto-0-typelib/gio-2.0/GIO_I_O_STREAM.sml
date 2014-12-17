signature GIO_I_O_STREAM =
  sig
    type 'a class_t
    type 'a cancellableclass_t
    type 'a asyncresultclass_t
    type 'a inputstreamclass_t
    type 'a outputstreamclass_t
    type t = base class_t
    val getType : unit -> GObject.Type.t
    val spliceFinish : 'a asyncresultclass_t -> bool
    val clearPending : 'a class_t -> unit
    val close :
      'a class_t
       -> 'b cancellableclass_t option
       -> bool
    val closeFinish :
      'a class_t
       -> 'b asyncresultclass_t
       -> bool
    val getInputStream : 'a class_t -> base inputstreamclass_t
    val getOutputStream : 'a class_t -> base outputstreamclass_t
    val hasPending : 'a class_t -> bool
    val isClosed : 'a class_t -> bool
    val setPending : 'a class_t -> bool
    val closedProp : ('a class_t, bool, bool) Property.readwrite
    val inputStreamProp : ('a class_t, base inputstreamclass_t option) Property.readonly
    val outputStreamProp : ('a class_t, base outputstreamclass_t option) Property.readonly
  end
