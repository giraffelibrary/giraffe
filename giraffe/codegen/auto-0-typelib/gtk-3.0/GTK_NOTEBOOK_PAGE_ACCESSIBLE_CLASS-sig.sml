signature GTK_NOTEBOOK_PAGE_ACCESSIBLE_CLASS =
  sig
    type 'a notebook_page_accessible
    include
      CLASS
        where type 'a class = 'a notebook_page_accessible Atk.ObjectClass.class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
    val toDerived :
      ('a class, 'b) ValueAccessor.t
       -> base class
       -> 'a class
  end
