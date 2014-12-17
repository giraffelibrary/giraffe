structure GioFileDescriptorBased :>
  GIO_FILE_DESCRIPTOR_BASED
    where type 'a class_t = 'a GioFileDescriptorBasedClass.t =
  struct
    val getType_ = _import "g_file_descriptor_based_get_type" : unit -> GObjectType.C.val_;
    val getFd_ = _import "g_file_descriptor_based_get_fd" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Int32.C.val_;
    type 'a class_t = 'a GioFileDescriptorBasedClass.t
    type t = base class_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun getFd self = (GObjectObjectClass.C.withPtr ---> FFI.Int32.C.fromVal) getFd_ self
  end
