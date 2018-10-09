signature GTK_FLOW_BOX_CHILD_CLASS =
  sig
    type 'a flow_box_child
    type 'a bin_class
    include
      CLASS
        where type 'a class = 'a flow_box_child bin_class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
    val toDerived :
      ('a class, 'b) ValueAccessor.t
       -> base class
       -> 'a class
  end
