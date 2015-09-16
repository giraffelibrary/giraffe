structure GioDataInputStreamClass :>
  GIO_DATA_INPUT_STREAM_CLASS
    where type 'a buffered_input_stream_class_t = 'a GioBufferedInputStreamClass.t
    where type C.notnull = GioBufferedInputStreamClass.C.notnull
    where type 'a C.p = 'a GioBufferedInputStreamClass.C.p =
  struct
    type 'a data_input_stream = unit
    type 'a buffered_input_stream_class_t = 'a GioBufferedInputStreamClass.t
    type 'a t = 'a data_input_stream buffered_input_stream_class_t
    fun toBase obj = obj
    val t = GioBufferedInputStreamClass.t
    val tOpt = GioBufferedInputStreamClass.tOpt
    structure C = GioBufferedInputStreamClass.C
  end
