structure AtkSocket :>
  ATK_SOCKET
    where type 'a class = 'a AtkSocketClass.class
    where type 'a component_class = 'a AtkComponentClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libatk "atk_socket_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libatk "atk_socket_new") (PolyMLFFI.cVoid --> AtkObjectClass.PolyML.cPtr)
      val embed_ = call (load_sym libatk "atk_socket_embed") (AtkSocketClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> PolyMLFFI.cVoid)
      val isOccupied_ = call (load_sym libatk "atk_socket_is_occupied") (AtkSocketClass.PolyML.cPtr --> GBool.PolyML.cVal)
    end
    type 'a class = 'a AtkSocketClass.class
    type 'a component_class = 'a AtkComponentClass.class
    type t = base class
    fun asComponent self = (GObjectObjectClass.FFI.withPtr ---> AtkComponentClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> AtkSocketClass.FFI.fromPtr true) new_ ()
    fun embed self plugId = (AtkSocketClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> I) embed_ (self & plugId)
    fun isOccupied self = (AtkSocketClass.FFI.withPtr ---> GBool.FFI.fromVal) isOccupied_ self
  end
