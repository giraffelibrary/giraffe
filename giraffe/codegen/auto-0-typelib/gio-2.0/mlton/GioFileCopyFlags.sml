structure GioFileCopyFlags :> GIO_FILE_COPY_FLAGS =
  struct
    local
      fun NONE () = 0w0
    in
      val NONE = NONE ()
    end
    val OVERWRITE = 0w1
    val BACKUP = 0w2
    val NOFOLLOW_SYMLINKS = 0w4
    val ALL_METADATA = 0w8
    val NO_FALLBACK_FOR_MOVE = 0w16
    val TARGET_DEFAULT_PERMS = 0w32
    val allFlags =
      [
        NONE,
        OVERWRITE,
        BACKUP,
        NOFOLLOW_SYMLINKS,
        ALL_METADATA,
        NO_FALLBACK_FOR_MOVE,
        TARGET_DEFAULT_PERMS
      ]
    structure Flags =
      Flags(
        val allFlags = allFlags
      )
    open Flags
    val getType_ = _import "g_file_copy_flags_get_type" : unit -> GObjectType.FFI.val_;
    val getValue_ = _import "g_value_get_flags" : GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p -> FFI.val_;
    val setValue_ = fn x1 & x2 => (_import "g_value_set_flags" : GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p * FFI.val_ -> unit;) (x1, x2)
    val t =
      GObjectValue.C.createAccessor
        {
          getType = (I ---> GObjectType.FFI.fromVal) getType_,
          getValue = (I ---> FFI.fromVal) getValue_,
          setValue = (I &&&> FFI.withVal ---> I) setValue_
        }
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
