signature GIO_APP_INFO_CLASS =
  sig
    type 'a app_info
    include
      CLASS
        where type 'a class = 'a app_info GObject.ObjectClass.class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
  end
