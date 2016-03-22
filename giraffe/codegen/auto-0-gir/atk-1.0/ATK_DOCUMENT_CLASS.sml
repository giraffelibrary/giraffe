signature ATK_DOCUMENT_CLASS =
  sig
    type 'a document
    include
      CLASS
        where type 'a class = 'a document GObject.ObjectClass.class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
  end
