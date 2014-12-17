signature GIO_FILE_OUTPUT_STREAM =
  sig
    type 'a class_t
    type 'a seekableclass_t
    type 'a cancellableclass_t
    type 'a fileinfoclass_t
    type 'a asyncresultclass_t
    type t = base class_t
    val asSeekable : 'a class_t -> base seekableclass_t
    val getType : unit -> GObject.Type.t
    val getEtag : 'a class_t -> string
    val queryInfo :
      'a class_t
       -> string
       -> 'b cancellableclass_t option
       -> base fileinfoclass_t
    val queryInfoFinish :
      'a class_t
       -> 'b asyncresultclass_t
       -> base fileinfoclass_t
  end
