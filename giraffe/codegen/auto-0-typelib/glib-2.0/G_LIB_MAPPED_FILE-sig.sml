signature G_LIB_MAPPED_FILE =
  sig
    type t
    type bytes_t
    val getType : unit -> GObject.Type.t
    val new : string * bool -> t
    val newFromFd : LargeInt.int * bool -> t
    val getBytes : t -> bytes_t
    val getContents : t -> string
    val getLength : t -> LargeInt.int
  end
