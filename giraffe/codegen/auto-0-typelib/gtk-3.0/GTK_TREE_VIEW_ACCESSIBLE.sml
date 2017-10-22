signature GTK_TREE_VIEW_ACCESSIBLE =
  sig
    type 'a class
    type 'a cell_accessible_parent_class
    type t = base class
    val asComponent : 'a class -> base Atk.ComponentClass.class
    val asSelection : 'a class -> base Atk.SelectionClass.class
    val asTable : 'a class -> base Atk.TableClass.class
    val asCellAccessibleParent : 'a class -> base cell_accessible_parent_class
    val getType : unit -> GObject.Type.t
  end
