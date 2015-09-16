structure GioSimpleActionGroup :>
  GIO_SIMPLE_ACTION_GROUP
    where type 'a class_t = 'a GioSimpleActionGroupClass.t
    where type 'a action_group_class_t = 'a GioActionGroupClass.t
    where type 'a action_class_t = 'a GioActionClass.t =
  struct
    val getType_ = _import "g_simple_action_group_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "g_simple_action_group_new" : unit -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
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
    type 'a action_group_class_t = 'a GioActionGroupClass.t
    type 'a action_class_t = 'a GioActionClass.t
    type t = base class_t
    fun asActionGroup self = (GObjectObjectClass.C.withPtr ---> GioActionGroupClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GioSimpleActionGroupClass.C.fromPtr true) new_ ()
    fun insert self action = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> I) insert_ (self & action)
    fun lookup self actionName = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstPtr ---> GioActionClass.C.fromPtr false) lookup_ (self & actionName)
    fun remove self actionName = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstPtr ---> I) remove_ (self & actionName)
  end
