signature GTK_ENTRY_COMPLETION_CLASS =
  sig
    type 'a entry_completion
    include
      CLASS
        where type 'a class = 'a entry_completion GObject.ObjectClass.class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
    val toDerived :
      ('a class, 'b) ValueAccessor.t
       -> base class
       -> 'a class
  end
