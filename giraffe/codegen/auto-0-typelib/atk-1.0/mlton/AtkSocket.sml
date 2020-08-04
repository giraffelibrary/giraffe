structure AtkSocket :>
  ATK_SOCKET
    where type 'a class = 'a AtkSocketClass.class
    where type 'a component_class = 'a AtkComponentClass.class =
  struct
    val getType_ = _import "atk_socket_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "atk_socket_new" : unit -> AtkObjectClass.FFI.non_opt AtkObjectClass.FFI.p;
    val embed_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_atk_socket_embed" :
              AtkSocketClass.FFI.non_opt AtkSocketClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val isOccupied_ = _import "atk_socket_is_occupied" : AtkSocketClass.FFI.non_opt AtkSocketClass.FFI.p -> GBool.FFI.val_;
    type 'a class = 'a AtkSocketClass.class
    type 'a component_class = 'a AtkComponentClass.class
    type t = base class
    fun asComponent self = (GObjectObjectClass.FFI.withPtr false ---> AtkComponentClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> AtkSocketClass.FFI.fromPtr true) new_ ()
    fun embed self plugId = (AtkSocketClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> I) embed_ (self & plugId)
    fun isOccupied self = (AtkSocketClass.FFI.withPtr false ---> GBool.FFI.fromVal) isOccupied_ self
  end
