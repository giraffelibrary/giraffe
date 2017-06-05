structure GioFileDescriptorBased :>
  GIO_FILE_DESCRIPTOR_BASED
    where type 'a class = 'a GioFileDescriptorBasedClass.class =
  struct
    val getType_ = _import "g_file_descriptor_based_get_type" : unit -> GObjectType.FFI.val_;
    val getFd_ = _import "g_file_descriptor_based_get_fd" : GioFileDescriptorBasedClass.FFI.notnull GioFileDescriptorBasedClass.FFI.p -> GInt.FFI.val_;
    type 'a class = 'a GioFileDescriptorBasedClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun getFd self = (GioFileDescriptorBasedClass.FFI.withPtr ---> GInt.FFI.fromVal) getFd_ self
  end
