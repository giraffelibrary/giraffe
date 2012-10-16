structure GioApplicationCommandLine :>
  GIO_APPLICATION_COMMAND_LINE
    where type 'a class_t = 'a GioApplicationCommandLineClass.t =
  struct
    val getType_ = _import "g_application_command_line_get_type" : unit -> GObjectType.C.val_;
    val getCwd_ = _import "g_application_command_line_get_cwd" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.String.notnull FFI.String.out_p;
    val getExitStatus_ = _import "g_application_command_line_get_exit_status" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Int32.val_;
    val getIsRemote_ = _import "g_application_command_line_get_is_remote" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.val_;
    val getPlatformData_ = _import "g_application_command_line_get_platform_data" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GLibVariantRecord.C.notnull GLibVariantRecord.C.p;
    val getenv_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_application_command_line_getenv" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               -> FFI.String.notnull FFI.String.out_p;
          )
            (
              x1,
              x2,
              x3
            )
    val setExitStatus_ = fn x1 & x2 => (_import "g_application_command_line_set_exit_status" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Int32.val_ -> unit;) (x1, x2)
    type 'a class_t = 'a GioApplicationCommandLineClass.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun getCwd self = (GObjectObjectClass.C.withPtr ---> FFI.String.fromPtr false) getCwd_ self
    fun getExitStatus self = (GObjectObjectClass.C.withPtr ---> FFI.Int32.fromVal) getExitStatus_ self
    fun getIsRemote self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.fromVal) getIsRemote_ self
    fun getPlatformData self = (GObjectObjectClass.C.withPtr ---> GLibVariantRecord.C.fromPtr true) getPlatformData_ self
    fun getenv self name = (GObjectObjectClass.C.withPtr &&&> FFI.String.withConstPtr ---> FFI.String.fromPtr false) getenv_ (self & name)
    fun setExitStatus self exitStatus = (GObjectObjectClass.C.withPtr &&&> FFI.Int32.withVal ---> I) setExitStatus_ (self & exitStatus)
    local
      open Property
    in
      val argumentsProp = {set = fn x => set "arguments" GLibVariantRecord.tOpt x}
      val isRemoteProp = {get = fn x => get "is-remote" boolean x}
      val platformDataProp = {set = fn x => set "platform-data" GLibVariantRecord.tOpt x}
    end
  end
