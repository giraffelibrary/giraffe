signature G_I_REPOSITORY_OBJECT_INFO =
  sig
    type 'a class
    type 'a baseinfo_class
    type 'a interfaceinfo_class
    type 'a fieldinfo_class
    type 'a propertyinfo_class
    type 'a functioninfo_class
    type 'a signalinfo_class
    type 'a vfuncinfo_class
    type 'a constantinfo_class
    type 'a structinfo_class
    val getTypeName : 'a class -> string
    val getTypeInit : 'a class -> string
    val getAbstract : 'a class -> bool
    val getFundamental : 'a class -> bool
    val getParent : 'a class -> base class option
    val getNInterfaces : 'a class -> LargeInt.int
    val getInterface : 'a class -> LargeInt.int -> base interfaceinfo_class
    val getNFields : 'a class -> LargeInt.int
    val getField : 'a class -> LargeInt.int -> base fieldinfo_class
    val getNProperties : 'a class -> LargeInt.int
    val getProperty : 'a class -> LargeInt.int -> base propertyinfo_class
    val getNMethods : 'a class -> LargeInt.int
    val getMethod : 'a class -> LargeInt.int -> base functioninfo_class
    val findMethod : 'a class -> string -> base functioninfo_class
    val getNSignals : 'a class -> LargeInt.int
    val getSignal : 'a class -> LargeInt.int -> base signalinfo_class
    val getNVfuncs : 'a class -> LargeInt.int
    val getVfunc : 'a class -> LargeInt.int -> base vfuncinfo_class
    val getNConstants : 'a class -> LargeInt.int
    val getConstant : 'a class -> LargeInt.int -> base constantinfo_class
    val getClassStruct : 'a class -> base structinfo_class option
    val findVfunc : 'a class -> string -> base vfuncinfo_class
  end
