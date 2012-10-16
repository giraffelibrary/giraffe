structure AtkSocket :>
  ATK_SOCKET
    where type 'a class_t = 'a AtkSocketClass.t
    where type 'a componentclass_t = 'a AtkComponentClass.t =
  struct
    val getType_ = _import "atk_socket_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "atk_socket_new" : unit -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val embed_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_atk_socket_embed" :
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
    val isOccupied_ = _import "atk_socket_is_occupied" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.val_;
    type 'a class_t = 'a AtkSocketClass.t
    type 'a componentclass_t = 'a AtkComponentClass.t
    fun asComponent self = (GObjectObjectClass.C.withPtr ---> AtkComponentClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> AtkSocketClass.C.fromPtr true) new_ ()
    fun embed self plugId = (GObjectObjectClass.C.withPtr &&&> FFI.String.withConstPtr ---> I) embed_ (self & plugId)
    fun isOccupied self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.fromVal) isOccupied_ self
  end
