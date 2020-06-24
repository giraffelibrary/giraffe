structure GioPollableInputStreamClass :>
  GIO_POLLABLE_INPUT_STREAM_CLASS
    where type C.opt = GObjectObjectClass.C.opt
    where type C.non_opt = GObjectObjectClass.C.non_opt
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a pollable_input_stream = unit
    type 'a class = 'a pollable_input_stream class
  end
