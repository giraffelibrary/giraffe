signature GTK_SEARCH_ENTRY_CLASS =
  sig
    type 'a search_entry
    type 'a entry_class
    include
      CLASS
        where type 'a class = 'a search_entry entry_class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
  end
