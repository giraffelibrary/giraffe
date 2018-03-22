signature GTK_NATIVE_DIALOG_CLASS =
  sig
    type 'a native_dialog
    include
      CLASS
        where type 'a class = 'a native_dialog GObject.ObjectClass.class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
    val toDerived :
      ('a class, 'b) ValueAccessor.t
       -> base class
       -> 'a class
  end
