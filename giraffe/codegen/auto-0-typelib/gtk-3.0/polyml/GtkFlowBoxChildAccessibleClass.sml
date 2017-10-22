structure GtkFlowBoxChildAccessibleClass :>
  GTK_FLOW_BOX_CHILD_ACCESSIBLE_CLASS
    where type 'a container_accessible_class = 'a GtkContainerAccessibleClass.class
    where type C.notnull = GtkContainerAccessibleClass.C.notnull
    where type 'a C.p = 'a GtkContainerAccessibleClass.C.p =
  struct
    type 'a container_accessible_class = 'a GtkContainerAccessibleClass.class
    open GtkContainerAccessibleClass
    type 'a flow_box_child_accessible = unit
    type 'a class = 'a flow_box_child_accessible class
  end
