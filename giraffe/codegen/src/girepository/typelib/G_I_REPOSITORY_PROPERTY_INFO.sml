signature G_I_REPOSITORY_PROPERTY_INFO =
  sig
    type 'a class_t
    type 'a typeinfoclass_t
    type transfer_t
    val getFlags : 'a class_t -> GObject.ParamFlags.flags
    val getType : 'a class_t -> base typeinfoclass_t
    val getOwnershipTransfer : 'a class_t -> transfer_t
  end
