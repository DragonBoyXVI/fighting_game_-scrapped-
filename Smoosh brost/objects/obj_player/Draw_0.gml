
draw_self()
draw_text(x, y, [player_id, player_local])
draw_text(x, y+16, [state_func, state_changes])
draw_text(x, y+32, [hspd, vspd])

draw_sprite_stretched_ext(spr_pix_hollow, 0, bbox_left, bbox_top, bbox_right-bbox_left, bbox_bottom-bbox_top, c_red, 1)
