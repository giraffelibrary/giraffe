structure GtkImageCellAccessible :>
  GTK_IMAGE_CELL_ACCESSIBLE
    where type 'a class = 'a GtkImageCellAccessibleClass.class =
  struct
    val getType_ = _import "gtk_image_cell_accessible_get_type" : unit -> GObjectType.FFI.val_;
    type 'a class = 'a GtkImageCellAccessibleClass.class
    type t = base class
    fun asAction self = (GObjectObjectClass.FFI.withPtr false ---> AtkActionClass.FFI.fromPtr false) I self
    fun asComponent self = (GObjectObjectClass.FFI.withPtr false ---> AtkComponentClass.FFI.fromPtr false) I self
    fun asImage self = (GObjectObjectClass.FFI.withPtr false ---> AtkImageClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
