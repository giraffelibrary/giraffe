(**
 * The functor Callback constructs an instance of a callback table given the
 * type for callback values.
 *
 * Note that the type `id` is abstract in the structure returned by this
 * functor due to opaque signature matching.  This ensures that `id` values
 * from one callback table instance cannot be used with another callback
 * table instance.
 *)
functor Callback (type callback) :>
  CALLBACK
    where type callback = callback =
  struct
    type callback = callback

    open CallbackTable

    val table : callback t = new ()

    val add = insert table
    val remove = ignore o delete table
    val lookup = lookup table
  end
