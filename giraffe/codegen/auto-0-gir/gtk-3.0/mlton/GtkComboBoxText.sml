structure GtkComboBoxText :>
  GTK_COMBO_BOX_TEXT
    where type 'a class = 'a GtkComboBoxTextClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a cell_editable_class = 'a GtkCellEditableClass.class
    where type 'a cell_layout_class = 'a GtkCellLayoutClass.class =
  struct
    val getType_ = _import "gtk_combo_box_text_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "gtk_combo_box_text_new" : unit -> GtkWidgetClass.C.notnull GtkWidgetClass.C.p;
    val newWithEntry_ = _import "gtk_combo_box_text_new_with_entry" : unit -> GtkWidgetClass.C.notnull GtkWidgetClass.C.p;
    val append_ =
      fn
        x1
         & (x2, x3)
         & (x4, x5) =>
          (
            _import "mlton_gtk_combo_box_text_append" :
              GtkComboBoxTextClass.C.notnull GtkComboBoxTextClass.C.p
               * Utf8.MLton.p1
               * unit Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
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
              GtkComboBoxTextClass.C.notnull GtkComboBoxTextClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val getActiveText_ = _import "gtk_combo_box_text_get_active_text" : GtkComboBoxTextClass.C.notnull GtkComboBoxTextClass.C.p -> Utf8.C.notnull Utf8.C.out_p;
    val insert_ =
      fn
        x1
         & x2
         & (x3, x4)
         & (x5, x6) =>
          (
            _import "mlton_gtk_combo_box_text_insert" :
              GtkComboBoxTextClass.C.notnull GtkComboBoxTextClass.C.p
               * FFI.Int.C.val_
               * Utf8.MLton.p1
               * unit Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
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
              GtkComboBoxTextClass.C.notnull GtkComboBoxTextClass.C.p
               * FFI.Int.C.val_
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
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
              GtkComboBoxTextClass.C.notnull GtkComboBoxTextClass.C.p
               * Utf8.MLton.p1
               * unit Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
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
              GtkComboBoxTextClass.C.notnull GtkComboBoxTextClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val remove_ = fn x1 & x2 => (_import "gtk_combo_box_text_remove" : GtkComboBoxTextClass.C.notnull GtkComboBoxTextClass.C.p * FFI.Int.C.val_ -> unit;) (x1, x2)
    val removeAll_ = _import "gtk_combo_box_text_remove_all" : GtkComboBoxTextClass.C.notnull GtkComboBoxTextClass.C.p -> unit;
    type 'a class = 'a GtkComboBoxTextClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a cell_editable_class = 'a GtkCellEditableClass.class
    type 'a cell_layout_class = 'a GtkCellLayoutClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    fun asCellEditable self = (GObjectObjectClass.C.withPtr ---> GtkCellEditableClass.C.fromPtr false) I self
    fun asCellLayout self = (GObjectObjectClass.C.withPtr ---> GtkCellLayoutClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkComboBoxTextClass.C.fromPtr false) new_ ()
    fun newWithEntry () = (I ---> GtkComboBoxTextClass.C.fromPtr false) newWithEntry_ ()
    fun append self id text =
      (
        GtkComboBoxTextClass.C.withPtr
         &&&> Utf8.C.withOptPtr
         &&&> Utf8.C.withPtr
         ---> I
      )
        append_
        (
          self
           & id
           & text
        )
    fun appendText self text = (GtkComboBoxTextClass.C.withPtr &&&> Utf8.C.withPtr ---> I) appendText_ (self & text)
    fun getActiveText self = (GtkComboBoxTextClass.C.withPtr ---> Utf8.C.fromPtr true) getActiveText_ self
    fun insert self position id text =
      (
        GtkComboBoxTextClass.C.withPtr
         &&&> FFI.Int.C.withVal
         &&&> Utf8.C.withOptPtr
         &&&> Utf8.C.withPtr
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
        GtkComboBoxTextClass.C.withPtr
         &&&> FFI.Int.C.withVal
         &&&> Utf8.C.withPtr
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
        GtkComboBoxTextClass.C.withPtr
         &&&> Utf8.C.withOptPtr
         &&&> Utf8.C.withPtr
         ---> I
      )
        prepend_
        (
          self
           & id
           & text
        )
    fun prependText self text = (GtkComboBoxTextClass.C.withPtr &&&> Utf8.C.withPtr ---> I) prependText_ (self & text)
    fun remove self position = (GtkComboBoxTextClass.C.withPtr &&&> FFI.Int.C.withVal ---> I) remove_ (self & position)
    fun removeAll self = (GtkComboBoxTextClass.C.withPtr ---> I) removeAll_ self
  end
