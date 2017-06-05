structure GioFilenameCompleter :>
  GIO_FILENAME_COMPLETER
    where type 'a class = 'a GioFilenameCompleterClass.class =
  struct
    structure Utf8CVectorType =
      CPointerCVectorType(
        structure CElemType = Utf8.C.ArrayType
        structure Sequence = ListSequence
      )
    structure Utf8CVector = CVector(Utf8CVectorType)
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_filename_completer_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgio "g_filename_completer_new") (PolyMLFFI.cVoid --> GioFilenameCompleterClass.PolyML.cPtr)
      val getCompletionSuffix_ = call (load_sym libgio "g_filename_completer_get_completion_suffix") (GioFilenameCompleterClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> Utf8.PolyML.cOutPtr)
      val getCompletions_ = call (load_sym libgio "g_filename_completer_get_completions") (GioFilenameCompleterClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> Utf8CVector.PolyML.cOutPtr)
      val setDirsOnly_ = call (load_sym libgio "g_filename_completer_set_dirs_only") (GioFilenameCompleterClass.PolyML.cPtr &&> GBool.PolyML.cVal --> PolyMLFFI.cVoid)
    end
    type 'a class = 'a GioFilenameCompleterClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GioFilenameCompleterClass.FFI.fromPtr true) new_ ()
    fun getCompletionSuffix self initialText = (GioFilenameCompleterClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> Utf8.FFI.fromPtr 1) getCompletionSuffix_ (self & initialText)
    fun getCompletions self initialText = (GioFilenameCompleterClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> Utf8CVector.FFI.fromPtr 2) getCompletions_ (self & initialText)
    fun setDirsOnly self dirsOnly = (GioFilenameCompleterClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setDirsOnly_ (self & dirsOnly)
    local
      open ClosureMarshal Signal
    in
      fun gotCompletionDataSig f = signal "got-completion-data" (void ---> ret_void) f
    end
  end
