signature ATK_DOCUMENT_CLASS =
  sig
    type 'a document
    include
      CLASS
        where type 'a class = 'a document GObject.ObjectClass.class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
  end
