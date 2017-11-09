signature GTK_EVENT_BOX_CLASS =
  sig
    type 'a event_box
    type 'a bin_class
    include
      CLASS
        where type 'a class = 'a event_box bin_class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
  end
