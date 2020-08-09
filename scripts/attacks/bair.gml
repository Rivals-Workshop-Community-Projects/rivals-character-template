
make_attack(AT_BAIR,
  AG_CATEGORY, 1,
  AG_SPRITE, sprite_get("bair"),
  AG_HAS_LANDING_LAG, 1,
  AG_LANDING_LAG, 4,
  AG_HURTBOX_SPRITE, sprite_get("bair_hurt"));

make_window(AT_BAIR, 1,
  AG_WINDOW_TYPE, 1,
  AG_WINDOW_LENGTH, 6,
  AG_WINDOW_ANIM_FRAMES, 3,
  AG_WINDOW_VSPEED, -1,
  AG_WINDOW_HAS_SFX, 1,
  AG_WINDOW_SFX, asset_get("sfx_swipe_medium2"),
  AG_WINDOW_SFX_FRAME, 5);

make_window(AT_BAIR, 2,
  AG_WINDOW_TYPE, 1,
  AG_WINDOW_LENGTH, 10,
  AG_WINDOW_ANIM_FRAMES, 1,
  AG_WINDOW_ANIM_FRAME_START, 3);

make_window(AT_BAIR, 3,
  AG_WINDOW_TYPE, 1,
  AG_WINDOW_LENGTH, 7,
  AG_WINDOW_ANIM_FRAMES, 3,
  AG_WINDOW_ANIM_FRAME_START, 4,
  AG_WINDOW_HAS_WHIFFLAG, 4)

make_hitbox(AT_BAIR, 1,
  HG_PARENT_HITBOX, 1,
  HG_HITBOX_TYPE, 1,
  HG_WINDOW, 2,
  HG_LIFETIME, 10,
  HG_HITBOX_X, -20,
  HG_HITBOX_Y, -35,
  HG_WIDTH, 55,
  HG_HEIGHT, 85,
  HG_PRIORITY, 2,
  HG_DAMAGE, 5,
  HG_ANGLE, 45,
  HG_BASE_KNOCKBACK, 5,
  HG_KNOCKBACK_SCALING, .4,
  HG_BASE_HITPAUSE, 6,
  HG_HITPAUSE_SCALING, .25,
  HG_VISUAL_EFFECT_X_OFFSET, -32,
  HG_VISUAL_EFFECT_Y_OFFSET, -10,
  HG_HIT_SFX, asset_get("sfx_blow_medium1"),
  HG_ANGLE_FLIPPER, 6);


#define make_attack
var _attack_name = argument[0];
for(var i = 1; i <= argument_count-1; i+=2) {
  set_attack_value(
    _attack_name, argument[i], argument[i+1]
  )
}

#define make_window
var _attack_name = argument[0];
var _index = argument[1];
for(var i = 2; i <= argument_count-1; i+=2) {
  set_window_value(
    _attack_name, _index, argument[i], argument[i+1]
  )
}
var _old_num_windows = get_attack_value(_attack_name, AG_NUM_WINDOWS)
var _new_num_windows = max(_old_num_windows, _index)
set_attack_value(_attack_name, AG_NUM_WINDOWS, _new_num_windows)


#define make_hitbox
var _attack_name = argument[0];
var _index = argument[1];
for(var i = 2; i <= argument_count-1; i+=2) {
  set_hitbox_value(
    _attack_name, _index, argument[i], argument[i+1]
  )
}
var _old_num_hitboxes = get_num_hitboxes(_attack_name)
var _new_num_hitboxes = max(_old_num_hitboxes, _index)
set_num_hitboxes(_attack_name, _new_num_hitboxes);
