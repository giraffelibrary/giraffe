signature GIO_I_O_MODULE_CLASS =
  sig
    type 'a i_o_module
    include
      CLASS
        where type 'a class = 'a i_o_module GObject.TypeModuleClass.class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
  end
