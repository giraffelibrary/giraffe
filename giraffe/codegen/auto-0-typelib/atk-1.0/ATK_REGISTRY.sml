signature ATK_REGISTRY =
  sig
    type 'a class
    type 'a object_factory_class
    type t = base class
    val getType : unit -> GObject.Type.t
    val getFactory :
      'a class
       -> GObject.Type.t
       -> base object_factory_class
    val getFactoryType :
      'a class
       -> GObject.Type.t
       -> GObject.Type.t
    val setFactoryType :
      'a class
       -> GObject.Type.t * GObject.Type.t
       -> unit
  end
