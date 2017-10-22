signature GTK_NOTEBOOK_PAGE_ACCESSIBLE =
  sig
    type 'a class
    type 'a widget_class
    type 'a notebook_accessible_class
    type t = base class
    val asComponent : 'a class -> base Atk.ComponentClass.class
    val getType : unit -> GObject.Type.t
    val new : 'a notebook_accessible_class * 'b widget_class -> base class
    val invalidate : 'a class -> unit
  end
