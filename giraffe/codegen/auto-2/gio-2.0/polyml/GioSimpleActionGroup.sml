structure GioSimpleActionGroup :>
  GIO_SIMPLE_ACTION_GROUP
    where type 'a class_t = 'a GioSimpleActionGroupClass.t
    where type 'a actiongroupclass_t = 'a GioActionGroupClass.t
    where type actionentryrecord_t = GioActionEntryRecord.t
    where type 'a actionclass_t = 'a GioActionClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_simple_action_group_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val new_ = call (load_sym libgio "g_simple_action_group_new") (FFI.PolyML.VOID --> GObjectObjectClass.PolyML.PTR)
      val addEntries_ =
        call (load_sym libgio "g_simple_action_group_add_entries")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GioActionEntryRecord.PolyML.PTR
             &&> FFI.PolyML.Int32.VAL
             --> FFI.PolyML.VOID
          )
      val insert_ = call (load_sym libgio "g_simple_action_group_insert") (GObjectObjectClass.PolyML.PTR &&> GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val lookup_ = call (load_sym libgio "g_simple_action_group_lookup") (GObjectObjectClass.PolyML.PTR &&> FFI.PolyML.String.INPTR --> GObjectObjectClass.PolyML.PTR)
      val remove_ = call (load_sym libgio "g_simple_action_group_remove") (GObjectObjectClass.PolyML.PTR &&> FFI.PolyML.String.INPTR --> FFI.PolyML.VOID)
    end
    type 'a class_t = 'a GioSimpleActionGroupClass.t
    type 'a actiongroupclass_t = 'a GioActionGroupClass.t
    type actionentryrecord_t = GioActionEntryRecord.t
    type 'a actionclass_t = 'a GioActionClass.t
    fun asActionGroup self = (GObjectObjectClass.C.withPtr ---> GioActionGroupClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GioSimpleActionGroupClass.C.fromPtr true) new_ ()
    fun addEntries self entries nEntries =
      (
        GObjectObjectClass.C.withPtr
         &&&> GioActionEntryRecord.C.withPtr
         &&&> FFI.Int32.withVal
         ---> I
      )
        addEntries_
        (
          self
           & entries
           & nEntries
        )
    fun insert self action = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> I) insert_ (self & action)
    fun lookup self actionName = (GObjectObjectClass.C.withPtr &&&> FFI.String.withConstPtr ---> GioActionClass.C.fromPtr false) lookup_ (self & actionName)
    fun remove self actionName = (GObjectObjectClass.C.withPtr &&&> FFI.String.withConstPtr ---> I) remove_ (self & actionName)
  end
