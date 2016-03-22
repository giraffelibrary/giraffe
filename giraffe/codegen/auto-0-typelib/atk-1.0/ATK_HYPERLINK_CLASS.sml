signature ATK_HYPERLINK_CLASS =
  sig
    type 'a hyperlink
    include
      CLASS
        where type 'a class = 'a hyperlink GObject.ObjectClass.class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
  end
