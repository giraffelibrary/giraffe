structure AtkSocket :>
  ATK_SOCKET
    where type 'a class_t = 'a AtkSocketClass.t
    where type 'a component_class_t = 'a AtkComponentClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libatk "atk_socket_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libatk "atk_socket_new") (FFI.PolyML.cVoid --> GObjectObjectClass.PolyML.cPtr)
      val embed_ = call (load_sym libatk "atk_socket_embed") (GObjectObjectClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> FFI.PolyML.cVoid)
      val isOccupied_ = call (load_sym libatk "atk_socket_is_occupied") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
    end
    type 'a class_t = 'a AtkSocketClass.t
    type 'a component_class_t = 'a AtkComponentClass.t
    type t = base class_t
    fun asComponent self = (GObjectObjectClass.C.withPtr ---> AtkComponentClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> AtkSocketClass.C.fromPtr true) new_ ()
    fun embed self plugId = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withPtr ---> I) embed_ (self & plugId)
    fun isOccupied self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) isOccupied_ self
  end
