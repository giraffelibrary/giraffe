structure GtkImageAccessible :>
  GTK_IMAGE_ACCESSIBLE
    where type 'a class = 'a GtkImageAccessibleClass.class =
  struct
    val getType_ = _import "gtk_image_accessible_get_type" : unit -> GObjectType.FFI.val_;
    type 'a class = 'a GtkImageAccessibleClass.class
    type t = base class
    fun asComponent self = (GObjectObjectClass.FFI.withPtr ---> AtkComponentClass.FFI.fromPtr false) I self
    fun asImage self = (GObjectObjectClass.FFI.withPtr ---> AtkImageClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
