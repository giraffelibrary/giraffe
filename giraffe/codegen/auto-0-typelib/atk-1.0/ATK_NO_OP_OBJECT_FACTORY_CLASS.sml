signature ATK_NO_OP_OBJECT_FACTORY_CLASS =
  sig
    type 'a no_op_object_factory
    type 'a object_factory_class_t
    type 'a t = 'a no_op_object_factory object_factory_class_t
    val toBase : 'a t -> base t
    val t : (base t, 'a t) GObject.Value.accessor
    val tOpt : (base t option, 'a t option) GObject.Value.accessor
    structure C :
      sig
        type notnull
        type 'a p
        val fromPtr :
          bool
           -> notnull p
           -> 'a t
        val fromOptPtr :
          bool
           -> unit p
           -> 'a t option
      end
  end
