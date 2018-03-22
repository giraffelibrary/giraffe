signature GIO_I_O_MODULE_CLASS =
  sig
    type 'a i_o_module
    include
      CLASS
        where type 'a class = 'a i_o_module GObject.TypeModuleClass.class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
    val toDerived :
      ('a class, 'b) ValueAccessor.t
       -> base class
       -> 'a class
  end
