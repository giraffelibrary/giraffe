structure GtkIconView :>
  GTK_ICON_VIEW
    where type 'a class = 'a GtkIconViewClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a cell_layout_class = 'a GtkCellLayoutClass.class
    where type 'a scrollable_class = 'a GtkScrollableClass.class
    where type tree_iter_t = GtkTreeIterRecord.t
    where type icon_view_drop_position_t = GtkIconViewDropPosition.t
    where type 'a cell_renderer_class = 'a GtkCellRendererClass.class
    where type 'a tooltip_class = 'a GtkTooltipClass.class
    where type tree_path_t = GtkTreePathRecord.t
    where type movement_step_t = GtkMovementStep.t
    where type 'a cell_area_class = 'a GtkCellAreaClass.class
    where type orientation_t = GtkOrientation.t
    where type 'a tree_model_class = 'a GtkTreeModelClass.class
    where type selection_mode_t = GtkSelectionMode.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_icon_view_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgtk "gtk_icon_view_new") (FFI.PolyML.cVoid --> GObjectObjectClass.PolyML.cPtr)
      val newWithArea_ = call (load_sym libgtk "gtk_icon_view_new_with_area") (GObjectObjectClass.PolyML.cPtr --> GObjectObjectClass.PolyML.cPtr)
      val newWithModel_ = call (load_sym libgtk "gtk_icon_view_new_with_model") (GObjectObjectClass.PolyML.cPtr --> GObjectObjectClass.PolyML.cPtr)
      val convertWidgetToBinWindowCoords_ =
        call (load_sym libgtk "gtk_icon_view_convert_widget_to_bin_window_coords")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> FFI.Int32.PolyML.cVal
             &&> FFI.Int32.PolyML.cVal
             &&> FFI.Int32.PolyML.cRef
             &&> FFI.Int32.PolyML.cRef
             --> FFI.PolyML.cVoid
          )
      val createDragIcon_ = call (load_sym libgtk "gtk_icon_view_create_drag_icon") (GObjectObjectClass.PolyML.cPtr &&> GtkTreePathRecord.PolyML.cPtr --> CairoSurfaceRecord.PolyML.cPtr)
      val getColumnSpacing_ = call (load_sym libgtk "gtk_icon_view_get_column_spacing") (GObjectObjectClass.PolyML.cPtr --> FFI.Int32.PolyML.cVal)
      val getColumns_ = call (load_sym libgtk "gtk_icon_view_get_columns") (GObjectObjectClass.PolyML.cPtr --> FFI.Int32.PolyML.cVal)
      val getCursor_ =
        call (load_sym libgtk "gtk_icon_view_get_cursor")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GtkTreePathRecord.PolyML.cOutRef
             &&> GObjectObjectClass.PolyML.cOutRef
             --> FFI.Bool.PolyML.cVal
          )
      val getDestItemAtPos_ =
        call (load_sym libgtk "gtk_icon_view_get_dest_item_at_pos")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> FFI.Int32.PolyML.cVal
             &&> FFI.Int32.PolyML.cVal
             &&> GtkTreePathRecord.PolyML.cOutRef
             &&> GtkIconViewDropPosition.PolyML.cRef
             --> FFI.Bool.PolyML.cVal
          )
      val getDragDestItem_ =
        call (load_sym libgtk "gtk_icon_view_get_drag_dest_item")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GtkTreePathRecord.PolyML.cOutRef
             &&> GtkIconViewDropPosition.PolyML.cRef
             --> FFI.PolyML.cVoid
          )
      val getItemAtPos_ =
        call (load_sym libgtk "gtk_icon_view_get_item_at_pos")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> FFI.Int32.PolyML.cVal
             &&> FFI.Int32.PolyML.cVal
             &&> GtkTreePathRecord.PolyML.cOutRef
             &&> GObjectObjectClass.PolyML.cOutRef
             --> FFI.Bool.PolyML.cVal
          )
      val getItemColumn_ = call (load_sym libgtk "gtk_icon_view_get_item_column") (GObjectObjectClass.PolyML.cPtr &&> GtkTreePathRecord.PolyML.cPtr --> FFI.Int32.PolyML.cVal)
      val getItemOrientation_ = call (load_sym libgtk "gtk_icon_view_get_item_orientation") (GObjectObjectClass.PolyML.cPtr --> GtkOrientation.PolyML.cVal)
      val getItemPadding_ = call (load_sym libgtk "gtk_icon_view_get_item_padding") (GObjectObjectClass.PolyML.cPtr --> FFI.Int32.PolyML.cVal)
      val getItemRow_ = call (load_sym libgtk "gtk_icon_view_get_item_row") (GObjectObjectClass.PolyML.cPtr &&> GtkTreePathRecord.PolyML.cPtr --> FFI.Int32.PolyML.cVal)
      val getItemWidth_ = call (load_sym libgtk "gtk_icon_view_get_item_width") (GObjectObjectClass.PolyML.cPtr --> FFI.Int32.PolyML.cVal)
      val getMargin_ = call (load_sym libgtk "gtk_icon_view_get_margin") (GObjectObjectClass.PolyML.cPtr --> FFI.Int32.PolyML.cVal)
      val getMarkupColumn_ = call (load_sym libgtk "gtk_icon_view_get_markup_column") (GObjectObjectClass.PolyML.cPtr --> FFI.Int32.PolyML.cVal)
      val getModel_ = call (load_sym libgtk "gtk_icon_view_get_model") (GObjectObjectClass.PolyML.cPtr --> GObjectObjectClass.PolyML.cPtr)
      val getPathAtPos_ =
        call (load_sym libgtk "gtk_icon_view_get_path_at_pos")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> FFI.Int32.PolyML.cVal
             &&> FFI.Int32.PolyML.cVal
             --> GtkTreePathRecord.PolyML.cPtr
          )
      val getPixbufColumn_ = call (load_sym libgtk "gtk_icon_view_get_pixbuf_column") (GObjectObjectClass.PolyML.cPtr --> FFI.Int32.PolyML.cVal)
      val getReorderable_ = call (load_sym libgtk "gtk_icon_view_get_reorderable") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getRowSpacing_ = call (load_sym libgtk "gtk_icon_view_get_row_spacing") (GObjectObjectClass.PolyML.cPtr --> FFI.Int32.PolyML.cVal)
      val getSelectionMode_ = call (load_sym libgtk "gtk_icon_view_get_selection_mode") (GObjectObjectClass.PolyML.cPtr --> GtkSelectionMode.PolyML.cVal)
      val getSpacing_ = call (load_sym libgtk "gtk_icon_view_get_spacing") (GObjectObjectClass.PolyML.cPtr --> FFI.Int32.PolyML.cVal)
      val getTextColumn_ = call (load_sym libgtk "gtk_icon_view_get_text_column") (GObjectObjectClass.PolyML.cPtr --> FFI.Int32.PolyML.cVal)
      val getTooltipColumn_ = call (load_sym libgtk "gtk_icon_view_get_tooltip_column") (GObjectObjectClass.PolyML.cPtr --> FFI.Int32.PolyML.cVal)
      val getTooltipContext_ =
        call (load_sym libgtk "gtk_icon_view_get_tooltip_context")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> FFI.Int32.PolyML.cRef
             &&> FFI.Int32.PolyML.cRef
             &&> FFI.Bool.PolyML.cVal
             &&> GObjectObjectClass.PolyML.cOutRef
             &&> GtkTreePathRecord.PolyML.cOutRef
             &&> GtkTreeIterRecord.PolyML.cPtr
             --> FFI.Bool.PolyML.cVal
          )
      val getVisibleRange_ =
        call (load_sym libgtk "gtk_icon_view_get_visible_range")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GtkTreePathRecord.PolyML.cOutRef
             &&> GtkTreePathRecord.PolyML.cOutRef
             --> FFI.Bool.PolyML.cVal
          )
      val itemActivated_ = call (load_sym libgtk "gtk_icon_view_item_activated") (GObjectObjectClass.PolyML.cPtr &&> GtkTreePathRecord.PolyML.cPtr --> FFI.PolyML.cVoid)
      val pathIsSelected_ = call (load_sym libgtk "gtk_icon_view_path_is_selected") (GObjectObjectClass.PolyML.cPtr &&> GtkTreePathRecord.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val scrollToPath_ =
        call (load_sym libgtk "gtk_icon_view_scroll_to_path")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GtkTreePathRecord.PolyML.cPtr
             &&> FFI.Bool.PolyML.cVal
             &&> FFI.Float.PolyML.cVal
             &&> FFI.Float.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val selectAll_ = call (load_sym libgtk "gtk_icon_view_select_all") (GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val selectPath_ = call (load_sym libgtk "gtk_icon_view_select_path") (GObjectObjectClass.PolyML.cPtr &&> GtkTreePathRecord.PolyML.cPtr --> FFI.PolyML.cVoid)
      val setColumnSpacing_ = call (load_sym libgtk "gtk_icon_view_set_column_spacing") (GObjectObjectClass.PolyML.cPtr &&> FFI.Int32.PolyML.cVal --> FFI.PolyML.cVoid)
      val setColumns_ = call (load_sym libgtk "gtk_icon_view_set_columns") (GObjectObjectClass.PolyML.cPtr &&> FFI.Int32.PolyML.cVal --> FFI.PolyML.cVoid)
      val setCursor_ =
        call (load_sym libgtk "gtk_icon_view_set_cursor")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GtkTreePathRecord.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cOptPtr
             &&> FFI.Bool.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val setDragDestItem_ =
        call (load_sym libgtk "gtk_icon_view_set_drag_dest_item")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GtkTreePathRecord.PolyML.cOptPtr
             &&> GtkIconViewDropPosition.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val setItemOrientation_ = call (load_sym libgtk "gtk_icon_view_set_item_orientation") (GObjectObjectClass.PolyML.cPtr &&> GtkOrientation.PolyML.cVal --> FFI.PolyML.cVoid)
      val setItemPadding_ = call (load_sym libgtk "gtk_icon_view_set_item_padding") (GObjectObjectClass.PolyML.cPtr &&> FFI.Int32.PolyML.cVal --> FFI.PolyML.cVoid)
      val setItemWidth_ = call (load_sym libgtk "gtk_icon_view_set_item_width") (GObjectObjectClass.PolyML.cPtr &&> FFI.Int32.PolyML.cVal --> FFI.PolyML.cVoid)
      val setMargin_ = call (load_sym libgtk "gtk_icon_view_set_margin") (GObjectObjectClass.PolyML.cPtr &&> FFI.Int32.PolyML.cVal --> FFI.PolyML.cVoid)
      val setMarkupColumn_ = call (load_sym libgtk "gtk_icon_view_set_markup_column") (GObjectObjectClass.PolyML.cPtr &&> FFI.Int32.PolyML.cVal --> FFI.PolyML.cVoid)
      val setModel_ = call (load_sym libgtk "gtk_icon_view_set_model") (GObjectObjectClass.PolyML.cPtr &&> GObjectObjectClass.PolyML.cOptPtr --> FFI.PolyML.cVoid)
      val setPixbufColumn_ = call (load_sym libgtk "gtk_icon_view_set_pixbuf_column") (GObjectObjectClass.PolyML.cPtr &&> FFI.Int32.PolyML.cVal --> FFI.PolyML.cVoid)
      val setReorderable_ = call (load_sym libgtk "gtk_icon_view_set_reorderable") (GObjectObjectClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
      val setRowSpacing_ = call (load_sym libgtk "gtk_icon_view_set_row_spacing") (GObjectObjectClass.PolyML.cPtr &&> FFI.Int32.PolyML.cVal --> FFI.PolyML.cVoid)
      val setSelectionMode_ = call (load_sym libgtk "gtk_icon_view_set_selection_mode") (GObjectObjectClass.PolyML.cPtr &&> GtkSelectionMode.PolyML.cVal --> FFI.PolyML.cVoid)
      val setSpacing_ = call (load_sym libgtk "gtk_icon_view_set_spacing") (GObjectObjectClass.PolyML.cPtr &&> FFI.Int32.PolyML.cVal --> FFI.PolyML.cVoid)
      val setTextColumn_ = call (load_sym libgtk "gtk_icon_view_set_text_column") (GObjectObjectClass.PolyML.cPtr &&> FFI.Int32.PolyML.cVal --> FFI.PolyML.cVoid)
      val setTooltipCell_ =
        call (load_sym libgtk "gtk_icon_view_set_tooltip_cell")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cPtr
             &&> GtkTreePathRecord.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cOptPtr
             --> FFI.PolyML.cVoid
          )
      val setTooltipColumn_ = call (load_sym libgtk "gtk_icon_view_set_tooltip_column") (GObjectObjectClass.PolyML.cPtr &&> FFI.Int32.PolyML.cVal --> FFI.PolyML.cVoid)
      val setTooltipItem_ =
        call (load_sym libgtk "gtk_icon_view_set_tooltip_item")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cPtr
             &&> GtkTreePathRecord.PolyML.cPtr
             --> FFI.PolyML.cVoid
          )
      val unselectAll_ = call (load_sym libgtk "gtk_icon_view_unselect_all") (GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val unselectPath_ = call (load_sym libgtk "gtk_icon_view_unselect_path") (GObjectObjectClass.PolyML.cPtr &&> GtkTreePathRecord.PolyML.cPtr --> FFI.PolyML.cVoid)
      val unsetModelDragDest_ = call (load_sym libgtk "gtk_icon_view_unset_model_drag_dest") (GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val unsetModelDragSource_ = call (load_sym libgtk "gtk_icon_view_unset_model_drag_source") (GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
    end
    type 'a class = 'a GtkIconViewClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a cell_layout_class = 'a GtkCellLayoutClass.class
    type 'a scrollable_class = 'a GtkScrollableClass.class
    type tree_iter_t = GtkTreeIterRecord.t
    type icon_view_drop_position_t = GtkIconViewDropPosition.t
    type 'a cell_renderer_class = 'a GtkCellRendererClass.class
    type 'a tooltip_class = 'a GtkTooltipClass.class
    type tree_path_t = GtkTreePathRecord.t
    type movement_step_t = GtkMovementStep.t
    type 'a cell_area_class = 'a GtkCellAreaClass.class
    type orientation_t = GtkOrientation.t
    type 'a tree_model_class = 'a GtkTreeModelClass.class
    type selection_mode_t = GtkSelectionMode.t
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    fun asCellLayout self = (GObjectObjectClass.C.withPtr ---> GtkCellLayoutClass.C.fromPtr false) I self
    fun asScrollable self = (GObjectObjectClass.C.withPtr ---> GtkScrollableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkIconViewClass.C.fromPtr false) new_ ()
    fun newWithArea area = (GObjectObjectClass.C.withPtr ---> GtkIconViewClass.C.fromPtr false) newWithArea_ area
    fun newWithModel model = (GObjectObjectClass.C.withPtr ---> GtkIconViewClass.C.fromPtr false) newWithModel_ model
    fun convertWidgetToBinWindowCoords self wx wy =
      let
        val bx
         & by
         & () =
          (
            GObjectObjectClass.C.withPtr
             &&&> FFI.Int32.C.withVal
             &&&> FFI.Int32.C.withVal
             &&&> FFI.Int32.C.withRefVal
             &&&> FFI.Int32.C.withRefVal
             ---> FFI.Int32.C.fromVal
                   && FFI.Int32.C.fromVal
                   && I
          )
            convertWidgetToBinWindowCoords_
            (
              self
               & wx
               & wy
               & FFI.Int32.null
               & FFI.Int32.null
            )
      in
        (bx, by)
      end
    fun createDragIcon self path = (GObjectObjectClass.C.withPtr &&&> GtkTreePathRecord.C.withPtr ---> CairoSurfaceRecord.C.fromPtr true) createDragIcon_ (self & path)
    fun getColumnSpacing self = (GObjectObjectClass.C.withPtr ---> FFI.Int32.C.fromVal) getColumnSpacing_ self
    fun getColumns self = (GObjectObjectClass.C.withPtr ---> FFI.Int32.C.fromVal) getColumns_ self
    fun getCursor self =
      let
        val path
         & cell
         & retVal =
          (
            GObjectObjectClass.C.withPtr
             &&&> GtkTreePathRecord.C.withRefOptPtr
             &&&> GObjectObjectClass.C.withRefOptPtr
             ---> GtkTreePathRecord.C.fromPtr true
                   && GtkCellRendererClass.C.fromPtr true
                   && FFI.Bool.C.fromVal
          )
            getCursor_
            (
              self
               & NONE
               & NONE
            )
      in
        if retVal then SOME (path, cell) else NONE
      end
    fun getDestItemAtPos self dragX dragY =
      let
        val path
         & pos
         & retVal =
          (
            GObjectObjectClass.C.withPtr
             &&&> FFI.Int32.C.withVal
             &&&> FFI.Int32.C.withVal
             &&&> GtkTreePathRecord.C.withRefOptPtr
             &&&> GtkIconViewDropPosition.C.withRefVal
             ---> GtkTreePathRecord.C.fromPtr true
                   && GtkIconViewDropPosition.C.fromVal
                   && FFI.Bool.C.fromVal
          )
            getDestItemAtPos_
            (
              self
               & dragX
               & dragY
               & NONE
               & GtkIconViewDropPosition.null
            )
      in
        if retVal then SOME (path, pos) else NONE
      end
    fun getDragDestItem self =
      let
        val path
         & pos
         & () =
          (
            GObjectObjectClass.C.withPtr
             &&&> GtkTreePathRecord.C.withRefOptPtr
             &&&> GtkIconViewDropPosition.C.withRefVal
             ---> GtkTreePathRecord.C.fromPtr true
                   && GtkIconViewDropPosition.C.fromVal
                   && I
          )
            getDragDestItem_
            (
              self
               & NONE
               & GtkIconViewDropPosition.null
            )
      in
        (path, pos)
      end
    fun getItemAtPos self x y =
      let
        val path
         & cell
         & retVal =
          (
            GObjectObjectClass.C.withPtr
             &&&> FFI.Int32.C.withVal
             &&&> FFI.Int32.C.withVal
             &&&> GtkTreePathRecord.C.withRefOptPtr
             &&&> GObjectObjectClass.C.withRefOptPtr
             ---> GtkTreePathRecord.C.fromPtr true
                   && GtkCellRendererClass.C.fromPtr true
                   && FFI.Bool.C.fromVal
          )
            getItemAtPos_
            (
              self
               & x
               & y
               & NONE
               & NONE
            )
      in
        if retVal then SOME (path, cell) else NONE
      end
    fun getItemColumn self path = (GObjectObjectClass.C.withPtr &&&> GtkTreePathRecord.C.withPtr ---> FFI.Int32.C.fromVal) getItemColumn_ (self & path)
    fun getItemOrientation self = (GObjectObjectClass.C.withPtr ---> GtkOrientation.C.fromVal) getItemOrientation_ self
    fun getItemPadding self = (GObjectObjectClass.C.withPtr ---> FFI.Int32.C.fromVal) getItemPadding_ self
    fun getItemRow self path = (GObjectObjectClass.C.withPtr &&&> GtkTreePathRecord.C.withPtr ---> FFI.Int32.C.fromVal) getItemRow_ (self & path)
    fun getItemWidth self = (GObjectObjectClass.C.withPtr ---> FFI.Int32.C.fromVal) getItemWidth_ self
    fun getMargin self = (GObjectObjectClass.C.withPtr ---> FFI.Int32.C.fromVal) getMargin_ self
    fun getMarkupColumn self = (GObjectObjectClass.C.withPtr ---> FFI.Int32.C.fromVal) getMarkupColumn_ self
    fun getModel self = (GObjectObjectClass.C.withPtr ---> GtkTreeModelClass.C.fromPtr false) getModel_ self
    fun getPathAtPos self x y =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Int32.C.withVal
         ---> GtkTreePathRecord.C.fromPtr true
      )
        getPathAtPos_
        (
          self
           & x
           & y
        )
    fun getPixbufColumn self = (GObjectObjectClass.C.withPtr ---> FFI.Int32.C.fromVal) getPixbufColumn_ self
    fun getReorderable self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getReorderable_ self
    fun getRowSpacing self = (GObjectObjectClass.C.withPtr ---> FFI.Int32.C.fromVal) getRowSpacing_ self
    fun getSelectionMode self = (GObjectObjectClass.C.withPtr ---> GtkSelectionMode.C.fromVal) getSelectionMode_ self
    fun getSpacing self = (GObjectObjectClass.C.withPtr ---> FFI.Int32.C.fromVal) getSpacing_ self
    fun getTextColumn self = (GObjectObjectClass.C.withPtr ---> FFI.Int32.C.fromVal) getTextColumn_ self
    fun getTooltipColumn self = (GObjectObjectClass.C.withPtr ---> FFI.Int32.C.fromVal) getTooltipColumn_ self
    fun getTooltipContext self x y keyboardTip =
      let
        val x
         & y
         & model
         & path
         & iter
         & retVal =
          (
            GObjectObjectClass.C.withPtr
             &&&> FFI.Int32.C.withRefVal
             &&&> FFI.Int32.C.withRefVal
             &&&> FFI.Bool.C.withVal
             &&&> GObjectObjectClass.C.withRefOptPtr
             &&&> GtkTreePathRecord.C.withRefOptPtr
             &&&> GtkTreeIterRecord.C.withNewPtr
             ---> FFI.Int32.C.fromVal
                   && FFI.Int32.C.fromVal
                   && GtkTreeModelClass.C.fromPtr true
                   && GtkTreePathRecord.C.fromPtr true
                   && GtkTreeIterRecord.C.fromPtr true
                   && FFI.Bool.C.fromVal
          )
            getTooltipContext_
            (
              self
               & x
               & y
               & keyboardTip
               & NONE
               & NONE
               & ()
            )
      in
        (
          if retVal
          then
            SOME
              (
                model,
                path,
                iter
              )
          else NONE,
          x,
          y
        )
      end
    fun getVisibleRange self =
      let
        val startPath
         & endPath
         & retVal =
          (
            GObjectObjectClass.C.withPtr
             &&&> GtkTreePathRecord.C.withRefOptPtr
             &&&> GtkTreePathRecord.C.withRefOptPtr
             ---> GtkTreePathRecord.C.fromPtr true
                   && GtkTreePathRecord.C.fromPtr true
                   && FFI.Bool.C.fromVal
          )
            getVisibleRange_
            (
              self
               & NONE
               & NONE
            )
      in
        if retVal then SOME (startPath, endPath) else NONE
      end
    fun itemActivated self path = (GObjectObjectClass.C.withPtr &&&> GtkTreePathRecord.C.withPtr ---> I) itemActivated_ (self & path)
    fun pathIsSelected self path = (GObjectObjectClass.C.withPtr &&&> GtkTreePathRecord.C.withPtr ---> FFI.Bool.C.fromVal) pathIsSelected_ (self & path)
    fun scrollToPath self path useAlign rowAlign colAlign =
      (
        GObjectObjectClass.C.withPtr
         &&&> GtkTreePathRecord.C.withPtr
         &&&> FFI.Bool.C.withVal
         &&&> FFI.Float.C.withVal
         &&&> FFI.Float.C.withVal
         ---> I
      )
        scrollToPath_
        (
          self
           & path
           & useAlign
           & rowAlign
           & colAlign
        )
    fun selectAll self = (GObjectObjectClass.C.withPtr ---> I) selectAll_ self
    fun selectPath self path = (GObjectObjectClass.C.withPtr &&&> GtkTreePathRecord.C.withPtr ---> I) selectPath_ (self & path)
    fun setColumnSpacing self columnSpacing = (GObjectObjectClass.C.withPtr &&&> FFI.Int32.C.withVal ---> I) setColumnSpacing_ (self & columnSpacing)
    fun setColumns self columns = (GObjectObjectClass.C.withPtr &&&> FFI.Int32.C.withVal ---> I) setColumns_ (self & columns)
    fun setCursor self path cell startEditing =
      (
        GObjectObjectClass.C.withPtr
         &&&> GtkTreePathRecord.C.withPtr
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> FFI.Bool.C.withVal
         ---> I
      )
        setCursor_
        (
          self
           & path
           & cell
           & startEditing
        )
    fun setDragDestItem self path pos =
      (
        GObjectObjectClass.C.withPtr
         &&&> GtkTreePathRecord.C.withOptPtr
         &&&> GtkIconViewDropPosition.C.withVal
         ---> I
      )
        setDragDestItem_
        (
          self
           & path
           & pos
        )
    fun setItemOrientation self orientation = (GObjectObjectClass.C.withPtr &&&> GtkOrientation.C.withVal ---> I) setItemOrientation_ (self & orientation)
    fun setItemPadding self itemPadding = (GObjectObjectClass.C.withPtr &&&> FFI.Int32.C.withVal ---> I) setItemPadding_ (self & itemPadding)
    fun setItemWidth self itemWidth = (GObjectObjectClass.C.withPtr &&&> FFI.Int32.C.withVal ---> I) setItemWidth_ (self & itemWidth)
    fun setMargin self margin = (GObjectObjectClass.C.withPtr &&&> FFI.Int32.C.withVal ---> I) setMargin_ (self & margin)
    fun setMarkupColumn self column = (GObjectObjectClass.C.withPtr &&&> FFI.Int32.C.withVal ---> I) setMarkupColumn_ (self & column)
    fun setModel self model = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withOptPtr ---> I) setModel_ (self & model)
    fun setPixbufColumn self column = (GObjectObjectClass.C.withPtr &&&> FFI.Int32.C.withVal ---> I) setPixbufColumn_ (self & column)
    fun setReorderable self reorderable = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setReorderable_ (self & reorderable)
    fun setRowSpacing self rowSpacing = (GObjectObjectClass.C.withPtr &&&> FFI.Int32.C.withVal ---> I) setRowSpacing_ (self & rowSpacing)
    fun setSelectionMode self mode = (GObjectObjectClass.C.withPtr &&&> GtkSelectionMode.C.withVal ---> I) setSelectionMode_ (self & mode)
    fun setSpacing self spacing = (GObjectObjectClass.C.withPtr &&&> FFI.Int32.C.withVal ---> I) setSpacing_ (self & spacing)
    fun setTextColumn self column = (GObjectObjectClass.C.withPtr &&&> FFI.Int32.C.withVal ---> I) setTextColumn_ (self & column)
    fun setTooltipCell self tooltip path cell =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> GtkTreePathRecord.C.withPtr
         &&&> GObjectObjectClass.C.withOptPtr
         ---> I
      )
        setTooltipCell_
        (
          self
           & tooltip
           & path
           & cell
        )
    fun setTooltipColumn self column = (GObjectObjectClass.C.withPtr &&&> FFI.Int32.C.withVal ---> I) setTooltipColumn_ (self & column)
    fun setTooltipItem self tooltip path =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> GtkTreePathRecord.C.withPtr
         ---> I
      )
        setTooltipItem_
        (
          self
           & tooltip
           & path
        )
    fun unselectAll self = (GObjectObjectClass.C.withPtr ---> I) unselectAll_ self
    fun unselectPath self path = (GObjectObjectClass.C.withPtr &&&> GtkTreePathRecord.C.withPtr ---> I) unselectPath_ (self & path)
    fun unsetModelDragDest self = (GObjectObjectClass.C.withPtr ---> I) unsetModelDragDest_ self
    fun unsetModelDragSource self = (GObjectObjectClass.C.withPtr ---> I) unsetModelDragSource_ self
    local
      open ClosureMarshal Signal
    in
      fun activateCursorItemSig f = signal "activate-cursor-item" (void ---> ret boolean) f
      fun itemActivatedSig f = signal "item-activated" (get 0w1 GtkTreePathRecord.t ---> ret_void) f
      fun moveCursorSig f = signal "move-cursor" (get 0w1 GtkMovementStep.t &&&> get 0w2 int ---> ret boolean) (fn step & count => f step count)
      fun selectAllSig f = signal "select-all" (void ---> ret_void) f
      fun selectCursorItemSig f = signal "select-cursor-item" (void ---> ret_void) f
      fun selectionChangedSig f = signal "selection-changed" (void ---> ret_void) f
      fun toggleCursorItemSig f = signal "toggle-cursor-item" (void ---> ret_void) f
      fun unselectAllSig f = signal "unselect-all" (void ---> ret_void) f
    end
    local
      open Property
    in
      val cellAreaProp =
        {
          get = fn x => get "cell-area" GtkCellAreaClass.tOpt x,
          set = fn x => set "cell-area" GtkCellAreaClass.tOpt x
        }
      val columnSpacingProp =
        {
          get = fn x => get "column-spacing" int x,
          set = fn x => set "column-spacing" int x
        }
      val columnsProp =
        {
          get = fn x => get "columns" int x,
          set = fn x => set "columns" int x
        }
      val itemOrientationProp =
        {
          get = fn x => get "item-orientation" GtkOrientation.t x,
          set = fn x => set "item-orientation" GtkOrientation.t x
        }
      val itemPaddingProp =
        {
          get = fn x => get "item-padding" int x,
          set = fn x => set "item-padding" int x
        }
      val itemWidthProp =
        {
          get = fn x => get "item-width" int x,
          set = fn x => set "item-width" int x
        }
      val marginProp =
        {
          get = fn x => get "margin" int x,
          set = fn x => set "margin" int x
        }
      val markupColumnProp =
        {
          get = fn x => get "markup-column" int x,
          set = fn x => set "markup-column" int x
        }
      val modelProp =
        {
          get = fn x => get "model" GtkTreeModelClass.tOpt x,
          set = fn x => set "model" GtkTreeModelClass.tOpt x
        }
      val pixbufColumnProp =
        {
          get = fn x => get "pixbuf-column" int x,
          set = fn x => set "pixbuf-column" int x
        }
      val reorderableProp =
        {
          get = fn x => get "reorderable" boolean x,
          set = fn x => set "reorderable" boolean x
        }
      val rowSpacingProp =
        {
          get = fn x => get "row-spacing" int x,
          set = fn x => set "row-spacing" int x
        }
      val selectionModeProp =
        {
          get = fn x => get "selection-mode" GtkSelectionMode.t x,
          set = fn x => set "selection-mode" GtkSelectionMode.t x
        }
      val spacingProp =
        {
          get = fn x => get "spacing" int x,
          set = fn x => set "spacing" int x
        }
      val textColumnProp =
        {
          get = fn x => get "text-column" int x,
          set = fn x => set "text-column" int x
        }
      val tooltipColumnProp =
        {
          get = fn x => get "tooltip-column" int x,
          set = fn x => set "tooltip-column" int x
        }
    end
  end
