structure GioSimpleIOStreamClass :>
  GIO_SIMPLE_I_O_STREAM_CLASS
    where type 'a i_o_stream_class = 'a GioIOStreamClass.class
    where type C.notnull = GioIOStreamClass.C.notnull
    where type 'a C.p = 'a GioIOStreamClass.C.p =
  struct
    type 'a i_o_stream_class = 'a GioIOStreamClass.class
    open GioIOStreamClass
    type 'a simple_i_o_stream = unit
    type 'a class = 'a simple_i_o_stream class
  end
