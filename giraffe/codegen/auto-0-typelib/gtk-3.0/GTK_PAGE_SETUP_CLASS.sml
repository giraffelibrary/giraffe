signature GTK_PAGE_SETUP_CLASS =
  sig
    type 'a page_setup
    include
      CLASS
        where type 'a class = 'a page_setup GObject.ObjectClass.class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
  end
