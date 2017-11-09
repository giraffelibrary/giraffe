signature GTK_SOURCE_COMPLETION_ITEM_CLASS =
  sig
    type 'a completion_item
    include
      CLASS
        where type 'a class = 'a completion_item GObject.ObjectClass.class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
  end
