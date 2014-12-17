structure GioApplicationCommandLine :>
  GIO_APPLICATION_COMMAND_LINE
    where type 'a class_t = 'a GioApplicationCommandLineClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_application_command_line_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val getCwd_ = call (load_sym libgio "g_application_command_line_get_cwd") (GObjectObjectClass.PolyML.PTR --> FFI.String.PolyML.RETPTR)
      val getExitStatus_ = call (load_sym libgio "g_application_command_line_get_exit_status") (GObjectObjectClass.PolyML.PTR --> FFI.Int.PolyML.VAL)
      val getIsRemote_ = call (load_sym libgio "g_application_command_line_get_is_remote") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val getPlatformData_ = call (load_sym libgio "g_application_command_line_get_platform_data") (GObjectObjectClass.PolyML.PTR --> GLibVariantRecord.PolyML.PTR)
      val getenv_ = call (load_sym libgio "g_application_command_line_getenv") (GObjectObjectClass.PolyML.PTR &&> FFI.String.PolyML.INPTR --> FFI.String.PolyML.RETPTR)
      val setExitStatus_ = call (load_sym libgio "g_application_command_line_set_exit_status") (GObjectObjectClass.PolyML.PTR &&> FFI.Int.PolyML.VAL --> FFI.PolyML.VOID)
    end
    type 'a class_t = 'a GioApplicationCommandLineClass.t
    type t = base class_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun getCwd self = (GObjectObjectClass.C.withPtr ---> FFI.String.C.fromPtr false) getCwd_ self
    fun getExitStatus self = (GObjectObjectClass.C.withPtr ---> FFI.Int.C.fromVal) getExitStatus_ self
    fun getIsRemote self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getIsRemote_ self
    fun getPlatformData self = (GObjectObjectClass.C.withPtr ---> GLibVariantRecord.C.fromPtr true) getPlatformData_ self
    fun getenv self name = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstPtr ---> FFI.String.C.fromPtr false) getenv_ (self & name)
    fun setExitStatus self exitStatus = (GObjectObjectClass.C.withPtr &&&> FFI.Int.C.withVal ---> I) setExitStatus_ (self & exitStatus)
    local
      open Property
    in
      val argumentsProp = {set = fn x => set "arguments" GLibVariantRecord.tOpt x}
      val isRemoteProp = {get = fn x => get "is-remote" boolean x}
      val platformDataProp = {set = fn x => set "platform-data" GLibVariantRecord.tOpt x}
    end
  end
