structure GIRepositoryBaseInfo :>
  G_I_REPOSITORY_BASE_INFO
    where type t = GIRepositoryBaseInfoRecord.t
    where type info_type_t = GIRepositoryInfoType.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_base_info_gtype_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val equal_ = call (getSymbol "g_base_info_equal") (GIRepositoryBaseInfoRecord.PolyML.cPtr &&> GIRepositoryBaseInfoRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val getAttribute_ = call (getSymbol "g_base_info_get_attribute") (GIRepositoryBaseInfoRecord.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> Utf8.PolyML.cOutPtr)
      val getContainer_ = call (getSymbol "g_base_info_get_container") (GIRepositoryBaseInfoRecord.PolyML.cPtr --> GIRepositoryBaseInfoRecord.PolyML.cPtr)
      val getName_ = call (getSymbol "g_base_info_get_name") (GIRepositoryBaseInfoRecord.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getNamespace_ = call (getSymbol "g_base_info_get_namespace") (GIRepositoryBaseInfoRecord.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getType_ = call (getSymbol "g_base_info_get_type") (GIRepositoryBaseInfoRecord.PolyML.cPtr --> GIRepositoryInfoType.PolyML.cVal)
      val isDeprecated_ = call (getSymbol "g_base_info_is_deprecated") (GIRepositoryBaseInfoRecord.PolyML.cPtr --> GBool.PolyML.cVal)
    end
    type t = GIRepositoryBaseInfoRecord.t
    type info_type_t = GIRepositoryInfoType.t
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun equal self info2 = (GIRepositoryBaseInfoRecord.FFI.withPtr false &&&> GIRepositoryBaseInfoRecord.FFI.withPtr false ---> GBool.FFI.fromVal) equal_ (self & info2)
    fun getAttribute self name = (GIRepositoryBaseInfoRecord.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> Utf8.FFI.fromPtr 0) getAttribute_ (self & name) before GIRepositoryBaseInfoRecord.FFI.touchPtr self before Utf8.FFI.touchPtr name
    fun getContainer self = (GIRepositoryBaseInfoRecord.FFI.withPtr false ---> GIRepositoryBaseInfoRecord.FFI.fromPtr false) getContainer_ self before GIRepositoryBaseInfoRecord.FFI.touchPtr self
    fun getName self = (GIRepositoryBaseInfoRecord.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getName_ self before GIRepositoryBaseInfoRecord.FFI.touchPtr self
    fun getNamespace self = (GIRepositoryBaseInfoRecord.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getNamespace_ self before GIRepositoryBaseInfoRecord.FFI.touchPtr self
    fun getType self = (GIRepositoryBaseInfoRecord.FFI.withPtr false ---> GIRepositoryInfoType.FFI.fromVal) getType_ self
    fun isDeprecated self = (GIRepositoryBaseInfoRecord.FFI.withPtr false ---> GBool.FFI.fromVal) isDeprecated_ self
  end
