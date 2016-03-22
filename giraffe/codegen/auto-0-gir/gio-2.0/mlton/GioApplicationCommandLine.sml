structure GioApplicationCommandLine :>
  GIO_APPLICATION_COMMAND_LINE
    where type 'a class = 'a GioApplicationCommandLineClass.class =
  struct
    val getType_ = _import "g_application_command_line_get_type" : unit -> GObjectType.C.val_;
    val getCwd_ = _import "g_application_command_line_get_cwd" : GioApplicationCommandLineClass.C.notnull GioApplicationCommandLineClass.C.p -> Utf8.C.notnull Utf8.C.out_p;
    val getExitStatus_ = _import "g_application_command_line_get_exit_status" : GioApplicationCommandLineClass.C.notnull GioApplicationCommandLineClass.C.p -> FFI.Int.C.val_;
    val getIsRemote_ = _import "g_application_command_line_get_is_remote" : GioApplicationCommandLineClass.C.notnull GioApplicationCommandLineClass.C.p -> FFI.Bool.C.val_;
    val getPlatformData_ = _import "g_application_command_line_get_platform_data" : GioApplicationCommandLineClass.C.notnull GioApplicationCommandLineClass.C.p -> GLibVariantRecord.C.notnull GLibVariantRecord.C.p;
    val getenv_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_application_command_line_getenv" :
              GioApplicationCommandLineClass.C.notnull GioApplicationCommandLineClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               -> Utf8.C.notnull Utf8.C.out_p;
          )
            (
              x1,
              x2,
              x3
            )
    val setExitStatus_ = fn x1 & x2 => (_import "g_application_command_line_set_exit_status" : GioApplicationCommandLineClass.C.notnull GioApplicationCommandLineClass.C.p * FFI.Int.C.val_ -> unit;) (x1, x2)
    type 'a class = 'a GioApplicationCommandLineClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun getCwd self = (GioApplicationCommandLineClass.C.withPtr ---> Utf8.C.fromPtr false) getCwd_ self
    fun getExitStatus self = (GioApplicationCommandLineClass.C.withPtr ---> FFI.Int.C.fromVal) getExitStatus_ self
    fun getIsRemote self = (GioApplicationCommandLineClass.C.withPtr ---> FFI.Bool.C.fromVal) getIsRemote_ self
    fun getPlatformData self = (GioApplicationCommandLineClass.C.withPtr ---> GLibVariantRecord.C.fromPtr true) getPlatformData_ self
    fun getenv self name = (GioApplicationCommandLineClass.C.withPtr &&&> Utf8.C.withPtr ---> Utf8.C.fromPtr false) getenv_ (self & name)
    fun setExitStatus self exitStatus = (GioApplicationCommandLineClass.C.withPtr &&&> FFI.Int.C.withVal ---> I) setExitStatus_ (self & exitStatus)
    local
      open Property
    in
      val argumentsProp = {set = fn x => set "arguments" GLibVariantRecord.tOpt x}
      val isRemoteProp = {get = fn x => get "is-remote" boolean x}
      val platformDataProp = {set = fn x => set "platform-data" GLibVariantRecord.tOpt x}
    end
  end
