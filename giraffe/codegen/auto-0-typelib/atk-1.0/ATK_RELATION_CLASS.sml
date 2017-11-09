signature ATK_RELATION_CLASS =
  sig
    type 'a relation
    include
      CLASS
        where type 'a class = 'a relation GObject.ObjectClass.class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
  end
