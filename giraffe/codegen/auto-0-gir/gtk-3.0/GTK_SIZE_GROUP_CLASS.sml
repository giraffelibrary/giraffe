signature GTK_SIZE_GROUP_CLASS =
  sig
    type 'a size_group
    include
      CLASS
        where type 'a class = 'a size_group GObject.ObjectClass.class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
  end
