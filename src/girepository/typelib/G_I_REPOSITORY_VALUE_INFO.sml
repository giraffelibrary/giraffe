signature G_I_REPOSITORY_VALUE_INFO =
  sig
    type 'a class

    (*
     * The value returned by g_value_info_get_value is representable as
     * a 32-bit signed or unsigned value.  The C function returns a gint64
     * to allow a value from the range of either a 32-bit signed or
     * unsigned values.
     *
     * For values in the range of both 32-bit signed and unsigned values,
     * it is not possible to determine the range of the source value: the
     * caller must know.  If the source range is known, there is no need to
     * know the most significant 32 bits of the result.
     *
     * To avoid 64 bit issues, two interfaces to g_value_info_get_value are
     * provided returning 32 bit signed and unsigned values.
     *)
    val getValueInt : 'a class -> LargeInt.int
    val getValueWord : 'a class -> LargeInt.int
  end
