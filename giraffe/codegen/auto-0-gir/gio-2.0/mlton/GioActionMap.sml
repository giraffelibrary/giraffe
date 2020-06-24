structure GioActionMap :>
  GIO_ACTION_MAP
    where type 'a class = 'a GioActionMapClass.class
    where type 'a action_class = 'a GioActionClass.class =
  struct
    val getType_ = _import "g_action_map_get_type" : unit -> GObjectType.FFI.val_;
    val addAction_ = fn x1 & x2 => (_import "g_action_map_add_action" : GioActionMapClass.FFI.non_opt GioActionMapClass.FFI.p * GioActionClass.FFI.non_opt GioActionClass.FFI.p -> unit;) (x1, x2)
    val lookupAction_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_action_map_lookup_action" :
              GioActionMapClass.FFI.non_opt GioActionMapClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> GioActionClass.FFI.non_opt GioActionClass.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val removeAction_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_action_map_remove_action" :
              GioActionMapClass.FFI.non_opt GioActionMapClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    type 'a class = 'a GioActionMapClass.class
    type 'a action_class = 'a GioActionClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun addAction self action = (GioActionMapClass.FFI.withPtr &&&> GioActionClass.FFI.withPtr ---> I) addAction_ (self & action)
    fun lookupAction self actionName = (GioActionMapClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> GioActionClass.FFI.fromPtr false) lookupAction_ (self & actionName)
    fun removeAction self actionName = (GioActionMapClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> I) removeAction_ (self & actionName)
  end
