(* Copyright (C) 2012 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

signature CLASSIFY_EVENT =
  sig
    type 'a event_t

    type event_any_record_t
    type event_key_record_t
    type event_button_record_t
    type event_scroll_record_t
    type event_motion_record_t
    type event_expose_record_t
    type event_visibility_record_t
    type event_crossing_record_t
    type event_focus_record_t
    type event_configure_record_t
    type event_property_record_t
    type event_selection_record_t
    type event_dnd_record_t
    type event_proximity_record_t
    type event_window_state_record_t
    type event_setting_record_t
    type event_owner_change_record_t
    type event_grab_broken_record_t

    type event_any_record_event
    type event_key_record_event
    type event_button_record_event
    type event_scroll_record_event
    type event_motion_record_event
    type event_expose_record_event
    type event_visibility_record_event
    type event_crossing_record_event
    type event_focus_record_event
    type event_configure_record_event
    type event_property_record_event
    type event_selection_record_event
    type event_dnd_record_event
    type event_proximity_record_event
    type event_window_state_record_event
    type event_setting_record_event
    type event_owner_change_record_event
    type event_grab_broken_record_event

    datatype t =
      ANY         of event_any_record_t         * event_any_record_event
    | KEY         of event_key_record_t         * event_key_record_event
    | BUTTON      of event_button_record_t      * event_button_record_event
    | SCROLL      of event_scroll_record_t      * event_scroll_record_event
    | MOTION      of event_motion_record_t      * event_motion_record_event
    | EXPOSE      of event_expose_record_t      * event_expose_record_event
    | VISIBILITY  of event_visibility_record_t  * event_visibility_record_event
    | CROSSING    of event_crossing_record_t    * event_crossing_record_event
    | FOCUS       of event_focus_record_t       * event_focus_record_event
    | CONFIGURE   of event_configure_record_t   * event_configure_record_event
    | PROPERTY    of event_property_record_t    * event_property_record_event
    | SELECTION   of event_selection_record_t   * event_selection_record_event
    | DND         of event_dnd_record_t         * event_dnd_record_event
    | PROXIMITY   of event_proximity_record_t   * event_proximity_record_event
    | WINDOW_STATE of event_window_state_record_t * event_window_state_record_event
    | SETTING     of event_setting_record_t     * event_setting_record_event
    | OWNER_CHANGE of event_owner_change_record_t * event_owner_change_record_event
    | GRAB_BROKEN  of event_grab_broken_record_t  * event_grab_broken_record_event

    val classify : 'a event_t -> t option
  end
