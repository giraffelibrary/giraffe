structure GioFileInputStreamClass :>
  GIO_FILE_INPUT_STREAM_CLASS
    where type 'a input_stream_class = 'a GioInputStreamClass.class
    where type C.notnull = GioInputStreamClass.C.notnull
    where type 'a C.p = 'a GioInputStreamClass.C.p =
  struct
    type 'a file_input_stream = unit
    type 'a input_stream_class = 'a GioInputStreamClass.class
    type 'a class = 'a file_input_stream input_stream_class
    type t = base class
    fun toBase obj = obj
    val t = GioInputStreamClass.t
    val tOpt = GioInputStreamClass.tOpt
    structure C = GioInputStreamClass.C
  end
