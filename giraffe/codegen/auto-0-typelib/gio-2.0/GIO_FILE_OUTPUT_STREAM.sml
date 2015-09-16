signature GIO_FILE_OUTPUT_STREAM =
  sig
    type 'a class_t
    type 'a seekable_class_t
    type 'a cancellable_class_t
    type 'a file_info_class_t
    type 'a async_result_class_t
    type t = base class_t
    val asSeekable : 'a class_t -> base seekable_class_t
    val getType : unit -> GObject.Type.t
    val getEtag : 'a class_t -> string
    val queryInfo :
      'a class_t
       -> string
       -> 'b cancellable_class_t option
       -> base file_info_class_t
    val queryInfoFinish :
      'a class_t
       -> 'b async_result_class_t
       -> base file_info_class_t
  end
