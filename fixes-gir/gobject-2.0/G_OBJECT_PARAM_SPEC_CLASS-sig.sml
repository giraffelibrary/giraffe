(* Copyright (C) 2013, 2016-2018, 2020-2021, 2023 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

signature G_OBJECT_PARAM_SPEC_CLASS =
  sig
    include CLASS
      where type 'a value_accessor_t = 'a ValueAccessor.t
    type type_t
    val t : t ValueAccessor.t
    val tOpt : t option ValueAccessor.t
    val instanceType : 'a class -> type_t
  end
