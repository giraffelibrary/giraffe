signature ATK_TABLE_CLASS =
  sig
    type 'a table
    include
      CLASS
        where type 'a class = 'a table GObject.ObjectClass.class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
  end
