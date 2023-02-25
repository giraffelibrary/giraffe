(* Copyright (C) 2013, 2016-2018, 2020-2021, 2023 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

signature G_OBJECT_PARAM_SPEC_CLASS =
  sig
    include CLASS
    type type_t
    val t : base class ValueAccessor.t
    val tOpt : base class option ValueAccessor.t
    val toDerived : 'a class ValueAccessor.t -> base class -> 'a class
    val instanceType : 'a class -> type_t
  end
