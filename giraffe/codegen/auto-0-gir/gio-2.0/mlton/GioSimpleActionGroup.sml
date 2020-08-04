structure GioSimpleActionGroup :>
  GIO_SIMPLE_ACTION_GROUP
    where type 'a class = 'a GioSimpleActionGroupClass.class
    where type 'a action_group_class = 'a GioActionGroupClass.class
    where type 'a action_map_class = 'a GioActionMapClass.class
    where type 'a action_class = 'a GioActionClass.class =
  struct
    val getType_ = _import "g_simple_action_group_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "g_simple_action_group_new" : unit -> GioSimpleActionGroupClass.FFI.non_opt GioSimpleActionGroupClass.FFI.p;
    val insert_ = fn x1 & x2 => (_import "g_simple_action_group_insert" : GioSimpleActionGroupClass.FFI.non_opt GioSimpleActionGroupClass.FFI.p * GioActionClass.FFI.non_opt GioActionClass.FFI.p -> unit;) (x1, x2)
    val lookup_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_simple_action_group_lookup" :
              GioSimpleActionGroupClass.FFI.non_opt GioSimpleActionGroupClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> GioActionClass.FFI.non_opt GioActionClass.FFI.p;
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
              GioSimpleActionGroupClass.FFI.non_opt GioSimpleActionGroupClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    type 'a class = 'a GioSimpleActionGroupClass.class
    type 'a action_group_class = 'a GioActionGroupClass.class
    type 'a action_map_class = 'a GioActionMapClass.class
    type 'a action_class = 'a GioActionClass.class
    type t = base class
    fun asActionGroup self = (GObjectObjectClass.FFI.withPtr false ---> GioActionGroupClass.FFI.fromPtr false) I self
    fun asActionMap self = (GObjectObjectClass.FFI.withPtr false ---> GioActionMapClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GioSimpleActionGroupClass.FFI.fromPtr true) new_ ()
    fun insert self action = (GioSimpleActionGroupClass.FFI.withPtr false &&&> GioActionClass.FFI.withPtr false ---> I) insert_ (self & action)
    fun lookup self actionName = (GioSimpleActionGroupClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> GioActionClass.FFI.fromPtr false) lookup_ (self & actionName)
    fun remove self actionName = (GioSimpleActionGroupClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> I) remove_ (self & actionName)
  end
