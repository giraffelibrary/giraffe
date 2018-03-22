signature GIO_UNIX_F_D_LIST_CLASS =
  sig
    type 'a unix_f_d_list
    include
      CLASS
        where type 'a class = 'a unix_f_d_list GObject.ObjectClass.class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
    val toDerived :
      ('a class, 'b) ValueAccessor.t
       -> base class
       -> 'a class
  end
