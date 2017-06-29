structure GioFileDescriptorBased :>
  GIO_FILE_DESCRIPTOR_BASED
    where type 'a class = 'a GioFileDescriptorBasedClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_file_descriptor_based_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val getFd_ = call (getSymbol "g_file_descriptor_based_get_fd") (GioFileDescriptorBasedClass.PolyML.cPtr --> GInt32.PolyML.cVal)
    end
    type 'a class = 'a GioFileDescriptorBasedClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun getFd self = (GioFileDescriptorBasedClass.FFI.withPtr ---> GInt32.FFI.fromVal) getFd_ self
  end
