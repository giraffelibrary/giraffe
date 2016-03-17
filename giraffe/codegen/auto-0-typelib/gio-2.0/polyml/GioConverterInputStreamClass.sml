structure GioConverterInputStreamClass :>
  GIO_CONVERTER_INPUT_STREAM_CLASS
    where type 'a filter_input_stream_class = 'a GioFilterInputStreamClass.class
    where type C.notnull = GioFilterInputStreamClass.C.notnull
    where type 'a C.p = 'a GioFilterInputStreamClass.C.p =
  struct
    type 'a converter_input_stream = unit
    type 'a filter_input_stream_class = 'a GioFilterInputStreamClass.class
    type 'a class = 'a converter_input_stream filter_input_stream_class
    type t = base class
    fun toBase obj = obj
    val t = GioFilterInputStreamClass.t
    val tOpt = GioFilterInputStreamClass.tOpt
    structure C = GioFilterInputStreamClass.C
  end
