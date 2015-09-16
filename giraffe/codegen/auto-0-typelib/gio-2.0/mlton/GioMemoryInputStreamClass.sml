structure GioMemoryInputStreamClass :>
  GIO_MEMORY_INPUT_STREAM_CLASS
    where type 'a input_stream_class_t = 'a GioInputStreamClass.t
    where type C.notnull = GioInputStreamClass.C.notnull
    where type 'a C.p = 'a GioInputStreamClass.C.p =
  struct
    type 'a memory_input_stream = unit
    type 'a input_stream_class_t = 'a GioInputStreamClass.t
    type 'a t = 'a memory_input_stream input_stream_class_t
    fun toBase obj = obj
    val t = GioInputStreamClass.t
    val tOpt = GioInputStreamClass.tOpt
    structure C = GioInputStreamClass.C
  end
