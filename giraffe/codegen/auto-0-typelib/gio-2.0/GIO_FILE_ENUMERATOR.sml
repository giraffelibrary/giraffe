signature GIO_FILE_ENUMERATOR =
  sig
    type 'a class
    type 'a async_result_class
    type 'a file_info_class
    type 'a cancellable_class
    type 'a file_class
    type t = base class
    val getType : unit -> GObject.Type.t
    val close :
      'a class
       -> 'b cancellable_class option
       -> unit
    val closeFinish :
      'a class
       -> 'b async_result_class
       -> unit
    val getContainer : 'a class -> base file_class
    val hasPending : 'a class -> bool
    val isClosed : 'a class -> bool
    val nextFile :
      'a class
       -> 'b cancellable_class option
       -> base file_info_class
    val setPending :
      'a class
       -> bool
       -> unit
    val containerProp : ('a class, 'b file_class option) Property.writeonly
  end
