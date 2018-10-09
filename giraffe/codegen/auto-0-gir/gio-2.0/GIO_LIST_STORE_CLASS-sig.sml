signature GIO_LIST_STORE_CLASS =
  sig
    type 'a list_store
    include
      CLASS
        where type 'a class = 'a list_store GObject.ObjectClass.class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
    val toDerived :
      ('a class, 'b) ValueAccessor.t
       -> base class
       -> 'a class
  end
