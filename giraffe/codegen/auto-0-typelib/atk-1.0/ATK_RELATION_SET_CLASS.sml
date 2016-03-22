signature ATK_RELATION_SET_CLASS =
  sig
    type 'a relation_set
    include
      CLASS
        where type 'a class = 'a relation_set GObject.ObjectClass.class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
  end
