structure GtkTargetEntry :>
  GTK_TARGET_ENTRY
    where type t = GtkTargetEntryRecord.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_target_entry_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ =
        call (getSymbol "gtk_target_entry_new")
          (
            Utf8.PolyML.cInPtr
             &&> GUInt32.PolyML.cVal
             &&> GUInt32.PolyML.cVal
             --> GtkTargetEntryRecord.PolyML.cPtr
          )
      val copy_ = call (getSymbol "gtk_target_entry_copy") (GtkTargetEntryRecord.PolyML.cPtr --> GtkTargetEntryRecord.PolyML.cPtr)
    end
    type t = GtkTargetEntryRecord.t
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new target flags info =
      (
        Utf8.FFI.withPtr
         &&&> GUInt32.FFI.withVal
         &&&> GUInt32.FFI.withVal
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
