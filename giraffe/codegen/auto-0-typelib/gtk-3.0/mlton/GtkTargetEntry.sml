structure GtkTargetEntry :>
  GTK_TARGET_ENTRY
    where type record_t = GtkTargetEntryRecord.t =
  struct
    val getType_ = _import "gtk_target_entry_get_type" : unit -> GObjectType.C.val_;
    val new_ =
      fn
        (x1, x2)
         & x3
         & x4 =>
          (
            _import "mlton_gtk_target_entry_new" :
              GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               * FFI.UInt32.C.val_
               * FFI.UInt32.C.val_
               -> GtkTargetEntryRecord.C.notnull GtkTargetEntryRecord.C.p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val copy_ = _import "gtk_target_entry_copy" : GtkTargetEntryRecord.C.notnull GtkTargetEntryRecord.C.p -> GtkTargetEntryRecord.C.notnull GtkTargetEntryRecord.C.p;
    type record_t = GtkTargetEntryRecord.t
    type t = record_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new target flags info =
      (
        Utf8.C.withConstPtr
         &&&> FFI.UInt32.C.withVal
         &&&> FFI.UInt32.C.withVal
         ---> GtkTargetEntryRecord.C.fromPtr true
      )
        new_
        (
          target
           & flags
           & info
        )
    fun copy self = (GtkTargetEntryRecord.C.withPtr ---> GtkTargetEntryRecord.C.fromPtr true) copy_ self
  end
