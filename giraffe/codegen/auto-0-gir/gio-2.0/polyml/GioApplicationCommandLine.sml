structure GioApplicationCommandLine :>
  GIO_APPLICATION_COMMAND_LINE
    where type 'a class = 'a GioApplicationCommandLineClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_application_command_line_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val getCwd_ = call (load_sym libgio "g_application_command_line_get_cwd") (GObjectObjectClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getExitStatus_ = call (load_sym libgio "g_application_command_line_get_exit_status") (GObjectObjectClass.PolyML.cPtr --> FFI.Int.PolyML.cVal)
      val getIsRemote_ = call (load_sym libgio "g_application_command_line_get_is_remote") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getPlatformData_ = call (load_sym libgio "g_application_command_line_get_platform_data") (GObjectObjectClass.PolyML.cPtr --> GLibVariantRecord.PolyML.cPtr)
      val getenv_ = call (load_sym libgio "g_application_command_line_getenv") (GObjectObjectClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> Utf8.PolyML.cOutPtr)
      val setExitStatus_ = call (load_sym libgio "g_application_command_line_set_exit_status") (GObjectObjectClass.PolyML.cPtr &&> FFI.Int.PolyML.cVal --> FFI.PolyML.cVoid)
    end
    type 'a class = 'a GioApplicationCommandLineClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun getCwd self = (GObjectObjectClass.C.withPtr ---> Utf8.C.fromPtr false) getCwd_ self
    fun getExitStatus self = (GObjectObjectClass.C.withPtr ---> FFI.Int.C.fromVal) getExitStatus_ self
    fun getIsRemote self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getIsRemote_ self
    fun getPlatformData self = (GObjectObjectClass.C.withPtr ---> GLibVariantRecord.C.fromPtr true) getPlatformData_ self
    fun getenv self name = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withPtr ---> Utf8.C.fromPtr false) getenv_ (self & name)
    fun setExitStatus self exitStatus = (GObjectObjectClass.C.withPtr &&&> FFI.Int.C.withVal ---> I) setExitStatus_ (self & exitStatus)
    local
      open Property
    in
      val argumentsProp = {set = fn x => set "arguments" GLibVariantRecord.tOpt x}
      val isRemoteProp = {get = fn x => get "is-remote" boolean x}
      val platformDataProp = {set = fn x => set "platform-data" GLibVariantRecord.tOpt x}
    end
  end
