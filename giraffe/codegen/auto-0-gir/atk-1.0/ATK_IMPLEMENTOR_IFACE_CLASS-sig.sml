signature ATK_IMPLEMENTOR_IFACE_CLASS =
  sig
    type 'a implementor_iface
    include
      CLASS
        where type 'a class = 'a implementor_iface GObject.ObjectClass.class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
  end
