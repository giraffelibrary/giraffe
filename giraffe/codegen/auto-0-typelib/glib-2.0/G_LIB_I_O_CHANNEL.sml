signature G_LIB_I_O_CHANNEL =
  sig
    type record_t
    type i_o_condition_t
    type i_o_error_t
    type seek_type_t
    type i_o_flags_t
    type i_o_status_t
    type i_o_channel_error_t
    type t = record_t
    val getType : unit -> GObject.Type.t
    val newFile :
      string
       -> string
       -> record_t
    val unixNew : LargeInt.int -> record_t
    val close : record_t -> unit
    val flush : record_t -> i_o_status_t
    val getBufferCondition : record_t -> i_o_condition_t
    val getBufferSize : record_t -> LargeInt.int
    val getBuffered : record_t -> bool
    val getCloseOnUnref : record_t -> bool
    val getEncoding : record_t -> string
    val getFlags : record_t -> i_o_flags_t
    val init : record_t -> unit
    val seek :
      record_t
       -> LargeInt.int
       -> seek_type_t
       -> i_o_error_t
    val seekPosition :
      record_t
       -> LargeInt.int
       -> seek_type_t
       -> i_o_status_t
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
       -> i_o_status_t
    val setFlags :
      record_t
       -> i_o_flags_t
       -> i_o_status_t
    val setLineTerm :
      record_t
       -> string
       -> LargeInt.int
       -> unit
    val shutdown :
      record_t
       -> bool
       -> i_o_status_t
    val unixGetFd : record_t -> LargeInt.int
    val writeUnichar :
      record_t
       -> char
       -> i_o_status_t
    val errorFromErrno : LargeInt.int -> i_o_channel_error_t
  end
