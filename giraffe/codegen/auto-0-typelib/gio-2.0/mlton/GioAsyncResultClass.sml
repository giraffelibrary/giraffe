structure GioAsyncResultClass :>
  GIO_ASYNC_RESULT_CLASS
    where type C.opt = GObjectObjectClass.C.opt
    where type C.non_opt = GObjectObjectClass.C.non_opt
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a async_result = unit
    type 'a class = 'a async_result class
  end
