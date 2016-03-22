structure GioOutputStreamClass :>
  GIO_OUTPUT_STREAM_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a output_stream = unit
    type 'a class = 'a output_stream class
  end
