signature GIO_LOADABLE_ICON =
  sig
    type 'a class_t
    type 'a asyncresultclass_t
    type 'a inputstreamclass_t
    type 'a cancellableclass_t
    val getType : unit -> GObject.Type.t
    val load :
      'a class_t
       -> LargeInt.int
       -> 'b cancellableclass_t option
       -> base inputstreamclass_t * string
    val loadFinish :
      'a class_t
       -> 'b asyncresultclass_t
       -> string
       -> base inputstreamclass_t
  end
