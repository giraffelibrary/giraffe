structure GioFilterInputStreamClass :>
  GIO_FILTER_INPUT_STREAM_CLASS
    where type 'a input_stream_class = 'a GioInputStreamClass.class
    where type C.notnull = GioInputStreamClass.C.notnull
    where type 'a C.p = 'a GioInputStreamClass.C.p =
  struct
    type 'a input_stream_class = 'a GioInputStreamClass.class
    open GioInputStreamClass
    type 'a filter_input_stream = unit
    type 'a class = 'a filter_input_stream class
  end
