signature G_LIB_I_O_CHANNEL =
  sig
    type t
    type i_o_condition_t
    type i_o_error_t
    type seek_type_t
    type i_o_flags_t
    type i_o_status_t
    type i_o_channel_error_t
    val getType : unit -> GObject.Type.t
    val newFile : string * string -> t
    val unixNew : GFileDesc.t -> t
    val close : t -> unit
    val flush : t -> i_o_status_t
    val getBufferCondition : t -> i_o_condition_t
    val getBufferSize : t -> int
    val getBuffered : t -> bool
    val getCloseOnUnref : t -> bool
    val getEncoding : t -> string
    val getFlags : t -> i_o_flags_t
    val init : t -> unit
    val readChars :
      t
       -> int
       -> i_o_status_t
           * GUInt8CArrayN.t
           * int
    val readLine :
      t
       -> i_o_status_t
           * string
           * int
           * int
    val readToEnd : t -> i_o_status_t * GUInt8CArrayN.t
    val readUnichar : t -> i_o_status_t * char
    val seek :
      t
       -> LargeInt.int * seek_type_t
       -> i_o_error_t
    val seekPosition :
      t
       -> LargeInt.int * seek_type_t
       -> i_o_status_t
    val setBufferSize :
      t
       -> int
       -> unit
    val setBuffered :
      t
       -> bool
       -> unit
    val setCloseOnUnref :
      t
       -> bool
       -> unit
    val setEncoding :
      t
       -> string option
       -> i_o_status_t
    val setFlags :
      t
       -> i_o_flags_t
       -> i_o_status_t
    val setLineTerm :
      t
       -> string option * LargeInt.int
       -> unit
    val shutdown :
      t
       -> bool
       -> i_o_status_t
    val unixGetFd : t -> GFileDesc.t
    val writeUnichar :
      t
       -> char
       -> i_o_status_t
    val errorFromErrno : LargeInt.int -> i_o_channel_error_t
  end
