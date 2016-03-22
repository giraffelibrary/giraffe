signature GTK_APP_CHOOSER_CLASS =
  sig
    type 'a app_chooser
    include
      CLASS
        where type 'a class = 'a app_chooser GObject.ObjectClass.class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
  end
