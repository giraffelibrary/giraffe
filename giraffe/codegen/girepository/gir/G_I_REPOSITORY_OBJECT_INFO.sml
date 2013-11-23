signature G_I_REPOSITORY_OBJECT_INFO =
  sig
    type 'a class_t
    type 'a baseinfoclass_t
    type 'a interfaceinfoclass_t
    type 'a fieldinfoclass_t
    type 'a propertyinfoclass_t
    type 'a functioninfoclass_t
    type 'a signalinfoclass_t
    type 'a vfuncinfoclass_t
    type 'a constantinfoclass_t
    type 'a structinfoclass_t
    val getTypeName : 'a class_t -> string
    val getTypeInit : 'a class_t -> string
    val getAbstract : 'a class_t -> bool
    val getFundamental : 'a class_t -> bool
    val getParent : 'a class_t -> base class_t option
    val getNInterfaces : 'a class_t -> LargeInt.int
    val getInterface : 'a class_t -> LargeInt.int -> base interfaceinfoclass_t
    val getNFields : 'a class_t -> LargeInt.int
    val getField : 'a class_t -> LargeInt.int -> base fieldinfoclass_t
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
    val getClassStruct : 'a class_t -> base structinfoclass_t option
    val findVfunc : 'a class_t -> string -> base vfuncinfoclass_t
  end
