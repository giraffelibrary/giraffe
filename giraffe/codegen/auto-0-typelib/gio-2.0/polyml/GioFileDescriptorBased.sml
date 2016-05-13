structure GioFileDescriptorBased :>
  GIO_FILE_DESCRIPTOR_BASED
    where type 'a class = 'a GioFileDescriptorBasedClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_file_descriptor_based_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val getFd_ = call (load_sym libgio "g_file_descriptor_based_get_fd") (GioFileDescriptorBasedClass.PolyML.cPtr --> FFI.Int32.PolyML.cVal)
    end
    type 'a class = 'a GioFileDescriptorBasedClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun getFd self = (GioFileDescriptorBasedClass.C.withPtr ---> FFI.Int32.C.fromVal) getFd_ self
  end
