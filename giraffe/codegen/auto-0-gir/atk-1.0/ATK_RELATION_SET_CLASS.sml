signature ATK_RELATION_SET_CLASS =
  sig
    type 'a relation_set
    include
      CLASS
        where type 'a class = 'a relation_set GObject.ObjectClass.class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
  end
