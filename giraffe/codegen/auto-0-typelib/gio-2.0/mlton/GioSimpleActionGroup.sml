structure GioSimpleActionGroup :>
  GIO_SIMPLE_ACTION_GROUP
    where type 'a class = 'a GioSimpleActionGroupClass.class
    where type 'a action_group_class = 'a GioActionGroupClass.class
    where type 'a action_class = 'a GioActionClass.class =
  struct
    val getType_ = _import "g_simple_action_group_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "g_simple_action_group_new" : unit -> GioSimpleActionGroupClass.C.notnull GioSimpleActionGroupClass.C.p;
    val insert_ = fn x1 & x2 => (_import "g_simple_action_group_insert" : GioSimpleActionGroupClass.C.notnull GioSimpleActionGroupClass.C.p * GioActionClass.C.notnull GioActionClass.C.p -> unit;) (x1, x2)
    val lookup_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_simple_action_group_lookup" :
              GioSimpleActionGroupClass.C.notnull GioSimpleActionGroupClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               -> GioActionClass.C.notnull GioActionClass.C.p;
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
              GioSimpleActionGroupClass.C.notnull GioSimpleActionGroupClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    type 'a class = 'a GioSimpleActionGroupClass.class
    type 'a action_group_class = 'a GioActionGroupClass.class
    type 'a action_class = 'a GioActionClass.class
    type t = base class
    fun asActionGroup self = (GObjectObjectClass.C.withPtr ---> GioActionGroupClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GioSimpleActionGroupClass.C.fromPtr true) new_ ()
    fun insert self action = (GioSimpleActionGroupClass.C.withPtr &&&> GioActionClass.C.withPtr ---> I) insert_ (self & action)
    fun lookup self actionName = (GioSimpleActionGroupClass.C.withPtr &&&> Utf8.C.withPtr ---> GioActionClass.C.fromPtr false) lookup_ (self & actionName)
    fun remove self actionName = (GioSimpleActionGroupClass.C.withPtr &&&> Utf8.C.withPtr ---> I) remove_ (self & actionName)
  end
