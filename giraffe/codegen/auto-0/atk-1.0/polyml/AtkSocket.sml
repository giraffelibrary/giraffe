structure AtkSocket :>
  ATK_SOCKET
    where type 'a class_t = 'a AtkSocketClass.t
    where type 'a componentclass_t = 'a AtkComponentClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libatk "atk_socket_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val new_ = call (load_sym libatk "atk_socket_new") (FFI.PolyML.VOID --> GObjectObjectClass.PolyML.PTR)
      val embed_ = call (load_sym libatk "atk_socket_embed") (GObjectObjectClass.PolyML.PTR &&> FFI.PolyML.String.INPTR --> FFI.PolyML.VOID)
      val isOccupied_ = call (load_sym libatk "atk_socket_is_occupied") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.Bool.VAL)
    end
    type 'a class_t = 'a AtkSocketClass.t
    type 'a componentclass_t = 'a AtkComponentClass.t
    fun asComponent self = (GObjectObjectClass.C.withPtr ---> AtkComponentClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> AtkSocketClass.C.fromPtr true) new_ ()
    fun embed self plugId = (GObjectObjectClass.C.withPtr &&&> FFI.String.withConstPtr ---> I) embed_ (self & plugId)
    fun isOccupied self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.fromVal) isOccupied_ self
  end
