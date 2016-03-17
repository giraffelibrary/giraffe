signature G_I_REPOSITORY_PROPERTY_INFO =
  sig
    type 'a class
    type 'a typeinfo_class
    type transfer_t
    val getFlags : 'a class -> GObject.ParamFlags.flags
    val getType : 'a class -> base typeinfo_class
    val getOwnershipTransfer : 'a class -> transfer_t
  end
