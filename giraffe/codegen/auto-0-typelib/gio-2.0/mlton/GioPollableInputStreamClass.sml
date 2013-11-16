structure GioPollableInputStreamClass :>
  GIO_POLLABLE_INPUT_STREAM_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    type 'a pollableinputstream = unit
    type 'a t = 'a pollableinputstream GObjectObjectClass.t
    fun toBase obj = obj
    val t = GObjectObjectClass.t
    val tOpt = GObjectObjectClass.tOpt
    structure C = GObjectObjectClass.C
  end
