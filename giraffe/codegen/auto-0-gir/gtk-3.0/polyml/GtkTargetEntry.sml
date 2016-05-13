structure GtkTargetEntry :>
  GTK_TARGET_ENTRY
    where type t = GtkTargetEntryRecord.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_target_entry_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val new_ =
        call (load_sym libgtk "gtk_target_entry_new")
          (
            Utf8.PolyML.cInPtr
             &&> FFI.UInt.PolyML.cVal
             &&> FFI.UInt.PolyML.cVal
             --> GtkTargetEntryRecord.PolyML.cPtr
          )
      val copy_ = call (load_sym libgtk "gtk_target_entry_copy") (GtkTargetEntryRecord.PolyML.cPtr --> GtkTargetEntryRecord.PolyML.cPtr)
    end
    type t = GtkTargetEntryRecord.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new target flags info =
      (
        Utf8.C.withPtr
         &&&> FFI.UInt.C.withVal
         &&&> FFI.UInt.C.withVal
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
