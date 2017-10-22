structure GioApplicationCommandLine :>
  GIO_APPLICATION_COMMAND_LINE
    where type 'a class = 'a GioApplicationCommandLineClass.class
    where type 'a file_class = 'a GioFileClass.class
    where type 'a input_stream_class = 'a GioInputStreamClass.class =
  struct
    structure Utf8CVectorType =
      CPointerCVectorType(
        structure CElemType = Utf8.C.ArrayType
        structure Sequence = ListSequence
      )
    structure Utf8CVector = CVector(Utf8CVectorType)
    structure Utf8CVectorNType =
      CPointerCVectorNType(
        structure CElemType = Utf8.C.ArrayType
        structure Sequence = ListSequence
      )
    structure Utf8CVectorN = CVectorN(Utf8CVectorNType)
    val getType_ = _import "g_application_command_line_get_type" : unit -> GObjectType.FFI.val_;
    val createFileForArg_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_application_command_line_create_file_for_arg" :
              GioApplicationCommandLineClass.FFI.notnull GioApplicationCommandLineClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               -> GioFileClass.FFI.notnull GioFileClass.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val getArguments_ = fn x1 & x2 => (_import "g_application_command_line_get_arguments" : GioApplicationCommandLineClass.FFI.notnull GioApplicationCommandLineClass.FFI.p * GInt32.FFI.ref_ -> Utf8CVectorN.FFI.notnull Utf8CVectorN.FFI.out_p;) (x1, x2)
    val getCwd_ = _import "g_application_command_line_get_cwd" : GioApplicationCommandLineClass.FFI.notnull GioApplicationCommandLineClass.FFI.p -> unit Utf8.FFI.out_p;
    val getEnviron_ = _import "g_application_command_line_get_environ" : GioApplicationCommandLineClass.FFI.notnull GioApplicationCommandLineClass.FFI.p -> Utf8CVector.FFI.notnull Utf8CVector.FFI.out_p;
    val getExitStatus_ = _import "g_application_command_line_get_exit_status" : GioApplicationCommandLineClass.FFI.notnull GioApplicationCommandLineClass.FFI.p -> GInt32.FFI.val_;
    val getIsRemote_ = _import "g_application_command_line_get_is_remote" : GioApplicationCommandLineClass.FFI.notnull GioApplicationCommandLineClass.FFI.p -> GBool.FFI.val_;
    val getOptionsDict_ = _import "g_application_command_line_get_options_dict" : GioApplicationCommandLineClass.FFI.notnull GioApplicationCommandLineClass.FFI.p -> GLibVariantDictRecord.FFI.notnull GLibVariantDictRecord.FFI.p;
    val getPlatformData_ = _import "g_application_command_line_get_platform_data" : GioApplicationCommandLineClass.FFI.notnull GioApplicationCommandLineClass.FFI.p -> unit GLibVariantRecord.FFI.p;
    val getStdin_ = _import "g_application_command_line_get_stdin" : GioApplicationCommandLineClass.FFI.notnull GioApplicationCommandLineClass.FFI.p -> GioInputStreamClass.FFI.notnull GioInputStreamClass.FFI.p;
    val getenv_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_application_command_line_getenv" :
              GioApplicationCommandLineClass.FFI.notnull GioApplicationCommandLineClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               -> Utf8.FFI.notnull Utf8.FFI.out_p;
          )
            (
              x1,
              x2,
              x3
            )
    val setExitStatus_ = fn x1 & x2 => (_import "g_application_command_line_set_exit_status" : GioApplicationCommandLineClass.FFI.notnull GioApplicationCommandLineClass.FFI.p * GInt32.FFI.val_ -> unit;) (x1, x2)
    type 'a class = 'a GioApplicationCommandLineClass.class
    type 'a file_class = 'a GioFileClass.class
    type 'a input_stream_class = 'a GioInputStreamClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun createFileForArg self arg = (GioApplicationCommandLineClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> GioFileClass.FFI.fromPtr true) createFileForArg_ (self & arg)
    fun getArguments self =
      let
        val argc & retVal = (GioApplicationCommandLineClass.FFI.withPtr &&&> GInt32.FFI.withRefVal ---> GInt32.FFI.fromVal && Utf8CVectorN.FFI.fromPtr 2) getArguments_ (self & GInt32.null)
      in
        retVal (LargeInt.toInt argc)
      end
    fun getCwd self = (GioApplicationCommandLineClass.FFI.withPtr ---> Utf8.FFI.fromOptPtr 0) getCwd_ self
    fun getEnviron self = (GioApplicationCommandLineClass.FFI.withPtr ---> Utf8CVector.FFI.fromPtr 0) getEnviron_ self
    fun getExitStatus self = (GioApplicationCommandLineClass.FFI.withPtr ---> GInt32.FFI.fromVal) getExitStatus_ self
    fun getIsRemote self = (GioApplicationCommandLineClass.FFI.withPtr ---> GBool.FFI.fromVal) getIsRemote_ self
    fun getOptionsDict self = (GioApplicationCommandLineClass.FFI.withPtr ---> GLibVariantDictRecord.FFI.fromPtr false) getOptionsDict_ self
    fun getPlatformData self = (GioApplicationCommandLineClass.FFI.withPtr ---> GLibVariantRecord.FFI.fromOptPtr true) getPlatformData_ self
    fun getStdin self = (GioApplicationCommandLineClass.FFI.withPtr ---> GioInputStreamClass.FFI.fromPtr true) getStdin_ self
    fun getenv self name = (GioApplicationCommandLineClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getenv_ (self & name)
    fun setExitStatus self exitStatus = (GioApplicationCommandLineClass.FFI.withPtr &&&> GInt32.FFI.withVal ---> I) setExitStatus_ (self & exitStatus)
    local
      open Property
    in
      val argumentsProp = {set = fn x => set "arguments" GLibVariantRecord.tOpt x}
      val isRemoteProp = {get = fn x => get "is-remote" boolean x}
      val optionsProp = {set = fn x => set "options" GLibVariantRecord.tOpt x}
      val platformDataProp = {set = fn x => set "platform-data" GLibVariantRecord.tOpt x}
    end
  end
