signature GTK_COMBO_BOX_TEXT =
  sig
    type 'a class_t
    type 'a celllayoutclass_t
    type 'a celleditableclass_t
    type 'a buildableclass_t
    val asImplementorIface : 'a class_t -> base Atk.ImplementorIfaceClass.t
    val asBuildable : 'a class_t -> base buildableclass_t
    val asCellEditable : 'a class_t -> base celleditableclass_t
    val asCellLayout : 'a class_t -> base celllayoutclass_t
    val getType : unit -> GObject.Type.t
    val new : unit -> base class_t
    val newWithEntry : unit -> base class_t
    val append :
      'a class_t
       -> string option
       -> string
       -> unit
    val appendText :
      'a class_t
       -> string
       -> unit
    val getActiveText : 'a class_t -> string
    val insert :
      'a class_t
       -> LargeInt.int
       -> string option
       -> string
       -> unit
    val insertText :
      'a class_t
       -> LargeInt.int
       -> string
       -> unit
    val prepend :
      'a class_t
       -> string option
       -> string
       -> unit
    val prependText :
      'a class_t
       -> string
       -> unit
    val remove :
      'a class_t
       -> LargeInt.int
       -> unit
    val removeAll : 'a class_t -> unit
  end
