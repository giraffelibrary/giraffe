signature GIO_FILE_ENUMERATOR =
  sig
    type 'a class_t
    type 'a async_result_class_t
    type 'a file_info_class_t
    type 'a cancellable_class_t
    type 'a file_class_t
    type t = base class_t
    val getType : unit -> GObject.Type.t
    val close :
      'a class_t
       -> 'b cancellable_class_t option
       -> bool
    val closeFinish :
      'a class_t
       -> 'b async_result_class_t
       -> bool
    val getContainer : 'a class_t -> base file_class_t
    val hasPending : 'a class_t -> bool
    val isClosed : 'a class_t -> bool
    val nextFile :
      'a class_t
       -> 'b cancellable_class_t option
       -> base file_info_class_t
    val setPending :
      'a class_t
       -> bool
       -> unit
    val containerProp : ('a class_t, 'b file_class_t option) Property.writeonly
  end
