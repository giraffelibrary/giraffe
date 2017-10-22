signature GTK_SOURCE_REGION_CLASS =
  sig
    type 'a region
    include
      CLASS
        where type 'a class = 'a region GObject.ObjectClass.class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
  end
