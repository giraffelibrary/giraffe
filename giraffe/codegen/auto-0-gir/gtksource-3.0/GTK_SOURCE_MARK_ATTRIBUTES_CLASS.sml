signature GTK_SOURCE_MARK_ATTRIBUTES_CLASS =
  sig
    type 'a mark_attributes
    include
      CLASS
        where type 'a class = 'a mark_attributes GObject.ObjectClass.class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
  end
