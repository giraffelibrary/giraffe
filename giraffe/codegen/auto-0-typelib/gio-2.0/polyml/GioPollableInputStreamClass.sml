structure GioPollableInputStreamClass :>
  GIO_POLLABLE_INPUT_STREAM_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a pollable_input_stream = unit
    type 'a class = 'a pollable_input_stream class
  end
