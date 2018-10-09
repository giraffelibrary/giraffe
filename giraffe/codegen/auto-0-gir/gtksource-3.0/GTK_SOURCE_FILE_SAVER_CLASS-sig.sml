signature GTK_SOURCE_FILE_SAVER_CLASS =
  sig
    type 'a file_saver
    include
      CLASS
        where type 'a class = 'a file_saver GObject.ObjectClass.class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
    val toDerived :
      ('a class, 'b) ValueAccessor.t
       -> base class
       -> 'a class
  end
