signature GTK_SOURCE_COMPLETION_ITEM_CLASS =
  sig
    type 'a completion_item
    include
      CLASS
        where type 'a class = 'a completion_item GObject.ObjectClass.class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
  end
