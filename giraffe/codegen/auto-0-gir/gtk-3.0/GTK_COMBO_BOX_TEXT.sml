signature GTK_COMBO_BOX_TEXT =
  sig
    type 'a class
    type 'a buildable_class
    type 'a cell_editable_class
    type 'a cell_layout_class
    type t = base class
    val asImplementorIface : 'a class -> base Atk.ImplementorIfaceClass.class
    val asBuildable : 'a class -> base buildable_class
    val asCellEditable : 'a class -> base cell_editable_class
    val asCellLayout : 'a class -> base cell_layout_class
    val getType : unit -> GObject.Type.t
    val new : unit -> base class
    val newWithEntry : unit -> base class
    val append :
      'a class
       -> string option
       -> string
       -> unit
    val appendText :
      'a class
       -> string
       -> unit
    val getActiveText : 'a class -> string
    val insert :
      'a class
       -> LargeInt.int
       -> string option
       -> string
       -> unit
    val insertText :
      'a class
       -> LargeInt.int
       -> string
       -> unit
    val prepend :
      'a class
       -> string option
       -> string
       -> unit
    val prependText :
      'a class
       -> string
       -> unit
    val remove :
      'a class
       -> LargeInt.int
       -> unit
    val removeAll : 'a class -> unit
  end
