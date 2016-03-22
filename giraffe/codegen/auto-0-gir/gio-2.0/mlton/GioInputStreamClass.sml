structure GioInputStreamClass :>
  GIO_INPUT_STREAM_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a input_stream = unit
    type 'a class = 'a input_stream class
  end
