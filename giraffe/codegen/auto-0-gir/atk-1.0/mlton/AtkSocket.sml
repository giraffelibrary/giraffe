structure AtkSocket :>
  ATK_SOCKET
    where type 'a class = 'a AtkSocketClass.class
    where type 'a component_class = 'a AtkComponentClass.class =
  struct
    val getType_ = _import "atk_socket_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "atk_socket_new" : unit -> AtkObjectClass.C.notnull AtkObjectClass.C.p;
    val embed_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_atk_socket_embed" :
              AtkSocketClass.C.notnull AtkSocketClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val isOccupied_ = _import "atk_socket_is_occupied" : AtkSocketClass.C.notnull AtkSocketClass.C.p -> FFI.Bool.C.val_;
    type 'a class = 'a AtkSocketClass.class
    type 'a component_class = 'a AtkComponentClass.class
    type t = base class
    fun asComponent self = (GObjectObjectClass.C.withPtr ---> AtkComponentClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> AtkSocketClass.C.fromPtr true) new_ ()
    fun embed self plugId = (AtkSocketClass.C.withPtr &&&> Utf8.C.withPtr ---> I) embed_ (self & plugId)
    fun isOccupied self = (AtkSocketClass.C.withPtr ---> FFI.Bool.C.fromVal) isOccupied_ self
  end
