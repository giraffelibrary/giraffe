structure GtkComboBoxText :>
  GTK_COMBO_BOX_TEXT
    where type 'a class = 'a GtkComboBoxTextClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a cell_editable_class = 'a GtkCellEditableClass.class
    where type 'a cell_layout_class = 'a GtkCellLayoutClass.class =
  struct
    val getType_ = _import "gtk_combo_box_text_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "gtk_combo_box_text_new" : unit -> GtkWidgetClass.FFI.notnull GtkWidgetClass.FFI.p;
    val newWithEntry_ = _import "gtk_combo_box_text_new_with_entry" : unit -> GtkWidgetClass.FFI.notnull GtkWidgetClass.FFI.p;
    val append_ =
      fn
        x1
         & (x2, x3)
         & (x4, x5) =>
          (
            _import "mlton_gtk_combo_box_text_append" :
              GtkComboBoxTextClass.FFI.notnull GtkComboBoxTextClass.FFI.p
               * Utf8.MLton.p1
               * unit Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
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
              GtkComboBoxTextClass.FFI.notnull GtkComboBoxTextClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val getActiveText_ = _import "gtk_combo_box_text_get_active_text" : GtkComboBoxTextClass.FFI.notnull GtkComboBoxTextClass.FFI.p -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val insert_ =
      fn
        x1
         & x2
         & (x3, x4)
         & (x5, x6) =>
          (
            _import "mlton_gtk_combo_box_text_insert" :
              GtkComboBoxTextClass.FFI.notnull GtkComboBoxTextClass.FFI.p
               * GInt32.FFI.val_
               * Utf8.MLton.p1
               * unit Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
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
              GtkComboBoxTextClass.FFI.notnull GtkComboBoxTextClass.FFI.p
               * GInt32.FFI.val_
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
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
              GtkComboBoxTextClass.FFI.notnull GtkComboBoxTextClass.FFI.p
               * Utf8.MLton.p1
               * unit Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
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
              GtkComboBoxTextClass.FFI.notnull GtkComboBoxTextClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val remove_ = fn x1 & x2 => (_import "gtk_combo_box_text_remove" : GtkComboBoxTextClass.FFI.notnull GtkComboBoxTextClass.FFI.p * GInt32.FFI.val_ -> unit;) (x1, x2)
    val removeAll_ = _import "gtk_combo_box_text_remove_all" : GtkComboBoxTextClass.FFI.notnull GtkComboBoxTextClass.FFI.p -> unit;
    type 'a class = 'a GtkComboBoxTextClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a cell_editable_class = 'a GtkCellEditableClass.class
    type 'a cell_layout_class = 'a GtkCellLayoutClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr ---> GtkBuildableClass.FFI.fromPtr false) I self
    fun asCellEditable self = (GObjectObjectClass.FFI.withPtr ---> GtkCellEditableClass.FFI.fromPtr false) I self
    fun asCellLayout self = (GObjectObjectClass.FFI.withPtr ---> GtkCellLayoutClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkComboBoxTextClass.FFI.fromPtr false) new_ ()
    fun newWithEntry () = (I ---> GtkComboBoxTextClass.FFI.fromPtr false) newWithEntry_ ()
    fun append self (id, text) =
      (
        GtkComboBoxTextClass.FFI.withPtr
         &&&> Utf8.FFI.withOptPtr
         &&&> Utf8.FFI.withPtr
         ---> I
      )
        append_
        (
          self
           & id
           & text
        )
    fun appendText self text = (GtkComboBoxTextClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> I) appendText_ (self & text)
    fun getActiveText self = (GtkComboBoxTextClass.FFI.withPtr ---> Utf8.FFI.fromPtr 1) getActiveText_ self
    fun insert
      self
      (
        position,
        id,
        text
      ) =
      (
        GtkComboBoxTextClass.FFI.withPtr
         &&&> GInt32.FFI.withVal
         &&&> Utf8.FFI.withOptPtr
         &&&> Utf8.FFI.withPtr
         ---> I
      )
        insert_
        (
          self
           & position
           & id
           & text
        )
    fun insertText self (position, text) =
      (
        GtkComboBoxTextClass.FFI.withPtr
         &&&> GInt32.FFI.withVal
         &&&> Utf8.FFI.withPtr
         ---> I
      )
        insertText_
        (
          self
           & position
           & text
        )
    fun prepend self (id, text) =
      (
        GtkComboBoxTextClass.FFI.withPtr
         &&&> Utf8.FFI.withOptPtr
         &&&> Utf8.FFI.withPtr
         ---> I
      )
        prepend_
        (
          self
           & id
           & text
        )
    fun prependText self text = (GtkComboBoxTextClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> I) prependText_ (self & text)
    fun remove self position = (GtkComboBoxTextClass.FFI.withPtr &&&> GInt32.FFI.withVal ---> I) remove_ (self & position)
    fun removeAll self = (GtkComboBoxTextClass.FFI.withPtr ---> I) removeAll_ self
  end
