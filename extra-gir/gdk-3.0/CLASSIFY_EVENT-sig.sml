(* Copyright (C) 2012, 2017 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

signature CLASSIFY_EVENT =
  sig
    type 'a event_union

    type event_any_t
    type event_key_t
    type event_button_t
    type event_touch_t
    type event_scroll_t
    type event_motion_t
    type event_expose_t
    type event_visibility_t
    type event_crossing_t
    type event_focus_t
    type event_configure_t
    type event_property_t
    type event_selection_t
    type event_dnd_t
    type event_proximity_t
    type event_window_state_t
    type event_setting_t
    type event_owner_change_t
    type event_grab_broken_t
    type event_touchpad_swipe_t
    type event_touchpad_pinch_t
    type event_pad_button_t
    type event_pad_axis_t
    type event_pad_group_mode_t

    type event_any_record_event
    type event_key_record_event
    type event_button_record_event
    type event_touch_record_event
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
    type event_touchpad_swipe_record_event
    type event_touchpad_pinch_record_event
    type event_pad_button_record_event
    type event_pad_axis_record_event
    type event_pad_group_mode_record_event

    datatype t =
      ANY            of event_any_t            * event_any_record_event
    | KEY            of event_key_t            * event_key_record_event
    | BUTTON         of event_button_t         * event_button_record_event
    | TOUCH          of event_touch_t          * event_touch_record_event
    | SCROLL         of event_scroll_t         * event_scroll_record_event
    | MOTION         of event_motion_t         * event_motion_record_event
    | EXPOSE         of event_expose_t         * event_expose_record_event
    | VISIBILITY     of event_visibility_t     * event_visibility_record_event
    | CROSSING       of event_crossing_t       * event_crossing_record_event
    | FOCUS          of event_focus_t          * event_focus_record_event
    | CONFIGURE      of event_configure_t      * event_configure_record_event
    | PROPERTY       of event_property_t       * event_property_record_event
    | SELECTION      of event_selection_t      * event_selection_record_event
    | DND            of event_dnd_t            * event_dnd_record_event
    | PROXIMITY      of event_proximity_t      * event_proximity_record_event
    | WINDOW_STATE   of event_window_state_t   * event_window_state_record_event
    | SETTING        of event_setting_t        * event_setting_record_event
    | OWNER_CHANGE   of event_owner_change_t   * event_owner_change_record_event
    | GRAB_BROKEN    of event_grab_broken_t    * event_grab_broken_record_event
    | TOUCHPAD_SWIPE of event_touchpad_swipe_t * event_touchpad_swipe_record_event
    | TOUCHPAD_PINCH of event_touchpad_pinch_t * event_touchpad_pinch_record_event
    | PAD_BUTTON     of event_pad_button_t     * event_pad_button_record_event
    | PAD_AXIS       of event_pad_axis_t       * event_pad_axis_record_event
    | PAD_GROUP_MODE of event_pad_group_mode_t * event_pad_group_mode_record_event

    val classify : 'a event_union -> t option
  end
