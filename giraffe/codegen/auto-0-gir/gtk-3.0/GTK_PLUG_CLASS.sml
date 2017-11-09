signature GTK_PLUG_CLASS =
  sig
    type 'a plug
    type 'a window_class
    include
      CLASS
        where type 'a class = 'a plug window_class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
  end
