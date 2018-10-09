signature GIO_DESKTOP_APP_INFO_LOOKUP_CLASS =
  sig
    type 'a desktop_app_info_lookup
    include
      CLASS
        where type 'a class = 'a desktop_app_info_lookup GObject.ObjectClass.class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
  end
