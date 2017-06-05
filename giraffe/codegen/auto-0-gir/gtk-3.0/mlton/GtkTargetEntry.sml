structure GtkTargetEntry :>
  GTK_TARGET_ENTRY
    where type t = GtkTargetEntryRecord.t =
  struct
    val getType_ = _import "gtk_target_entry_get_type" : unit -> GObjectType.FFI.val_;
    val new_ =
      fn
        (x1, x2)
         & x3
         & x4 =>
          (
            _import "mlton_gtk_target_entry_new" :
              Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GUInt.FFI.val_
               * GUInt.FFI.val_
               -> GtkTargetEntryRecord.FFI.notnull GtkTargetEntryRecord.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val copy_ = _import "gtk_target_entry_copy" : GtkTargetEntryRecord.FFI.notnull GtkTargetEntryRecord.FFI.p -> GtkTargetEntryRecord.FFI.notnull GtkTargetEntryRecord.FFI.p;
    type t = GtkTargetEntryRecord.t
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new target flags info =
      (
        Utf8.FFI.withPtr
         &&&> GUInt.FFI.withVal
         &&&> GUInt.FFI.withVal
         ---> GtkTargetEntryRecord.FFI.fromPtr true
      )
        new_
        (
          target
           & flags
           & info
        )
    fun copy self = (GtkTargetEntryRecord.FFI.withPtr ---> GtkTargetEntryRecord.FFI.fromPtr true) copy_ self
  end
