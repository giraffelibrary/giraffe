signature GTK_U_I_MANAGER_CLASS =
  sig
    type 'a u_i_manager
    include
      CLASS
        where type 'a class = 'a u_i_manager GObject.ObjectClass.class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
    val toDerived :
      ('a class, 'b) ValueAccessor.t
       -> base class
       -> 'a class
  end
