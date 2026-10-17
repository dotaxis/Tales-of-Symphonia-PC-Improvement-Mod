// World movement, Ozette waypoints, Rheairds animation and Noishe town entry.
// Tales of Symphonia 60FPS v0.0.46; controlled by [60FPS] Enabled=1.
// Fresh launch required. Reference VAs identify source bytes, not runtime allocations.
// Bare ASM numbers are hexadecimal; # introduces decimal.
// Sections:
//   World movement

[ENABLE]

// ======================================================================
// World movement
// World movement, paired Ozette waypoint corrections and Noishe town entry.
// Ozette waypoint input doubling and output halving are paired; Noishe town entry preserves the existing
// branch change.
// ======================================================================

alloc(fps_world_movement_code,1000)

label(fps_ozette_waypoint_half)
label(fps_ozette_waypoint_input)
label(fps_ozette_waypoint_output)

// Guard the native callbacks and continuations used by this script.
assert(TOS.exe+C17F8,0F 86 85 03 00)
assert(TOS.exe+C1B76,5B 8B E5 5D C3)

// Reference VA 004B312D..004B312E.
// Allow town entry while riding Noishe by removing the rejecting branch. This is the accepted v0.0.41
// fix.
assert(TOS.exe+B312D,75 C3)
TOS.exe+B312D:
// Vanilla: jne 0x4b30f2
  nop // 004B312D
  nop // 004B312E

// Reference VA 004BB245..004BB24A.
// Use multiplier 1.0 instead of 0.5 for Rheairds animation rate under the corrected frame timing.
assert(TOS.exe+BB245,DC 0D 50 29 88 00)
TOS.exe+BB245:
// Vanilla: fmul qword ptr [0x882950]
  fmul qword ptr [fps_double_one] // 004BB245

// Reference VA 004BC9E4..004BC9E9.
// Use multiplier 1 instead of 0.5 in the world actor movement update, retaining the accepted interaction
// with global tick timing.
assert(TOS.exe+BC9E4,DC 0D 50 29 88 00)
TOS.exe+BC9E4:
// Vanilla: fmul qword ptr [0x882950]
  fmul qword ptr [fps_double_one] // 004BC9E4

// Reference VA 004C17F2..004C17F7.
// Double the waypoint input step; pair with the output-half helper to preserve movement while avoiding
// the Ozette arrival stall.
assert(TOS.exe+C17F2,8B 7D 08 83 3F 00)
TOS.exe+C17F2:
// Vanilla: mov edi, dword ptr [ebp + 8]; cmp dword ptr [edi], 0
  jmp near fps_ozette_waypoint_input // 004C17F2
  nop // 004C17F7

// Reference VA 004C1B71..004C1B75.
// Halve the resulting waypoint XYZ vector and restore the displaced epilogue; keep paired with input
// doubling.
assert(TOS.exe+C1B71,83 C4 04 5F 5E)
TOS.exe+C1B71:
// Vanilla: add esp, 4; pop edi; pop esi
  jmp near fps_ozette_waypoint_output // 004C1B71

// ----------------------------------------------------------------------
// Reference payload 02EFF2CC..02EFF3FF; retained code/data/padding.
fps_world_movement_code+C:
// float32 0.5 for waypoint output displacement.
fps_ozette_waypoint_half:
  db 00,00,00,3F,00,00,00,00 // 02EFF2CC: constants / retained padding

// Double waypoint input step then replay original argument/busy check.
fps_ozette_waypoint_input:
  fld dword ptr [ebp + 0x14] // 02EFF2D4
  fadd st(0), st(0) // 02EFF2D7
  fstp dword ptr [ebp + 0x14] // 02EFF2D9
  mov edi, dword ptr [ebp + #8] // 02EFF2DC
  cmp dword ptr [edi], #0 // 02EFF2DF
  jmp near TOS.exe+C17F8 // 02EFF2E2
  db 00,00,00,00,00,00,00,00,00 // 02EFF2E7: constants / retained padding

// Halve resulting XYZ waypoint vector and restore displaced epilogue.
fps_ozette_waypoint_output:
  fld dword ptr [ebx] // 02EFF2F0
  fmul dword ptr [fps_ozette_waypoint_half] // 02EFF2F2
  fstp dword ptr [ebx] // 02EFF2F8
  fld dword ptr [ebx + #4] // 02EFF2FA
  fmul dword ptr [fps_ozette_waypoint_half] // 02EFF2FD
  fstp dword ptr [ebx + #4] // 02EFF303
  fld dword ptr [ebx + #8] // 02EFF306
  fmul dword ptr [fps_ozette_waypoint_half] // 02EFF309
  fstp dword ptr [ebx + #8] // 02EFF30F
  add esp, #4 // 02EFF312
  pop edi // 02EFF315
  pop esi // 02EFF316
  jmp near TOS.exe+C1B76 // 02EFF317
  db 00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00 // 02EFF31C: constants / retained padding
  db 00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00 // 02EFF32C: constants / retained padding
  db 00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00 // 02EFF33C: constants / retained padding
  db 00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00 // 02EFF34C: constants / retained padding
  db 00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00 // 02EFF35C: constants / retained padding
  db 00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00 // 02EFF36C: constants / retained padding
  db 00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00 // 02EFF37C: constants / retained padding
  db 00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00 // 02EFF38C: constants / retained padding
  db 00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00 // 02EFF39C: constants / retained padding
  db 00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00 // 02EFF3AC: constants / retained padding
  db 00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00 // 02EFF3BC: constants / retained padding
  db 00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00 // 02EFF3CC: constants / retained padding
  db 00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00 // 02EFF3DC: constants / retained padding
  db 00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00 // 02EFF3EC: constants / retained padding
  db 00,00,00,00 // 02EFF3FC: constants / retained padding

[DISABLE]
// Restoration evidence only; settings take effect on a fresh launch.

// World movement
TOS.exe+B312D:
  db 75,C3
TOS.exe+BB245:
  db DC,0D,50,29,88,00
TOS.exe+BC9E4:
  db DC,0D,50,29,88,00
TOS.exe+C17F2:
  db 8B,7D,08,83,3F,00
TOS.exe+C1B71:
  db 83,C4,04,5F,5E
dealloc(fps_world_movement_code)
