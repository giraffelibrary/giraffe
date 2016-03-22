structure GtkComboBoxText :>
  GTK_COMBO_BOX_TEXT
    where type 'a class = 'a GtkComboBoxTextClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a cell_editable_class = 'a GtkCellEditableClass.class
    where type 'a cell_layout_class = 'a GtkCellLayoutClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_combo_box_text_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgtk "gtk_combo_box_text_new") (FFI.PolyML.cVoid --> GtkWidgetClass.PolyML.cPtr)
      val newWithEntry_ = call (load_sym libgtk "gtk_combo_box_text_new_with_entry") (FFI.PolyML.cVoid --> GtkWidgetClass.PolyML.cPtr)
      val append_ =
        call (load_sym libgtk "gtk_combo_box_text_append")
          (
            GtkComboBoxTextClass.PolyML.cPtr
             &&> Utf8.PolyML.cInOptPtr
             &&> Utf8.PolyML.cInPtr
             --> FFI.PolyML.cVoid
          )
      val appendText_ = call (load_sym libgtk "gtk_combo_box_text_append_text") (GtkComboBoxTextClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> FFI.PolyML.cVoid)
      val getActiveText_ = call (load_sym libgtk "gtk_combo_box_text_get_active_text") (GtkComboBoxTextClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val insert_ =
        call (load_sym libgtk "gtk_combo_box_text_insert")
          (
            GtkComboBoxTextClass.PolyML.cPtr
             &&> FFI.Int.PolyML.cVal
             &&> Utf8.PolyML.cInOptPtr
             &&> Utf8.PolyML.cInPtr
             --> FFI.PolyML.cVoid
          )
      val insertText_ =
        call (load_sym libgtk "gtk_combo_box_text_insert_text")
          (
            GtkComboBoxTextClass.PolyML.cPtr
             &&> FFI.Int.PolyML.cVal
             &&> Utf8.PolyML.cInPtr
             --> FFI.PolyML.cVoid
          )
      val prepend_ =
        call (load_sym libgtk "gtk_combo_box_text_prepend")
          (
            GtkComboBoxTextClass.PolyML.cPtr
             &&> Utf8.PolyML.cInOptPtr
             &&> Utf8.PolyML.cInPtr
             --> FFI.PolyML.cVoid
          )
      val prependText_ = call (load_sym libgtk "gtk_combo_box_text_prepend_text") (GtkComboBoxTextClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> FFI.PolyML.cVoid)
      val remove_ = call (load_sym libgtk "gtk_combo_box_text_remove") (GtkComboBoxTextClass.PolyML.cPtr &&> FFI.Int.PolyML.cVal --> FFI.PolyML.cVoid)
      val removeAll_ = call (load_sym libgtk "gtk_combo_box_text_remove_all") (GtkComboBoxTextClass.PolyML.cPtr --> FFI.PolyML.cVoid)
    end
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
