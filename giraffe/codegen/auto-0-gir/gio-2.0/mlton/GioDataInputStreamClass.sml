structure GioDataInputStreamClass :>
  GIO_DATA_INPUT_STREAM_CLASS
    where type 'a buffered_input_stream_class = 'a GioBufferedInputStreamClass.class
    where type C.notnull = GioBufferedInputStreamClass.C.notnull
    where type 'a C.p = 'a GioBufferedInputStreamClass.C.p =
  struct
    type 'a buffered_input_stream_class = 'a GioBufferedInputStreamClass.class
    open GioBufferedInputStreamClass
    type 'a data_input_stream = unit
    type 'a class = 'a data_input_stream class
  end
