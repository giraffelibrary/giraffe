structure GioSimpleAsyncResultClass :>
  GIO_SIMPLE_ASYNC_RESULT_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a simple_async_result = unit
    type 'a class = 'a simple_async_result class
  end
