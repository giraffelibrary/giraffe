structure GioBufferedInputStreamClass :>
  GIO_BUFFERED_INPUT_STREAM_CLASS
    where type 'a filter_input_stream_class = 'a GioFilterInputStreamClass.class
    where type C.notnull = GioFilterInputStreamClass.C.notnull
    where type 'a C.p = 'a GioFilterInputStreamClass.C.p =
  struct
    type 'a filter_input_stream_class = 'a GioFilterInputStreamClass.class
    open GioFilterInputStreamClass
    type 'a buffered_input_stream = unit
    type 'a class = 'a buffered_input_stream class
  end
