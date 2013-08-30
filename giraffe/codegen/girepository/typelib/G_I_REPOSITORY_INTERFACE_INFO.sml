signature G_I_REPOSITORY_INTERFACE_INFO =
  sig
    type 'a class_t
    type 'a baseinfoclass_t
    type 'a propertyinfoclass_t
    type 'a functioninfoclass_t
    type 'a signalinfoclass_t
    type 'a vfuncinfoclass_t
    type 'a constantinfoclass_t
    type 'a structinfoclass_t
    val getNPrerequisites : 'a class_t -> LargeInt.int
    val getPrerequisite : 'a class_t -> LargeInt.int -> base baseinfoclass_t
    val getNProperties : 'a class_t -> LargeInt.int
    val getProperty : 'a class_t -> LargeInt.int -> base propertyinfoclass_t
    val getNMethods : 'a class_t -> LargeInt.int
    val getMethod : 'a class_t -> LargeInt.int -> base functioninfoclass_t
    val findMethod : 'a class_t -> string -> base functioninfoclass_t
    val getNSignals : 'a class_t -> LargeInt.int
    val getSignal : 'a class_t -> LargeInt.int -> base signalinfoclass_t
    val getNVfuncs : 'a class_t -> LargeInt.int
    val getVfunc : 'a class_t -> LargeInt.int -> base vfuncinfoclass_t
    val getNConstants : 'a class_t -> LargeInt.int
    val getConstant : 'a class_t -> LargeInt.int -> base constantinfoclass_t
    val getIfaceStruct : 'a class_t -> base structinfoclass_t option
    val findVfunc : 'a class_t -> string -> base vfuncinfoclass_t
  end
