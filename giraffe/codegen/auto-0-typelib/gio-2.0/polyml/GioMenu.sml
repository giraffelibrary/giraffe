structure GioMenu :>
  GIO_MENU
    where type 'a class = 'a GioMenuClass.class
    where type 'a menu_item_class = 'a GioMenuItemClass.class
    where type 'a menu_model_class = 'a GioMenuModelClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_menu_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "g_menu_new") (cVoid --> GioMenuClass.PolyML.cPtr)
      val append_ =
        call (getSymbol "g_menu_append")
          (
            GioMenuClass.PolyML.cPtr
             &&> Utf8.PolyML.cInOptPtr
             &&> Utf8.PolyML.cInOptPtr
             --> cVoid
          )
      val appendItem_ = call (getSymbol "g_menu_append_item") (GioMenuClass.PolyML.cPtr &&> GioMenuItemClass.PolyML.cPtr --> cVoid)
      val appendSection_ =
        call (getSymbol "g_menu_append_section")
          (
            GioMenuClass.PolyML.cPtr
             &&> Utf8.PolyML.cInOptPtr
             &&> GioMenuModelClass.PolyML.cPtr
             --> cVoid
          )
      val appendSubmenu_ =
        call (getSymbol "g_menu_append_submenu")
          (
            GioMenuClass.PolyML.cPtr
             &&> Utf8.PolyML.cInOptPtr
             &&> GioMenuModelClass.PolyML.cPtr
             --> cVoid
          )
      val freeze_ = call (getSymbol "g_menu_freeze") (GioMenuClass.PolyML.cPtr --> cVoid)
      val insert_ =
        call (getSymbol "g_menu_insert")
          (
            GioMenuClass.PolyML.cPtr
             &&> GInt32.PolyML.cVal
             &&> Utf8.PolyML.cInOptPtr
             &&> Utf8.PolyML.cInOptPtr
             --> cVoid
          )
      val insertItem_ =
        call (getSymbol "g_menu_insert_item")
          (
            GioMenuClass.PolyML.cPtr
             &&> GInt32.PolyML.cVal
             &&> GioMenuItemClass.PolyML.cPtr
             --> cVoid
          )
      val insertSection_ =
        call (getSymbol "g_menu_insert_section")
          (
            GioMenuClass.PolyML.cPtr
             &&> GInt32.PolyML.cVal
             &&> Utf8.PolyML.cInOptPtr
             &&> GioMenuModelClass.PolyML.cPtr
             --> cVoid
          )
      val insertSubmenu_ =
        call (getSymbol "g_menu_insert_submenu")
          (
            GioMenuClass.PolyML.cPtr
             &&> GInt32.PolyML.cVal
             &&> Utf8.PolyML.cInOptPtr
             &&> GioMenuModelClass.PolyML.cPtr
             --> cVoid
          )
      val prepend_ =
        call (getSymbol "g_menu_prepend")
          (
            GioMenuClass.PolyML.cPtr
             &&> Utf8.PolyML.cInOptPtr
             &&> Utf8.PolyML.cInOptPtr
             --> cVoid
          )
      val prependItem_ = call (getSymbol "g_menu_prepend_item") (GioMenuClass.PolyML.cPtr &&> GioMenuItemClass.PolyML.cPtr --> cVoid)
      val prependSection_ =
        call (getSymbol "g_menu_prepend_section")
          (
            GioMenuClass.PolyML.cPtr
             &&> Utf8.PolyML.cInOptPtr
             &&> GioMenuModelClass.PolyML.cPtr
             --> cVoid
          )
      val prependSubmenu_ =
        call (getSymbol "g_menu_prepend_submenu")
          (
            GioMenuClass.PolyML.cPtr
             &&> Utf8.PolyML.cInOptPtr
             &&> GioMenuModelClass.PolyML.cPtr
             --> cVoid
          )
      val remove_ = call (getSymbol "g_menu_remove") (GioMenuClass.PolyML.cPtr &&> GInt32.PolyML.cVal --> cVoid)
      val removeAll_ = call (getSymbol "g_menu_remove_all") (GioMenuClass.PolyML.cPtr --> cVoid)
    end
    type 'a class = 'a GioMenuClass.class
    type 'a menu_item_class = 'a GioMenuItemClass.class
    type 'a menu_model_class = 'a GioMenuModelClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GioMenuClass.FFI.fromPtr true) new_ ()
    fun append self (label, detailedAction) =
      (
        GioMenuClass.FFI.withPtr
         &&&> Utf8.FFI.withOptPtr
         &&&> Utf8.FFI.withOptPtr
         ---> I
      )
        append_
        (
          self
           & label
           & detailedAction
        )
    fun appendItem self item = (GioMenuClass.FFI.withPtr &&&> GioMenuItemClass.FFI.withPtr ---> I) appendItem_ (self & item)
    fun appendSection self (label, section) =
      (
        GioMenuClass.FFI.withPtr
         &&&> Utf8.FFI.withOptPtr
         &&&> GioMenuModelClass.FFI.withPtr
         ---> I
      )
        appendSection_
        (
          self
           & label
           & section
        )
    fun appendSubmenu self (label, submenu) =
      (
        GioMenuClass.FFI.withPtr
         &&&> Utf8.FFI.withOptPtr
         &&&> GioMenuModelClass.FFI.withPtr
         ---> I
      )
        appendSubmenu_
        (
          self
           & label
           & submenu
        )
    fun freeze self = (GioMenuClass.FFI.withPtr ---> I) freeze_ self
    fun insert
      self
      (
        position,
        label,
        detailedAction
      ) =
      (
        GioMenuClass.FFI.withPtr
         &&&> GInt32.FFI.withVal
         &&&> Utf8.FFI.withOptPtr
         &&&> Utf8.FFI.withOptPtr
         ---> I
      )
        insert_
        (
          self
           & position
           & label
           & detailedAction
        )
    fun insertItem self (position, item) =
      (
        GioMenuClass.FFI.withPtr
         &&&> GInt32.FFI.withVal
         &&&> GioMenuItemClass.FFI.withPtr
         ---> I
      )
        insertItem_
        (
          self
           & position
           & item
        )
    fun insertSection
      self
      (
        position,
        label,
        section
      ) =
      (
        GioMenuClass.FFI.withPtr
         &&&> GInt32.FFI.withVal
         &&&> Utf8.FFI.withOptPtr
         &&&> GioMenuModelClass.FFI.withPtr
         ---> I
      )
        insertSection_
        (
          self
           & position
           & label
           & section
        )
    fun insertSubmenu
      self
      (
        position,
        label,
        submenu
      ) =
      (
        GioMenuClass.FFI.withPtr
         &&&> GInt32.FFI.withVal
         &&&> Utf8.FFI.withOptPtr
         &&&> GioMenuModelClass.FFI.withPtr
         ---> I
      )
        insertSubmenu_
        (
          self
           & position
           & label
           & submenu
        )
    fun prepend self (label, detailedAction) =
      (
        GioMenuClass.FFI.withPtr
         &&&> Utf8.FFI.withOptPtr
         &&&> Utf8.FFI.withOptPtr
         ---> I
      )
        prepend_
        (
          self
           & label
           & detailedAction
        )
    fun prependItem self item = (GioMenuClass.FFI.withPtr &&&> GioMenuItemClass.FFI.withPtr ---> I) prependItem_ (self & item)
    fun prependSection self (label, section) =
      (
        GioMenuClass.FFI.withPtr
         &&&> Utf8.FFI.withOptPtr
         &&&> GioMenuModelClass.FFI.withPtr
         ---> I
      )
        prependSection_
        (
          self
           & label
           & section
        )
    fun prependSubmenu self (label, submenu) =
      (
        GioMenuClass.FFI.withPtr
         &&&> Utf8.FFI.withOptPtr
         &&&> GioMenuModelClass.FFI.withPtr
         ---> I
      )
        prependSubmenu_
        (
          self
           & label
           & submenu
        )
    fun remove self position = (GioMenuClass.FFI.withPtr &&&> GInt32.FFI.withVal ---> I) remove_ (self & position)
    fun removeAll self = (GioMenuClass.FFI.withPtr ---> I) removeAll_ self
  end
