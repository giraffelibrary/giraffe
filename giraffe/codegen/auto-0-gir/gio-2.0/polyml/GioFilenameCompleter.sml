structure GioFilenameCompleter :>
  GIO_FILENAME_COMPLETER
    where type 'a class = 'a GioFilenameCompleterClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_filename_completer_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "g_filename_completer_new") (cVoid --> GioFilenameCompleterClass.PolyML.cPtr)
      val getCompletionSuffix_ = call (getSymbol "g_filename_completer_get_completion_suffix") (GioFilenameCompleterClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> Utf8.PolyML.cOutPtr)
      val getCompletions_ = call (getSymbol "g_filename_completer_get_completions") (GioFilenameCompleterClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> Utf8CPtrArray.PolyML.cOutPtr)
      val setDirsOnly_ = call (getSymbol "g_filename_completer_set_dirs_only") (GioFilenameCompleterClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
    end
    type 'a class = 'a GioFilenameCompleterClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GioFilenameCompleterClass.FFI.fromPtr true) new_ ()
    fun getCompletionSuffix self initialText = (GioFilenameCompleterClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> Utf8.FFI.fromPtr ~1) getCompletionSuffix_ (self & initialText)
    fun getCompletions self initialText = (GioFilenameCompleterClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> Utf8CPtrArray.FFI.fromPtr ~1) getCompletions_ (self & initialText)
    fun setDirsOnly self dirsOnly = (GioFilenameCompleterClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setDirsOnly_ (self & dirsOnly)
    local
      open ClosureMarshal Signal
    in
      fun gotCompletionDataSig f = signal "got-completion-data" (void ---> ret_void) f
    end
  end
