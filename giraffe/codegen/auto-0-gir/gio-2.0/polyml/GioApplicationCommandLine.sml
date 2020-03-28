structure GioApplicationCommandLine :>
  GIO_APPLICATION_COMMAND_LINE
    where type 'a class = 'a GioApplicationCommandLineClass.class
    where type 'a file_class = 'a GioFileClass.class
    where type 'a input_stream_class = 'a GioInputStreamClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_application_command_line_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val createFileForArg_ = call (getSymbol "g_application_command_line_create_file_for_arg") (GioApplicationCommandLineClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GioFileClass.PolyML.cPtr)
      val getArguments_ = call (getSymbol "g_application_command_line_get_arguments") (GioApplicationCommandLineClass.PolyML.cPtr &&> GInt.PolyML.cRef --> Utf8CArrayN.PolyML.cOutPtr)
      val getCwd_ = call (getSymbol "g_application_command_line_get_cwd") (GioApplicationCommandLineClass.PolyML.cPtr --> Utf8.PolyML.cOutOptPtr)
      val getEnviron_ = call (getSymbol "g_application_command_line_get_environ") (GioApplicationCommandLineClass.PolyML.cPtr --> Utf8CArray.PolyML.cOutPtr)
      val getExitStatus_ = call (getSymbol "g_application_command_line_get_exit_status") (GioApplicationCommandLineClass.PolyML.cPtr --> GInt.PolyML.cVal)
      val getIsRemote_ = call (getSymbol "g_application_command_line_get_is_remote") (GioApplicationCommandLineClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getOptionsDict_ = call (getSymbol "g_application_command_line_get_options_dict") (GioApplicationCommandLineClass.PolyML.cPtr --> GLibVariantDictRecord.PolyML.cPtr)
      val getPlatformData_ = call (getSymbol "g_application_command_line_get_platform_data") (GioApplicationCommandLineClass.PolyML.cPtr --> GLibVariantRecord.PolyML.cOptPtr)
      val getStdin_ = call (getSymbol "g_application_command_line_get_stdin") (GioApplicationCommandLineClass.PolyML.cPtr --> GioInputStreamClass.PolyML.cPtr)
      val getenv_ = call (getSymbol "g_application_command_line_getenv") (GioApplicationCommandLineClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> Utf8.PolyML.cOutPtr)
      val setExitStatus_ = call (getSymbol "g_application_command_line_set_exit_status") (GioApplicationCommandLineClass.PolyML.cPtr &&> GInt.PolyML.cVal --> cVoid)
    end
    type 'a class = 'a GioApplicationCommandLineClass.class
    type 'a file_class = 'a GioFileClass.class
    type 'a input_stream_class = 'a GioInputStreamClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun createFileForArg self arg = (GioApplicationCommandLineClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> GioFileClass.FFI.fromPtr true) createFileForArg_ (self & arg)
    fun getArguments self =
      let
        val argc & retVal = (GioApplicationCommandLineClass.FFI.withPtr &&&> GInt.FFI.withRefVal ---> GInt.FFI.fromVal && Utf8CArrayN.FFI.fromPtr 2) getArguments_ (self & GInt.null)
      in
        retVal (LargeInt.toInt argc)
      end
    fun getCwd self = (GioApplicationCommandLineClass.FFI.withPtr ---> Utf8.FFI.fromOptPtr 0) getCwd_ self
    fun getEnviron self = (GioApplicationCommandLineClass.FFI.withPtr ---> Utf8CArray.FFI.fromPtr 0) getEnviron_ self
    fun getExitStatus self = (GioApplicationCommandLineClass.FFI.withPtr ---> GInt.FFI.fromVal) getExitStatus_ self
    fun getIsRemote self = (GioApplicationCommandLineClass.FFI.withPtr ---> GBool.FFI.fromVal) getIsRemote_ self
    fun getOptionsDict self = (GioApplicationCommandLineClass.FFI.withPtr ---> GLibVariantDictRecord.FFI.fromPtr false) getOptionsDict_ self
    fun getPlatformData self = (GioApplicationCommandLineClass.FFI.withPtr ---> GLibVariantRecord.FFI.fromOptPtr true) getPlatformData_ self
    fun getStdin self = (GioApplicationCommandLineClass.FFI.withPtr ---> GioInputStreamClass.FFI.fromPtr true) getStdin_ self
    fun getenv self name = (GioApplicationCommandLineClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getenv_ (self & name)
    fun setExitStatus self exitStatus = (GioApplicationCommandLineClass.FFI.withPtr &&&> GInt.FFI.withVal ---> I) setExitStatus_ (self & exitStatus)
    local
      open Property
    in
      val argumentsProp = {new = fn x => new "arguments" GLibVariantRecord.tOpt x}
      val isRemoteProp = {get = fn x => get "is-remote" boolean x}
      val optionsProp = {new = fn x => new "options" GLibVariantRecord.tOpt x}
      val platformDataProp = {new = fn x => new "platform-data" GLibVariantRecord.tOpt x}
    end
  end
