structure GObjectBindingClass :>
  G_OBJECT_BINDING_CLASS
    where type 'a object_class_t = 'a GObjectObjectClass.t
    where type ('a, 'b) value_accessor = ('a, 'b) GObjectValue.accessor
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    type 'a binding = unit
    type 'a object_class_t = 'a GObjectObjectClass.t
    type 'a t = 'a binding object_class_t
    fun toBase obj = obj
    type ('a, 'b) value_accessor = ('a, 'b) GObjectValue.accessor
    val t = GObjectObjectClass.t
    val tOpt = GObjectObjectClass.tOpt
    structure C = GObjectObjectClass.C
  end
