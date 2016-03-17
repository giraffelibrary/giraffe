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
      val new_ = call (load_sym libgtk "gtk_combo_box_text_new") (FFI.PolyML.cVoid --> GObjectObjectClass.PolyML.cPtr)
      val newWithEntry_ = call (load_sym libgtk "gtk_combo_box_text_new_with_entry") (FFI.PolyML.cVoid --> GObjectObjectClass.PolyML.cPtr)
      val append_ =
        call (load_sym libgtk "gtk_combo_box_text_append")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> Utf8.PolyML.cInOptPtr
             &&> Utf8.PolyML.cInPtr
             --> FFI.PolyML.cVoid
          )
      val appendText_ = call (load_sym libgtk "gtk_combo_box_text_append_text") (GObjectObjectClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> FFI.PolyML.cVoid)
      val getActiveText_ = call (load_sym libgtk "gtk_combo_box_text_get_active_text") (GObjectObjectClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val insert_ =
        call (load_sym libgtk "gtk_combo_box_text_insert")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> FFI.Int32.PolyML.cVal
             &&> Utf8.PolyML.cInOptPtr
             &&> Utf8.PolyML.cInPtr
             --> FFI.PolyML.cVoid
          )
      val insertText_ =
        call (load_sym libgtk "gtk_combo_box_text_insert_text")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> FFI.Int32.PolyML.cVal
             &&> Utf8.PolyML.cInPtr
             --> FFI.PolyML.cVoid
          )
      val prepend_ =
        call (load_sym libgtk "gtk_combo_box_text_prepend")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> Utf8.PolyML.cInOptPtr
             &&> Utf8.PolyML.cInPtr
             --> FFI.PolyML.cVoid
          )
      val prependText_ = call (load_sym libgtk "gtk_combo_box_text_prepend_text") (GObjectObjectClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> FFI.PolyML.cVoid)
      val remove_ = call (load_sym libgtk "gtk_combo_box_text_remove") (GObjectObjectClass.PolyML.cPtr &&> FFI.Int32.PolyML.cVal --> FFI.PolyML.cVoid)
      val removeAll_ = call (load_sym libgtk "gtk_combo_box_text_remove_all") (GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
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
        GObjectObjectClass.C.withPtr
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
    fun appendText self text = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withPtr ---> I) appendText_ (self & text)
    fun getActiveText self = (GObjectObjectClass.C.withPtr ---> Utf8.C.fromPtr true) getActiveText_ self
    fun insert self position id text =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.Int32.C.withVal
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
        GObjectObjectClass.C.withPtr
         &&&> FFI.Int32.C.withVal
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
        GObjectObjectClass.C.withPtr
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
    fun prependText self text = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withPtr ---> I) prependText_ (self & text)
    fun remove self position = (GObjectObjectClass.C.withPtr &&&> FFI.Int32.C.withVal ---> I) remove_ (self & position)
    fun removeAll self = (GObjectObjectClass.C.withPtr ---> I) removeAll_ self
  end
