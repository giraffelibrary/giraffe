signature GIO_FILE_OUTPUT_STREAM =
  sig
    type 'a class
    type 'a seekable_class
    type 'a cancellable_class
    type 'a file_info_class
    type 'a async_result_class
    type t = base class
    val asSeekable : 'a class -> base seekable_class
    val getType : unit -> GObject.Type.t
    val getEtag : 'a class -> string
    val queryInfo :
      'a class
       -> string * 'b cancellable_class option
       -> base file_info_class
    val queryInfoFinish :
      'a class
       -> 'b async_result_class
       -> base file_info_class
  end
