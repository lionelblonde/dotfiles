// copied from users/manna-harbour_miryoku/manna-harbour_miryoku.h
// generated from users/manna-harbour_miryoku/miryoku.org  -*- buffer-read-only: t -*-

#include QMK_KEYBOARD_H

#define KC_NP KC_NO // key is not present
#define KC_NA KC_NO // present but not available for use
#define KC_NU KC_NO // available but not used

// the layers are:
// + BASE (alpha keys and standard punctuation)
// + MOUSE: mouse keys (clicks, motions, scrolls)
// + NAV: navigation keys (arrows, etc.)
// + FUNC: function keys (in macOS: equivalent to the media keys)
// + NUM: numbers and number operations
// + SYM: symbols (that were not on NUM)
// + EDIT: util operations
//
enum layers {
    BASE,
    MOUSE, NAV, FUNC,
    NUM, SYM, EDIT
};

const uint16_t PROGMEM keymaps[][MATRIX_ROWS][MATRIX_COLS] = {

    // BASE layer
    //
    //      q w e r t          y u i o p
    //      a s d f g          h j k l ;            <- with miryoku home row mods (LEFT mods)
    //      z x c v b          n m , . '
    //       TAB SPC ESC   ENT BSPC DEL
    //
    // and WHEN SHIFTED
    //
    //      Q W E R T          Y U I O P
    //      A S D F G          H J K L :
    //      Z X C V B          N M < > "
    //
    // LAYER SWITCH: hold down the thumb key associated with the desired layer to switch to it
    //
    [BASE] = LAYOUT_split_3x5_3(
        KC_Q,         KC_W,         KC_E,              KC_R,            KC_T,                     KC_Y,            KC_U,             KC_I,             KC_O,           KC_P,
        LGUI_T(KC_A), LALT_T(KC_S), LCTL_T(KC_D),      LSFT_T(KC_F),    KC_G,                     KC_H,            LSFT_T(KC_J),     LCTL_T(KC_K),     LALT_T(KC_L),   LGUI_T(KC_SCLN),
        KC_Z,         ALGR_T(KC_X), KC_C,              KC_V,            KC_B,                     KC_N,            KC_M,             KC_COMM,          ALGR_T(KC_DOT), KC_QUOT,
                                    LT(MOUSE, KC_TAB), LT(NAV, KC_SPC), LT(FUNC, KC_ESC),         LT(NUM, KC_ENT), LT(SYM, KC_BSPC), LT(EDIT, KC_DEL)
    ),

    //
    // MOUSE layer
    //
    //      NOOP     NOOP      NOOP      NOOP       NOOP             NOOP       NOOP       NOOP     NOOP        NOOP
    //      LEFT_CMD LEFT_ALT  LEFT_CTRL LEFT_SHIFT NOOP             MOUSE_LEFT MOUSE_DOWN MOUSE_UP MOUSE_RIGHT NOOP
    //      NOOP     RIGHT_ALT NOOP      NOOP       NOOP             WHEEL_LEFT WHEEL_DOWN WHEEL_UP WHEEL_RIGHT NOOP
    //                                       NOOP NOOP NOOP       RIGHT_BUTTON LEFT_BUTTON MIDDLE_BUTTON
    //
    [MOUSE] = LAYOUT_split_3x5_3(
        KC_NA,   KC_NA,   KC_NA,   KC_NA,   KC_NA,         KC_NU,   KC_NU,   KC_NU,   KC_NU,   KC_NU,
        KC_LGUI, KC_LALT, KC_LCTL, KC_LSFT, KC_NA,         KC_MS_L, KC_MS_D, KC_MS_U, KC_MS_R, KC_NU,
        KC_NA,   KC_ALGR, KC_NA,   KC_NA,   KC_NA,         KC_WH_L, KC_WH_D, KC_WH_U, KC_WH_R, KC_NU,
                          KC_NA,   KC_NA,   KC_NA,         KC_BTN1, KC_BTN3, KC_BTN2
    ),

    //
    // NAV layer (navigation)
    //
    //      NOOP     NOOP      NOOP      NOOP       NOOP             NOOP NOOP      NOOP    NOOP  NOOP
    //      LEFT_CMD LEFT_ALT  LEFT_CTRL LEFT_SHIFT NOOP             LEFT DOWN      UP      RIGHT NOOP
    //      NOOP     RIGHT_ALT NOOP      NOOP       NOOP             HOME PAGE_DOWN PAGE_UP END   INSERT
    //                                       NOOP NOOP NOOP      NOOP NOOP NOOP
    //
    [NAV] = LAYOUT_split_3x5_3(
        KC_NA,   KC_NA,   KC_NA,   KC_NA,   KC_NA,            KC_NU,   KC_NU,   KC_NU,   KC_NU,   KC_NU,
        KC_LGUI, KC_LALT, KC_LCTL, KC_LSFT, KC_NA,            KC_LEFT, KC_DOWN, KC_UP,   KC_RGHT, KC_NU,
        KC_NA,   KC_ALGR, KC_NA,   KC_NA,   KC_NA,            KC_HOME, KC_PGDN, KC_PGUP, KC_END,  KC_INS,
                          KC_NA,   KC_NA,   KC_NA,            KC_NU,   KC_NU,   KC_NU
    ),

    //
    // FUNC layer (for function keys | on macOS: media keys)
    //
    //      NOOP     NOOP      NOOP      NOOP       NOOP             F1 F2 NOOP NOOP PRT_SCN
    //      LEFT_CMD LEFT_ALT  LEFT_CTRL LEFT_SHIFT NOOP             F4 F3 F7   F8   F9
    //      NOOP     RIGHT_ALT NOOP      NOOP       NOOP             F5 F6 NOOP NOOP NOOP
    //                                       NOOP NOOP NOOP       F10 F11 F12
    //
    //
    // Reminder: in macOS, the function keys work as follows:
    // F1: decrease display brightness
    // F2: increase display brightness
    // F3: - (leave it but do not map in Karabiner)
    // F4: - (leave it but do not map in Karabiner)
    // F5: decrease keyboard brightness (on compatible notebooks only)
    // F6: increase keyboard brightness (on compatible notebooks only)
    // F7: previous media
    // F8: play/pause
    // F9: next media
    // F10: mute
    // F11: volume down
    // F12: volume up
    //
    [FUNC] = LAYOUT_split_3x5_3(
        KC_NA,   KC_NA,   KC_NA,   KC_NA,   KC_NA,            KC_F1,  KC_F2,  KC_NU,  KC_NU, KC_PSCR,
        KC_LGUI, KC_LALT, KC_LCTL, KC_LSFT, KC_NA,            KC_F4,  KC_F3,  KC_F7,  KC_F8, KC_F9,
        KC_NA,   KC_ALGR, KC_NA,   KC_NA,   KC_NA,            KC_F5,  KC_F6,  KC_NU,  KC_NU, KC_NU,
                          KC_NA,   KC_NA,   KC_NA,            KC_F10, KC_F11, KC_F12
    ),

    //
    // NUM layer
    //
    //      7 5 3 1 9               NOOP NOOP       NOOP      NOOP      NOOP
    //      6 4 2 0 8               NOOP LEFT_SHIFT LEFT_CTRL LEFT_ALT  LEFT_CMD
    //      % * = + /               NOOP NOOP       NOOP      RIGHT_ALT NOOP
    //             - SPC .        NOOP NOOP NOOP
    //
    [NUM] = LAYOUT_split_3x5_3(
        KC_7,    KC_5,    KC_3,    KC_1,    KC_9,             KC_NA, KC_NA,   KC_NA,   KC_NA,   KC_NA,
        KC_6,    KC_4,    KC_2,    KC_0,    KC_8,             KC_NA, KC_LSFT, KC_LCTL, KC_LALT, KC_LGUI,
        KC_PERC, KC_ASTR, KC_EQL,  KC_PLUS, KC_SLSH,          KC_NA, KC_NA,   KC_NA,   KC_ALGR, KC_NA,
                          KC_MINS, KC_SPC, KC_PDOT,          KC_NA, KC_NA,   KC_NA
    ),

    //
    // SYM layer
    //
    //      @ [ ( { _               NOOP NOOP       NOOP      NOOP      NOOP
    //      ^ ] ) } $               NOOP LEFT_SHIFT LEFT_CTRL LEFT_ALT  LEFT_CMD
    //      | # & ` \               NOOP NOOP       NOOP      RIGHT_ALT NOOP
    //             ! ~ ?        NOOP NOOP NOOP
    //
    [SYM] = LAYOUT_split_3x5_3(
        KC_AT,   KC_LBRC, KC_LPRN, KC_LCBR, KC_UNDS,           KC_NA, KC_NA,   KC_NA,   KC_NA,   KC_NA,
        KC_CIRC, KC_RBRC, KC_RPRN, KC_RCBR, KC_DLR,          KC_NA, KC_LSFT, KC_LCTL, KC_LALT, KC_LGUI,
        KC_PIPE, KC_HASH, KC_AMPR, KC_GRV,  KC_BSLS,          KC_NA, KC_NA,   KC_NA,   KC_ALGR, KC_NA,
                          KC_EXLM, KC_TILD, KC_QUES,          KC_NA, KC_NA,   KC_NA
    ),

    //
    // EDIT layer
    //
    //      NOOP     NOOP NOOP NOOP NOOP                NOOP NOOP NOOP NOOP NOOP
    //      CAPSLOCK NOOP REDO UNDO NOOP                NOOP NOOP NOOP NOOP NOOP
    //      NOOP     NOOP NOOP NOOP NOOP                NOOP NOOP NOOP NOOP NOOP
    //                       CUT COPY PASTE       NOOP NOOP NOOP
    //
    [EDIT] = LAYOUT_split_3x5_3(
        KC_NU,   KC_NU, KC_NU,   KC_NU,   KC_NU,        KC_NA, KC_NA, KC_NA, KC_NA, KC_NA,
        KC_CAPS, KC_NU, KC_AGIN, KC_UNDO, KC_NU,        KC_NA, KC_NU, KC_NU, KC_NU, KC_NU,
        KC_NU,   KC_NU, KC_NU,   KC_NU,   KC_NU,        KC_NA, KC_NA, KC_NA, KC_NU, KC_NA,
                        KC_CUT,  KC_COPY, KC_PASTE,     KC_NA, KC_NA, KC_NA
    ),

};
