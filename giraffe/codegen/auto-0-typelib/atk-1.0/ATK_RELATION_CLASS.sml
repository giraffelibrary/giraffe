signature ATK_RELATION_CLASS =
  sig
    type 'a relation
    include
      CLASS
        where type 'a class = 'a relation GObject.ObjectClass.class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
  end
