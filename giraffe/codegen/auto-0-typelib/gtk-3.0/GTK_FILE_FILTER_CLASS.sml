signature GTK_FILE_FILTER_CLASS =
  sig
    type 'a file_filter
    include
      CLASS
        where type 'a class = 'a file_filter GObject.InitiallyUnownedClass.class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
  end
