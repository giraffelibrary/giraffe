signature GDK_DEVICE_TOOL_CLASS =
  sig
    type 'a device_tool
    include
      CLASS
        where type 'a class = 'a device_tool GObject.ObjectClass.class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
    val toDerived :
      ('a class, 'b) ValueAccessor.t
       -> base class
       -> 'a class
  end
