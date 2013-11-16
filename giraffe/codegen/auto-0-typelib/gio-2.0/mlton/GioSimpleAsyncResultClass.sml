structure GioSimpleAsyncResultClass :>
  GIO_SIMPLE_ASYNC_RESULT_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    type 'a simpleasyncresult = unit
    type 'a t = 'a simpleasyncresult GObjectObjectClass.t
    fun toBase obj = obj
    val t = GObjectObjectClass.t
    val tOpt = GObjectObjectClass.tOpt
    structure C = GObjectObjectClass.C
  end
