structure GioIOModule :>
  GIO_I_O_MODULE
    where type 'a class = 'a GioIOModuleClass.class =
  struct
    structure Utf8CVectorType =
      CPointerCVectorType(
        structure CElemType = Utf8.C.ArrayType
        structure Sequence = ListSequence
      )
    structure Utf8CVector = CVector(Utf8CVectorType)
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_io_module_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgio "g_io_module_new") (Utf8.PolyML.cInPtr --> GioIOModuleClass.PolyML.cPtr)
      val query_ = call (load_sym libgio "g_io_module_query") (PolyMLFFI.cVoid --> Utf8CVector.PolyML.cOutPtr)
      val load_ = call (load_sym libgio "g_io_module_load") (GioIOModuleClass.PolyML.cPtr --> PolyMLFFI.cVoid)
      val unload_ = call (load_sym libgio "g_io_module_unload") (GioIOModuleClass.PolyML.cPtr --> PolyMLFFI.cVoid)
    end
    type 'a class = 'a GioIOModuleClass.class
    type t = base class
    fun asTypePlugin self = (GObjectObjectClass.FFI.withPtr ---> GObjectTypePluginClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new filename = (Utf8.FFI.withPtr ---> GioIOModuleClass.FFI.fromPtr true) new_ filename
    fun query () = (I ---> Utf8CVector.FFI.fromPtr 2) query_ ()
    fun load self = (GioIOModuleClass.FFI.withPtr ---> I) load_ self
    fun unload self = (GioIOModuleClass.FFI.withPtr ---> I) unload_ self
  end
