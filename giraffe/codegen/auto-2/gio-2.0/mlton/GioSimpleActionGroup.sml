structure GioSimpleActionGroup :>
  GIO_SIMPLE_ACTION_GROUP
    where type 'a class_t = 'a GioSimpleActionGroupClass.t
    where type 'a actiongroupclass_t = 'a GioActionGroupClass.t
    where type actionentryrecord_t = GioActionEntryRecord.t
    where type 'a actionclass_t = 'a GioActionClass.t =
  struct
    val getType_ = _import "g_simple_action_group_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "g_simple_action_group_new" : unit -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val addEntries_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_simple_action_group_add_entries" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GioActionEntryRecord.C.notnull GioActionEntryRecord.C.p
               * FFI.Int32.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val insert_ = fn x1 & x2 => (_import "g_simple_action_group_insert" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;) (x1, x2)
    val lookup_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_simple_action_group_lookup" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
          )
            (
              x1,
              x2,
              x3
            )
    val remove_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_simple_action_group_remove" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
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
