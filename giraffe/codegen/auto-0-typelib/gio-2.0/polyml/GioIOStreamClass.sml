structure GioIOStreamClass :>
  GIO_I_O_STREAM_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a i_o_stream = unit
    type 'a class = 'a i_o_stream class
  end
