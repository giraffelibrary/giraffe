structure GioMemoryOutputStreamClass :>
  GIO_MEMORY_OUTPUT_STREAM_CLASS
    where type 'a output_stream_class = 'a GioOutputStreamClass.class
    where type C.notnull = GioOutputStreamClass.C.notnull
    where type 'a C.p = 'a GioOutputStreamClass.C.p =
  struct
    type 'a output_stream_class = 'a GioOutputStreamClass.class
    open GioOutputStreamClass
    type 'a memory_output_stream = unit
    type 'a class = 'a memory_output_stream class
  end
