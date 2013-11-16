signature G_LIB_I_O_CHANNEL =
  sig
    type record_t
    type iochannelerror_t
    type iostatus_t
    type ioflags_t
    type seektype_t
    type ioerror_t
    type iocondition_t
    val getType : unit -> GObject.Type.t
    val newFile :
      string
       -> string
       -> record_t
    val unixNew : FileDesc.t -> record_t
    val close : record_t -> unit
    val flush : record_t -> iostatus_t
    val getBufferCondition : record_t -> iocondition_t
    val getBufferSize : record_t -> LargeInt.int
    val getBuffered : record_t -> bool
    val getCloseOnUnref : record_t -> bool
    val getEncoding : record_t -> string
    val getFlags : record_t -> ioflags_t
    val init : record_t -> unit
    val seek :
      record_t
       -> LargeInt.int
       -> seektype_t
       -> ioerror_t
    val seekPosition :
      record_t
       -> LargeInt.int
       -> seektype_t
       -> iostatus_t
    val setBufferSize :
      record_t
       -> LargeInt.int
       -> unit
    val setBuffered :
      record_t
       -> bool
       -> unit
    val setCloseOnUnref :
      record_t
       -> bool
       -> unit
    val setEncoding :
      record_t
       -> string
       -> iostatus_t
    val setFlags :
      record_t
       -> ioflags_t
       -> iostatus_t
    val setLineTerm :
      record_t
       -> string
       -> LargeInt.int
       -> unit
    val shutdown :
      record_t
       -> bool
       -> iostatus_t
    val unixGetFd : record_t -> FileDesc.t
    val writeUnichar :
      record_t
       -> char
       -> iostatus_t
    val errorFromErrno : LargeInt.int -> iochannelerror_t
  end
