structure GIRepositoryBaseInfo :>
  G_I_REPOSITORY_BASE_INFO
    where type t = GIRepositoryBaseInfoRecord.t
    where type info_type_t = GIRepositoryInfoType.t
    where type typelib_t = GIRepositoryTypelibRecord.t =
  struct
    val getType_ = _import "g_base_info_gtype_get_type" : unit -> GObjectType.FFI.val_;
    val equal_ = fn x1 & x2 => (_import "g_base_info_equal" : GIRepositoryBaseInfoRecord.FFI.non_opt GIRepositoryBaseInfoRecord.FFI.p * GIRepositoryBaseInfoRecord.FFI.non_opt GIRepositoryBaseInfoRecord.FFI.p -> GBool.FFI.val_;) (x1, x2)
    val getAttribute_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_base_info_get_attribute" :
              GIRepositoryBaseInfoRecord.FFI.non_opt GIRepositoryBaseInfoRecord.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> Utf8.FFI.non_opt Utf8.FFI.out_p;
          )
            (
              x1,
              x2,
              x3
            )
    val getContainer_ = _import "g_base_info_get_container" : GIRepositoryBaseInfoRecord.FFI.non_opt GIRepositoryBaseInfoRecord.FFI.p -> GIRepositoryBaseInfoRecord.FFI.non_opt GIRepositoryBaseInfoRecord.FFI.p;
    val getName_ = _import "g_base_info_get_name" : GIRepositoryBaseInfoRecord.FFI.non_opt GIRepositoryBaseInfoRecord.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val getNamespace_ = _import "g_base_info_get_namespace" : GIRepositoryBaseInfoRecord.FFI.non_opt GIRepositoryBaseInfoRecord.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val getType_ = _import "g_base_info_get_type" : GIRepositoryBaseInfoRecord.FFI.non_opt GIRepositoryBaseInfoRecord.FFI.p -> GIRepositoryInfoType.FFI.val_;
    val getTypelib_ = _import "g_base_info_get_typelib" : GIRepositoryBaseInfoRecord.FFI.non_opt GIRepositoryBaseInfoRecord.FFI.p -> GIRepositoryTypelibRecord.FFI.non_opt GIRepositoryTypelibRecord.FFI.p;
    val isDeprecated_ = _import "g_base_info_is_deprecated" : GIRepositoryBaseInfoRecord.FFI.non_opt GIRepositoryBaseInfoRecord.FFI.p -> GBool.FFI.val_;
    type t = GIRepositoryBaseInfoRecord.t
    type info_type_t = GIRepositoryInfoType.t
    type typelib_t = GIRepositoryTypelibRecord.t
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun equal self info2 = (GIRepositoryBaseInfoRecord.FFI.withPtr false &&&> GIRepositoryBaseInfoRecord.FFI.withPtr false ---> GBool.FFI.fromVal) equal_ (self & info2)
    fun getAttribute self name = (GIRepositoryBaseInfoRecord.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> Utf8.FFI.fromPtr 0) getAttribute_ (self & name) before GIRepositoryBaseInfoRecord.FFI.touchPtr self before Utf8.FFI.touchPtr name
    fun getContainer self = (GIRepositoryBaseInfoRecord.FFI.withPtr false ---> GIRepositoryBaseInfoRecord.FFI.fromPtr false) getContainer_ self before GIRepositoryBaseInfoRecord.FFI.touchPtr self
    fun getName self = (GIRepositoryBaseInfoRecord.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getName_ self before GIRepositoryBaseInfoRecord.FFI.touchPtr self
    fun getNamespace self = (GIRepositoryBaseInfoRecord.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getNamespace_ self before GIRepositoryBaseInfoRecord.FFI.touchPtr self
    fun getType self = (GIRepositoryBaseInfoRecord.FFI.withPtr false ---> GIRepositoryInfoType.FFI.fromVal) getType_ self
    fun getTypelib self = (GIRepositoryBaseInfoRecord.FFI.withPtr false ---> GIRepositoryTypelibRecord.FFI.fromPtr false) getTypelib_ self before GIRepositoryBaseInfoRecord.FFI.touchPtr self
    fun isDeprecated self = (GIRepositoryBaseInfoRecord.FFI.withPtr false ---> GBool.FFI.fromVal) isDeprecated_ self
  end
