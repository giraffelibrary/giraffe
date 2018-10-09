signature GIO_LIST_MODEL_CLASS =
  sig
    type 'a list_model
    include
      CLASS
        where type 'a class = 'a list_model GObject.ObjectClass.class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
  end
