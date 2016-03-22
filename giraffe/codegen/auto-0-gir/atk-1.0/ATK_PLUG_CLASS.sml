signature ATK_PLUG_CLASS =
  sig
    type 'a plug
    type 'a object_class
    include
      CLASS
        where type 'a class = 'a plug object_class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
  end
