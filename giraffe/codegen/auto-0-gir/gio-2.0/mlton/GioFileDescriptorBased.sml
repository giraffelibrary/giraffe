structure GioFileDescriptorBased :>
  GIO_FILE_DESCRIPTOR_BASED
    where type 'a class = 'a GioFileDescriptorBasedClass.class =
  struct
    val getType_ = _import "g_file_descriptor_based_get_type" : unit -> GObjectType.C.val_;
    val getFd_ = _import "g_file_descriptor_based_get_fd" : GioFileDescriptorBasedClass.C.notnull GioFileDescriptorBasedClass.C.p -> FFI.Int.C.val_;
    type 'a class = 'a GioFileDescriptorBasedClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun getFd self = (GioFileDescriptorBasedClass.C.withPtr ---> FFI.Int.C.fromVal) getFd_ self
  end
