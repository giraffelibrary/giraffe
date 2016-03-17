structure GioDataInputStreamClass :>
  GIO_DATA_INPUT_STREAM_CLASS
    where type 'a buffered_input_stream_class = 'a GioBufferedInputStreamClass.class
    where type C.notnull = GioBufferedInputStreamClass.C.notnull
    where type 'a C.p = 'a GioBufferedInputStreamClass.C.p =
  struct
    type 'a data_input_stream = unit
    type 'a buffered_input_stream_class = 'a GioBufferedInputStreamClass.class
    type 'a class = 'a data_input_stream buffered_input_stream_class
    type t = base class
    fun toBase obj = obj
    val t = GioBufferedInputStreamClass.t
    val tOpt = GioBufferedInputStreamClass.tOpt
    structure C = GioBufferedInputStreamClass.C
  end
