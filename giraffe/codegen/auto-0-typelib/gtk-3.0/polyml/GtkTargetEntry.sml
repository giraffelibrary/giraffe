structure GtkTargetEntry :>
  GTK_TARGET_ENTRY
    where type record_t = GtkTargetEntryRecord.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_target_entry_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val new_ =
        call (load_sym libgtk "gtk_target_entry_new")
          (
            Utf8.PolyML.INPTR
             &&> FFI.UInt32.PolyML.VAL
             &&> FFI.UInt32.PolyML.VAL
             --> GtkTargetEntryRecord.PolyML.PTR
          )
      val copy_ = call (load_sym libgtk "gtk_target_entry_copy") (GtkTargetEntryRecord.PolyML.PTR --> GtkTargetEntryRecord.PolyML.PTR)
    end
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
