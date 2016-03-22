structure GioFilenameCompleter :>
  GIO_FILENAME_COMPLETER
    where type 'a class = 'a GioFilenameCompleterClass.class =
  struct
    val getType_ = _import "g_filename_completer_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "g_filename_completer_new" : unit -> GioFilenameCompleterClass.C.notnull GioFilenameCompleterClass.C.p;
    val getCompletionSuffix_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_filename_completer_get_completion_suffix" :
              GioFilenameCompleterClass.C.notnull GioFilenameCompleterClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               -> Utf8.C.notnull Utf8.C.out_p;
          )
            (
              x1,
              x2,
              x3
            )
    val setDirsOnly_ = fn x1 & x2 => (_import "g_filename_completer_set_dirs_only" : GioFilenameCompleterClass.C.notnull GioFilenameCompleterClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
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
