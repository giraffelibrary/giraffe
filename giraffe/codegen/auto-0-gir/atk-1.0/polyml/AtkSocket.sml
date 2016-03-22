structure AtkSocket :>
  ATK_SOCKET
    where type 'a class = 'a AtkSocketClass.class
    where type 'a component_class = 'a AtkComponentClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libatk "atk_socket_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libatk "atk_socket_new") (FFI.PolyML.cVoid --> AtkObjectClass.PolyML.cPtr)
      val embed_ = call (load_sym libatk "atk_socket_embed") (AtkSocketClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> FFI.PolyML.cVoid)
      val isOccupied_ = call (load_sym libatk "atk_socket_is_occupied") (AtkSocketClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
    end
    type 'a class = 'a AtkSocketClass.class
    type 'a component_class = 'a AtkComponentClass.class
    type t = base class
    fun asComponent self = (GObjectObjectClass.C.withPtr ---> AtkComponentClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> AtkSocketClass.C.fromPtr true) new_ ()
    fun embed self plugId = (AtkSocketClass.C.withPtr &&&> Utf8.C.withPtr ---> I) embed_ (self & plugId)
    fun isOccupied self = (AtkSocketClass.C.withPtr ---> FFI.Bool.C.fromVal) isOccupied_ self
  end
