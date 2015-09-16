structure GioFileIOStreamClass :>
  GIO_FILE_I_O_STREAM_CLASS
    where type 'a i_o_stream_class_t = 'a GioIOStreamClass.t
    where type C.notnull = GioIOStreamClass.C.notnull
    where type 'a C.p = 'a GioIOStreamClass.C.p =
  struct
    type 'a file_i_o_stream = unit
    type 'a i_o_stream_class_t = 'a GioIOStreamClass.t
    type 'a t = 'a file_i_o_stream i_o_stream_class_t
    fun toBase obj = obj
    val t = GioIOStreamClass.t
    val tOpt = GioIOStreamClass.tOpt
    structure C = GioIOStreamClass.C
  end
