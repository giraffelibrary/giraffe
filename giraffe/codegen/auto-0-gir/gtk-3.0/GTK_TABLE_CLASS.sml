signature GTK_TABLE_CLASS =
  sig
    type 'a table
    type 'a container_class
    include
      CLASS
        where type 'a class = 'a table container_class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
  end
