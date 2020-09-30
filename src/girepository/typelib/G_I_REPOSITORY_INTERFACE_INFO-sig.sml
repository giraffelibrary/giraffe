signature G_I_REPOSITORY_INTERFACE_INFO =
  sig
    type 'a class
    type 'a baseinfo_class
    type 'a propertyinfo_class
    type 'a functioninfo_class
    type 'a signalinfo_class
    type 'a vfuncinfo_class
    type 'a constantinfo_class
    type 'a structinfo_class
    val getNPrerequisites : 'a class -> LargeInt.int
    val getPrerequisite : 'a class -> LargeInt.int -> base baseinfo_class
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
    val getIfaceStruct : 'a class -> base structinfo_class option
    val findVfunc : 'a class -> string -> base vfuncinfo_class
  end
