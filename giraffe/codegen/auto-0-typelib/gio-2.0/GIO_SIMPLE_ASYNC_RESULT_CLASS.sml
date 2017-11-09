signature GIO_SIMPLE_ASYNC_RESULT_CLASS =
  sig
    type 'a simple_async_result
    include
      CLASS
        where type 'a class = 'a simple_async_result GObject.ObjectClass.class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
  end
