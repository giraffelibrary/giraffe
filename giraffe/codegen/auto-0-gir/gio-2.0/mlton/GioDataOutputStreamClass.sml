structure GioDataOutputStreamClass :>
  GIO_DATA_OUTPUT_STREAM_CLASS
    where type 'a filter_output_stream_class = 'a GioFilterOutputStreamClass.class
    where type C.notnull = GioFilterOutputStreamClass.C.notnull
    where type 'a C.p = 'a GioFilterOutputStreamClass.C.p =
  struct
    type 'a filter_output_stream_class = 'a GioFilterOutputStreamClass.class
    open GioFilterOutputStreamClass
    type 'a data_output_stream = unit
    type 'a class = 'a data_output_stream class
  end
