structure GioFilenameCompleter :>
  GIO_FILENAME_COMPLETER
    where type 'a class_t = 'a GioFilenameCompleterClass.t =
  struct
    val getType_ = _import "g_filename_completer_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "g_filename_completer_new" : unit -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val getCompletionSuffix_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_filename_completer_get_completion_suffix" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               -> FFI.String.C.notnull FFI.String.C.out_p;
          )
            (
              x1,
              x2,
              x3
            )
    val setDirsOnly_ = fn x1 & x2 => (_import "g_filename_completer_set_dirs_only" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
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
