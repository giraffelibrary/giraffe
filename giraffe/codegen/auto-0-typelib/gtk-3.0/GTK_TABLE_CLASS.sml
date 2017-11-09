signature GTK_TABLE_CLASS =
  sig
    type 'a table
    type 'a container_class
    include
      CLASS
        where type 'a class = 'a table container_class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
  end
