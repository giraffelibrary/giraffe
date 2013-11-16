structure GioIOModuleClass :>
  GIO_I_O_MODULE_CLASS
    where type C.notnull = GObjectTypeModuleClass.C.notnull
    where type 'a C.p = 'a GObjectTypeModuleClass.C.p =
  struct
    type 'a iomodule = unit
    type 'a t = 'a iomodule GObjectTypeModuleClass.t
    fun toBase obj = obj
    val t = GObjectTypeModuleClass.t
    val tOpt = GObjectTypeModuleClass.tOpt
    structure C = GObjectTypeModuleClass.C
  end
