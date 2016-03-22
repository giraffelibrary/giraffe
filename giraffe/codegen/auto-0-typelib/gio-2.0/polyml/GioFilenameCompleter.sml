structure GioFilenameCompleter :>
  GIO_FILENAME_COMPLETER
    where type 'a class = 'a GioFilenameCompleterClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_filename_completer_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgio "g_filename_completer_new") (FFI.PolyML.cVoid --> GioFilenameCompleterClass.PolyML.cPtr)
      val getCompletionSuffix_ = call (load_sym libgio "g_filename_completer_get_completion_suffix") (GioFilenameCompleterClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> Utf8.PolyML.cOutPtr)
      val setDirsOnly_ = call (load_sym libgio "g_filename_completer_set_dirs_only") (GioFilenameCompleterClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
    end
    type 'a class = 'a GioFilenameCompleterClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GioFilenameCompleterClass.C.fromPtr true) new_ ()
    fun getCompletionSuffix self initialText = (GioFilenameCompleterClass.C.withPtr &&&> Utf8.C.withPtr ---> Utf8.C.fromPtr true) getCompletionSuffix_ (self & initialText)
    fun setDirsOnly self dirsOnly = (GioFilenameCompleterClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setDirsOnly_ (self & dirsOnly)
    local
      open ClosureMarshal Signal
    in
      fun gotCompletionDataSig f = signal "got-completion-data" (void ---> ret_void) f
    end
  end
