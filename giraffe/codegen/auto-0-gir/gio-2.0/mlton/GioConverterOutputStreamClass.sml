structure GioConverterOutputStreamClass :>
  GIO_CONVERTER_OUTPUT_STREAM_CLASS
    where type 'a filteroutputstreamclass_t = 'a GioFilterOutputStreamClass.t
    where type C.notnull = GioFilterOutputStreamClass.C.notnull
    where type 'a C.p = 'a GioFilterOutputStreamClass.C.p =
  struct
    type 'a converteroutputstream = unit
    type 'a filteroutputstreamclass_t = 'a GioFilterOutputStreamClass.t
    type 'a t = 'a converteroutputstream filteroutputstreamclass_t
    fun toBase obj = obj
    val t = GioFilterOutputStreamClass.t
    val tOpt = GioFilterOutputStreamClass.tOpt
    structure C = GioFilterOutputStreamClass.C
  end
