signature GIO_FILE_ENUMERATOR =
  sig
    type 'a class_t
    type 'a asyncresultclass_t
    type 'a fileinfoclass_t
    type 'a cancellableclass_t
    type 'a fileclass_t
    type t = base class_t
    val getType : unit -> GObject.Type.t
    val close :
      'a class_t
       -> 'b cancellableclass_t option
       -> bool
    val closeFinish :
      'a class_t
       -> 'b asyncresultclass_t
       -> bool
    val getContainer : 'a class_t -> base fileclass_t
    val hasPending : 'a class_t -> bool
    val isClosed : 'a class_t -> bool
    val nextFile :
      'a class_t
       -> 'b cancellableclass_t option
       -> base fileinfoclass_t
    val setPending :
      'a class_t
       -> bool
       -> unit
    val containerProp : ('a class_t, 'b fileclass_t option) Property.writeonly
  end
