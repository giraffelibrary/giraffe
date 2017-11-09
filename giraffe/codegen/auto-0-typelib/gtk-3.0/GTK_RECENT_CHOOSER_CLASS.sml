signature GTK_RECENT_CHOOSER_CLASS =
  sig
    type 'a recent_chooser
    include
      CLASS
        where type 'a class = 'a recent_chooser GObject.ObjectClass.class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
  end
