structure GioMenu :>
  GIO_MENU
    where type 'a class = 'a GioMenuClass.class
    where type 'a menu_item_class = 'a GioMenuItemClass.class
    where type 'a menu_model_class = 'a GioMenuModelClass.class =
  struct
    val getType_ = _import "g_menu_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "g_menu_new" : unit -> GioMenuClass.FFI.notnull GioMenuClass.FFI.p;
    val append_ =
      fn
        x1
         & (x2, x3)
         & (x4, x5) =>
          (
            _import "mlton_g_menu_append" :
              GioMenuClass.FFI.notnull GioMenuClass.FFI.p
               * Utf8.MLton.p1
               * unit Utf8.MLton.p2
               * Utf8.MLton.p1
               * unit Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val appendItem_ = fn x1 & x2 => (_import "g_menu_append_item" : GioMenuClass.FFI.notnull GioMenuClass.FFI.p * GioMenuItemClass.FFI.notnull GioMenuItemClass.FFI.p -> unit;) (x1, x2)
    val appendSection_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_g_menu_append_section" :
              GioMenuClass.FFI.notnull GioMenuClass.FFI.p
               * Utf8.MLton.p1
               * unit Utf8.MLton.p2
               * GioMenuModelClass.FFI.notnull GioMenuModelClass.FFI.p
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val appendSubmenu_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_g_menu_append_submenu" :
              GioMenuClass.FFI.notnull GioMenuClass.FFI.p
               * Utf8.MLton.p1
               * unit Utf8.MLton.p2
               * GioMenuModelClass.FFI.notnull GioMenuModelClass.FFI.p
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val freeze_ = _import "g_menu_freeze" : GioMenuClass.FFI.notnull GioMenuClass.FFI.p -> unit;
    val insert_ =
      fn
        x1
         & x2
         & (x3, x4)
         & (x5, x6) =>
          (
            _import "mlton_g_menu_insert" :
              GioMenuClass.FFI.notnull GioMenuClass.FFI.p
               * GInt32.FFI.val_
               * Utf8.MLton.p1
               * unit Utf8.MLton.p2
               * Utf8.MLton.p1
               * unit Utf8.MLton.p2
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
    val insertItem_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_menu_insert_item" :
              GioMenuClass.FFI.notnull GioMenuClass.FFI.p
               * GInt32.FFI.val_
               * GioMenuItemClass.FFI.notnull GioMenuItemClass.FFI.p
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val insertSection_ =
      fn
        x1
         & x2
         & (x3, x4)
         & x5 =>
          (
            _import "mlton_g_menu_insert_section" :
              GioMenuClass.FFI.notnull GioMenuClass.FFI.p
               * GInt32.FFI.val_
               * Utf8.MLton.p1
               * unit Utf8.MLton.p2
               * GioMenuModelClass.FFI.notnull GioMenuModelClass.FFI.p
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val insertSubmenu_ =
      fn
        x1
         & x2
         & (x3, x4)
         & x5 =>
          (
            _import "mlton_g_menu_insert_submenu" :
              GioMenuClass.FFI.notnull GioMenuClass.FFI.p
               * GInt32.FFI.val_
               * Utf8.MLton.p1
               * unit Utf8.MLton.p2
               * GioMenuModelClass.FFI.notnull GioMenuModelClass.FFI.p
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val prepend_ =
      fn
        x1
         & (x2, x3)
         & (x4, x5) =>
          (
            _import "mlton_g_menu_prepend" :
              GioMenuClass.FFI.notnull GioMenuClass.FFI.p
               * Utf8.MLton.p1
               * unit Utf8.MLton.p2
               * Utf8.MLton.p1
               * unit Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val prependItem_ = fn x1 & x2 => (_import "g_menu_prepend_item" : GioMenuClass.FFI.notnull GioMenuClass.FFI.p * GioMenuItemClass.FFI.notnull GioMenuItemClass.FFI.p -> unit;) (x1, x2)
    val prependSection_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_g_menu_prepend_section" :
              GioMenuClass.FFI.notnull GioMenuClass.FFI.p
               * Utf8.MLton.p1
               * unit Utf8.MLton.p2
               * GioMenuModelClass.FFI.notnull GioMenuModelClass.FFI.p
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val prependSubmenu_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_g_menu_prepend_submenu" :
              GioMenuClass.FFI.notnull GioMenuClass.FFI.p
               * Utf8.MLton.p1
               * unit Utf8.MLton.p2
               * GioMenuModelClass.FFI.notnull GioMenuModelClass.FFI.p
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val remove_ = fn x1 & x2 => (_import "g_menu_remove" : GioMenuClass.FFI.notnull GioMenuClass.FFI.p * GInt32.FFI.val_ -> unit;) (x1, x2)
    val removeAll_ = _import "g_menu_remove_all" : GioMenuClass.FFI.notnull GioMenuClass.FFI.p -> unit;
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
