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
    val getType_ = _import "g_filename_completer_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "g_filename_completer_new" : unit -> GioFilenameCompleterClass.FFI.notnull GioFilenameCompleterClass.FFI.p;
    val getCompletionSuffix_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_filename_completer_get_completion_suffix" :
              GioFilenameCompleterClass.FFI.notnull GioFilenameCompleterClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               -> Utf8.FFI.notnull Utf8.FFI.out_p;
          )
            (
              x1,
              x2,
              x3
            )
    val getCompletions_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_filename_completer_get_completions" :
              GioFilenameCompleterClass.FFI.notnull GioFilenameCompleterClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               -> Utf8CVector.FFI.notnull Utf8CVector.FFI.out_p;
          )
            (
              x1,
              x2,
              x3
            )
    val setDirsOnly_ = fn x1 & x2 => (_import "g_filename_completer_set_dirs_only" : GioFilenameCompleterClass.FFI.notnull GioFilenameCompleterClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
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
