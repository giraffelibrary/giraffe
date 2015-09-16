structure GtkComboBoxText :>
  GTK_COMBO_BOX_TEXT
    where type 'a class_t = 'a GtkComboBoxTextClass.t
    where type 'a buildable_class_t = 'a GtkBuildableClass.t
    where type 'a cell_editable_class_t = 'a GtkCellEditableClass.t
    where type 'a cell_layout_class_t = 'a GtkCellLayoutClass.t =
  struct
    val getType_ = _import "gtk_combo_box_text_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "gtk_combo_box_text_new" : unit -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val newWithEntry_ = _import "gtk_combo_box_text_new_with_entry" : unit -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val append_ =
      fn
        x1
         & (x2, x3)
         & (x4, x5) =>
          (
            _import "mlton_gtk_combo_box_text_append" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               * cstring
               * unit CPointer.t
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val appendText_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_combo_box_text_append_text" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val getActiveText_ = _import "gtk_combo_box_text_get_active_text" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.String.C.notnull FFI.String.C.out_p;
    val insert_ =
      fn
        x1
         & x2
         & (x3, x4)
         & (x5, x6) =>
          (
            _import "mlton_gtk_combo_box_text_insert" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.Int.C.val_
               * cstring
               * unit CPointer.t
               * cstring
               * unit CPointer.t
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6
            )
    val insertText_ =
      fn
        x1
         & x2
         & (x3, x4) =>
          (
            _import "mlton_gtk_combo_box_text_insert_text" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.Int.C.val_
               * cstring
               * unit CPointer.t
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val prepend_ =
      fn
        x1
         & (x2, x3)
         & (x4, x5) =>
          (
            _import "mlton_gtk_combo_box_text_prepend" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               * cstring
               * unit CPointer.t
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val prependText_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_combo_box_text_prepend_text" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val remove_ = fn x1 & x2 => (_import "gtk_combo_box_text_remove" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Int.C.val_ -> unit;) (x1, x2)
    val removeAll_ = _import "gtk_combo_box_text_remove_all" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;
    type 'a class_t = 'a GtkComboBoxTextClass.t
    type 'a buildable_class_t = 'a GtkBuildableClass.t
    type 'a cell_editable_class_t = 'a GtkCellEditableClass.t
    type 'a cell_layout_class_t = 'a GtkCellLayoutClass.t
    type t = base class_t
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    fun asCellEditable self = (GObjectObjectClass.C.withPtr ---> GtkCellEditableClass.C.fromPtr false) I self
    fun asCellLayout self = (GObjectObjectClass.C.withPtr ---> GtkCellLayoutClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkComboBoxTextClass.C.fromPtr false) new_ ()
    fun newWithEntry () = (I ---> GtkComboBoxTextClass.C.fromPtr false) newWithEntry_ ()
    fun append self id text =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.String.C.withConstOptPtr
         &&&> FFI.String.C.withConstPtr
         ---> I
      )
        append_
        (
          self
           & id
           & text
        )
    fun appendText self text = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstPtr ---> I) appendText_ (self & text)
    fun getActiveText self = (GObjectObjectClass.C.withPtr ---> FFI.String.C.fromPtr true) getActiveText_ self
    fun insert self position id text =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.Int.C.withVal
         &&&> FFI.String.C.withConstOptPtr
         &&&> FFI.String.C.withConstPtr
         ---> I
      )
        insert_
        (
          self
           & position
           & id
           & text
        )
    fun insertText self position text =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.Int.C.withVal
         &&&> FFI.String.C.withConstPtr
         ---> I
      )
        insertText_
        (
          self
           & position
           & text
        )
    fun prepend self id text =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.String.C.withConstOptPtr
         &&&> FFI.String.C.withConstPtr
         ---> I
      )
        prepend_
        (
          self
           & id
           & text
        )
    fun prependText self text = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstPtr ---> I) prependText_ (self & text)
    fun remove self position = (GObjectObjectClass.C.withPtr &&&> FFI.Int.C.withVal ---> I) remove_ (self & position)
    fun removeAll self = (GObjectObjectClass.C.withPtr ---> I) removeAll_ self
  end
