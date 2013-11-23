structure GioFilenameCompleter :>
  GIO_FILENAME_COMPLETER
    where type 'a class_t = 'a GioFilenameCompleterClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_filename_completer_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val new_ = call (load_sym libgio "g_filename_completer_new") (FFI.PolyML.VOID --> GObjectObjectClass.PolyML.PTR)
      val getCompletionSuffix_ = call (load_sym libgio "g_filename_completer_get_completion_suffix") (GObjectObjectClass.PolyML.PTR &&> FFI.String.PolyML.INPTR --> FFI.String.PolyML.RETPTR)
      val setDirsOnly_ = call (load_sym libgio "g_filename_completer_set_dirs_only") (GObjectObjectClass.PolyML.PTR &&> FFI.Bool.PolyML.VAL --> FFI.PolyML.VOID)
    end
    type 'a class_t = 'a GioFilenameCompleterClass.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GioFilenameCompleterClass.C.fromPtr true) new_ ()
    fun getCompletionSuffix self initialText = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstPtr ---> FFI.String.C.fromPtr true) getCompletionSuffix_ (self & initialText)
    fun setDirsOnly self dirsOnly = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setDirsOnly_ (self & dirsOnly)
    local
      open ClosureMarshal Signal
    in
      fun gotCompletionDataSig f = signal "got-completion-data" (void ---> ret_void) f
    end
  end
