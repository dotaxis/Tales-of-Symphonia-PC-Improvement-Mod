// Complete Darkness orb/common shaders, vtables and writable caches.
// Tales of Symphonia 60FPS v0.0.46; controlled by [60FPS] Enabled=1.
// Fresh launch required. Reference VAs identify source bytes, not runtime allocations.
// Bare ASM numbers are hexadecimal; # introduces decimal.
// Sections:
//   Darkness rendering

[ENABLE]

// ======================================================================
// Darkness rendering
// Darkness orb/common rendering, shader transforms, vtables and cache lifecycle.
// Orb and common paths share clone/execute/submit callbacks and vtables. Keep both implementations
// together.
// Both caches start zero in RW allocations. Shader DWORD tokens are data, not executable pointers.
// ======================================================================

alloc(fps_darkness_rendering_code,2000)
alloc(darkness_orb_state,8A0)
alloc(darkness_shader_state,A20)

define(fps_orb_data_state,darkness_orb_state)
define(fps_darkness_data_state,darkness_shader_state)
label(fps_darkness_data)
label(fps_darkness_rdata)
label(fps_darkness_rdata_zzz)
label(fps_darkness_text_clone2)
label(fps_darkness_text_clone3)
label(fps_darkness_text_dark_family)
label(fps_darkness_text_dark_transform_constprop_0)
label(fps_darkness_text_draw)
label(fps_darkness_text_execute2)
label(fps_darkness_text_execute3)
label(fps_darkness_text_observe)
label(fps_darkness_text_submit2)
label(fps_darkness_text_submit3)
label(fps_darkness_text_tag)
label(fps_darkness_text_variant)
label(fps_darkness_vt2)
label(fps_darkness_vt3)
label(fps_loc_02E9011A)
label(fps_loc_02E90151)
label(fps_loc_02E901E2)
label(fps_loc_02E90248)
label(fps_loc_02E9025F)
label(fps_loc_02E902A6)
label(fps_loc_02E902C3)
label(fps_loc_02E9033C)
label(fps_loc_02E90355)
label(fps_loc_02E9038B)
label(fps_loc_02E903AE)
label(fps_loc_02E903C9)
label(fps_loc_02E903D0)
label(fps_loc_02E903D5)
label(fps_loc_02E903DC)
label(fps_loc_02E903E1)
label(fps_loc_02E903E8)
label(fps_loc_02E903EF)
label(fps_loc_02E903F4)
label(fps_loc_02E903F9)
label(fps_loc_02E90402)
label(fps_loc_02E90407)
label(fps_loc_02E9040E)
label(fps_loc_02E90441)
label(fps_loc_02E90493)
label(fps_loc_02E9049C)
label(fps_loc_02E904A9)
label(fps_loc_02E904CF)
label(fps_loc_02E904E2)
label(fps_loc_02E904EF)
label(fps_loc_02E90500)
label(fps_loc_02E90524)
label(fps_loc_02E90542)
label(fps_loc_02E90582)
label(fps_loc_02E905A5)
label(fps_loc_02E905C8)
label(fps_loc_02E90646)
label(fps_loc_02E90650)
label(fps_loc_02E90657)
label(fps_loc_02E90660)
label(fps_loc_02E90677)
label(fps_loc_02E9069A)
label(fps_loc_02E906C8)
label(fps_loc_02E906DF)
label(fps_loc_02E90730)
label(fps_loc_02E9074B)
label(fps_loc_02E9074F)
label(fps_loc_02E90762)
label(fps_loc_02E90766)
label(fps_loc_02E90779)
label(fps_loc_02E90796)
label(fps_loc_02E907BC)
label(fps_loc_02E907BE)
label(fps_loc_02E907C6)
label(fps_loc_02E907F2)
label(fps_loc_02E90804)
label(fps_loc_02E9081A)
label(fps_loc_02E90827)
label(fps_loc_02E9083D)
label(fps_loc_02E90893)
label(fps_loc_02E9089D)
label(fps_loc_02E908CA)
label(fps_loc_02E90937)
label(fps_loc_02E90A04)
label(fps_loc_02E90A2A)
label(fps_loc_02E90A38)
label(fps_loc_02E90A48)
label(fps_loc_02E90A58)
label(fps_loc_02E90A66)
label(fps_loc_02E90A6E)
label(fps_loc_02E90A74)
label(fps_loc_02E90A76)
label(fps_loc_02E94034)
label(fps_loc_02E9403A)
label(fps_loc_02E94064)
label(fps_loc_02E94077)
label(fps_loc_02E9408A)
label(fps_loc_02E9409B)
label(fps_loc_02E940AC)
label(fps_loc_02E940BD)
label(fps_loc_02E940C5)
label(fps_loc_02E940CB)
label(fps_loc_02E940CF)
label(fps_loc_02E940DB)
label(fps_loc_02E940E7)
label(fps_loc_02E940F5)
label(fps_loc_02E94103)
label(fps_loc_02E94111)
label(fps_loc_02E9411B)
label(fps_loc_02E9411F)
label(fps_loc_02E94129)
label(fps_loc_02E94131)
label(fps_loc_02E94139)
label(fps_loc_02E9413F)
label(fps_loc_02E94141)
label(fps_loc_02E94144)
label(fps_loc_02E94206)
label(fps_loc_02E942A3)
label(fps_loc_02E9430C)
label(fps_loc_02E94318)
label(fps_loc_02E9431E)
label(fps_loc_02E9433A)
label(fps_loc_02E94356)
label(fps_loc_02E9438B)
label(fps_loc_02E94399)
label(fps_loc_02E943DA)
label(fps_loc_02E943DD)
label(fps_loc_02E9440A)
label(fps_loc_02E9442B)
label(fps_loc_02E94430)
label(fps_loc_02E9445F)
label(fps_loc_02E9449C)
label(fps_loc_02E944BA)
label(fps_loc_02E944FA)
label(fps_loc_02E9451D)
label(fps_loc_02E94540)
label(fps_loc_02E945BE)
label(fps_loc_02E945C8)
label(fps_loc_02E945CF)
label(fps_loc_02E945D8)
label(fps_loc_02E945EF)
label(fps_loc_02E94612)
label(fps_loc_02E94640)
label(fps_loc_02E94657)
label(fps_loc_02E946AA)
label(fps_loc_02E94702)
label(fps_loc_02E94AC7)
label(fps_loc_02E94ACF)
label(fps_loc_02E94AFB)
label(fps_loc_02E94B08)
label(fps_loc_02E94C77)
label(fps_loc_02E94CD9)
label(fps_loc_02E94CF3)
label(fps_loc_02E94D38)
label(fps_loc_02E94D52)
label(fps_loc_02E94DD0)
label(fps_loc_02E94DE9)
label(fps_loc_02E94E1F)
label(fps_loc_02E94E45)
label(fps_loc_02E94E60)
label(fps_loc_02E94E67)
label(fps_loc_02E94E6C)
label(fps_loc_02E94E73)
label(fps_loc_02E94E78)
label(fps_loc_02E94E82)
label(fps_loc_02E94E89)
label(fps_loc_02E94E8E)
label(fps_loc_02E94E93)
label(fps_loc_02E94E9C)
label(fps_loc_02E94EA8)
label(fps_loc_02E94EDC)
label(fps_loc_02E94F35)
label(fps_loc_02E94F43)
label(fps_loc_02E94F69)
label(fps_loc_02E94F7C)
label(fps_loc_02E94F83)
label(fps_loc_02E94F91)
label(fps_orb_commonvt3)
label(fps_orb_data)
label(fps_orb_rdata)
label(fps_orb_rdata_zzz)
label(fps_orb_text_clone3)
label(fps_orb_text_draw)
label(fps_orb_text_execute3)
label(fps_orb_text_orb_transform_constprop_0)
label(fps_orb_text_submit3)
label(fps_orb_text_variant)
label(fps_orb_vt3)

// Guard the native callbacks and continuations used by this script.
assert(TOS.exe+1854B0,55 8B EC 83 E4)
assert(TOS.exe+185510,55 8B EC 6A FF)
assert(TOS.exe+185600,55 8B EC 83 EC)
assert(TOS.exe+186B20,55 8B EC F6 45)
assert(TOS.exe+1872E0,55 8B EC 83 EC)
assert(TOS.exe+187360,55 8B EC 83 E4)
assert(TOS.exe+1873D0,55 8B EC 6A FF)
assert(TOS.exe+1874C0,55 8B EC 83 EC)
assert(TOS.exe+187510,55 8B EC 83 EC)
assert(TOS.exe+188630,55 8B EC 83 E4)
assert(TOS.exe+19E6E0,C2 04 00 CC CC)

// Reference VA 00595232..00595236.
assert(TOS.exe+195232,E8 D9 02 FF FF)
TOS.exe+195232:
// Vanilla: call 0x585510
  call fps_darkness_text_submit2 // 00595232

// Reference VA 00595AA6..00595AAA.
assert(TOS.exe+195AA6,E8 25 19 FF FF)
TOS.exe+195AA6:
// Vanilla: call 0x5873d0
  call fps_orb_text_submit3 // 00595AA6

// ----------------------------------------------------------------------
// Reference payload 02E90100..02E90B67; retained code/data/padding.
fps_darkness_rendering_code+0:
// Clone the native 3D command then restore the specialized vtable.
fps_orb_text_clone3:
  push ebp // 02E90100
  mov eax, TOS.exe+187660 // 02E90101
  mov ebp, esp // 02E90106
  call eax // 02E90108
  test eax, eax // 02E9010A
  je short fps_loc_02E9011A // 02E9010C
  mov dword ptr [eax], fps_orb_vt3 // 02E9010E
  inc dword ptr [darkness_orb_state+18] // 02E90114
fps_loc_02E9011A:
  pop ebp // 02E9011A
  ret // 02E9011B

// Call native 3D execution and tag the queued indexed draw.
fps_orb_text_execute3:
  push ebp // 02E9011C
  mov eax, TOS.exe+187650 // 02E9011D
  mov ebp, esp // 02E90122
  call eax // 02E90124
  mov edx, dword ptr [TOS.exe+19B9BCC] // 02E90126
  lea ecx, [edx - 0x20] // 02E9012C
  cmp ecx, eax // 02E9012F
  jne short fps_loc_02E90151 // 02E90131
  cmp dword ptr [eax], TOS.exe+1D6EC0 // 02E90133
  jne short fps_loc_02E90151 // 02E90139
  cmp dword ptr [edx - 0x1c], TOS.exe+1CF250 // 02E9013B
  jne short fps_loc_02E90151 // 02E90142
  mov dword ptr [edx - 0x1c], fps_orb_text_draw // 02E90144
  inc dword ptr [darkness_orb_state+1C] // 02E9014B
fps_loc_02E90151:
  pop ebp // 02E90151
  ret // 02E90152
  nop // 02E90153

// Validate straight-line ps_3_0, reserve sampler 1, append D RGB multiply and retain original alpha.
fps_orb_text_orb_transform_constprop_0:
  push ebp // 02E90154
  mov ebp, esp // 02E90155
  push edi // 02E90157
  push esi // 02E90158
  push ebx // 02E90159
  sub esp, 0x70 // 02E9015A
  mov dword ptr [ebp - 0x5c], eax // 02E9015D
  lea eax, [edx - #2] // 02E90160
  mov dword ptr [ebp - 0x60], edx // 02E90163
  mov dword ptr [ebp - 0x4c], ecx // 02E90166
  cmp eax, 0x1fe // 02E90169
  ja near fps_loc_02E903E1 // 02E9016E
  mov eax, dword ptr [ebp - 0x5c] // 02E90174
  cmp dword ptr [eax], 0xffff0300 // 02E90177
  jne near fps_loc_02E903E1 // 02E9017D
  mov eax, dword ptr [ebp - 0x4c] // 02E90183
  xor edx, edx // 02E90186
  xor ecx, ecx // 02E90188
  mov dword ptr [ebp - 0x54], 0xa // 02E9018A
  mov dword ptr [ebp - 0x70], ecx // 02E90191
  mov dword ptr [eax], 0xffff0300 // 02E90194
  mov dword ptr [eax + #4], 0x5000051 // 02E9019A
  mov dword ptr [eax + #8], 0xa00f00df // 02E901A1
  mov dword ptr [eax + 0xc], 0x3f1e4000 // 02E901A8
  mov dword ptr [eax + 0x10], 0x3f104000 // 02E901AF
  mov dword ptr [eax + 0x14], edx // 02E901B6
  mov dword ptr [eax + 0x18], edx // 02E901B9
  mov dword ptr [eax + 0x1c], 0x200001f // 02E901BC
  mov dword ptr [eax + 0x20], 0x90000000 // 02E901C3
  mov dword ptr [eax + 0x24], 0xa00f0801 // 02E901CA
  mov eax, dword ptr [ebp - 0x60] // 02E901D1
  mov dword ptr [ebp - 0x6c], ecx // 02E901D4
  dec eax // 02E901D7
  mov dword ptr [ebp - 0x50], #1 // 02E901D8
  mov dword ptr [ebp - 0x7c], eax // 02E901DF
fps_loc_02E901E2:
  mov eax, dword ptr [ebp - 0x50] // 02E901E2
  mov esi, dword ptr [ebp - 0x50] // 02E901E5
  lea edi, [eax*#4] // 02E901E8
  mov eax, dword ptr [ebp - 0x5c] // 02E901EF
  mov esi, dword ptr [eax + esi*#4] // 02E901F2
  movzx ebx, si // 02E901F5
  cmp ebx, 0xffff // 02E901F8
  jne short fps_loc_02E9025F // 02E901FE
  cmp esi, 0xffff // 02E90200
  jne near fps_loc_02E903E1 // 02E90206
  mov eax, dword ptr [ebp - 0x50] // 02E9020C
  inc eax // 02E9020F
  cmp dword ptr [ebp - 0x60], eax // 02E90210
  jne near fps_loc_02E903E1 // 02E90213
  mov eax, dword ptr [ebp - 0x6c] // 02E90219
  mov edx, dword ptr [ebp - 0x70] // 02E9021C
  xor eax, #1 // 02E9021F
  xor edx, #1 // 02E90222
  or eax, edx // 02E90225
  jne near fps_loc_02E903E1 // 02E90227
  lea edi, [ebp - 0x48] // 02E9022D
  mov esi, fps_orb_data // 02E90230
  lea ebx, [ebp - 0x48] // 02E90235
  mov ecx, 0xf // 02E90238
  rep movsd dword ptr es:[edi], dword ptr [esi] // 02E9023D
  mov esi, dword ptr [ebp - 0x4c] // 02E9023F
  mov edi, dword ptr [ebp - 0x54] // 02E90242
  lea edx, [esi + edi*#4] // 02E90245
fps_loc_02E90248:
  mov ecx, dword ptr [ebx + eax*#4] // 02E90248
  mov dword ptr [edx + eax*#4], ecx // 02E9024B
  inc eax // 02E9024E
  cmp eax, 0xf // 02E9024F
  jne short fps_loc_02E90248 // 02E90252
  mov eax, dword ptr [ebp - 0x54] // 02E90254
  add eax, 0xf // 02E90257
  jmp near fps_loc_02E90500 // 02E9025A
fps_loc_02E9025F:
  cmp ebx, 0xfffe // 02E9025F
  jne short fps_loc_02E902C3 // 02E90265
  mov eax, esi // 02E90267
  mov esi, dword ptr [ebp - 0x60] // 02E90269
  shr eax, 0x10 // 02E9026C
  lea edx, [esi - #1] // 02E9026F
  and eax, 0x7fff // 02E90272
  sub edx, dword ptr [ebp - 0x50] // 02E90277
  cmp edx, eax // 02E9027A
  jb near fps_loc_02E903E1 // 02E9027C
  mov ecx, dword ptr [ebp - 0x54] // 02E90282
  lea ecx, [eax + ecx + #1] // 02E90285
  cmp ecx, 0x218 // 02E90289
  ja near fps_loc_02E903E1 // 02E9028F
  mov esi, dword ptr [ebp - 0x5c] // 02E90295
  mov edx, dword ptr [ebp - 0x54] // 02E90298
  db 8D,1C,3E // lea ebx, [esi + edi] // 02E9029B
  mov edi, dword ptr [ebp - 0x4c] // 02E9029E
  lea esi, [edi + edx*#4] // 02E902A1
  xor edx, edx // 02E902A4
fps_loc_02E902A6:
  mov edi, dword ptr [ebx + edx*#4] // 02E902A6
  mov dword ptr [esi + edx*#4], edi // 02E902A9
  inc edx // 02E902AC
  cmp eax, edx // 02E902AD
  jae short fps_loc_02E902A6 // 02E902AF
  mov edi, dword ptr [ebp - 0x50] // 02E902B1
  mov dword ptr [ebp - 0x54], ecx // 02E902B4
  db 8D,44,07,01 // lea eax, [edi + eax + #1] // 02E902B7
  mov dword ptr [ebp - 0x50], eax // 02E902BB
  jmp near fps_loc_02E904EF // 02E902BE
fps_loc_02E902C3:
  bt esi, 0x1c // 02E902C3
  jb near fps_loc_02E903E1 // 02E902C7
  mov eax, esi // 02E902CD
  shr eax, 0x18 // 02E902CF
  and eax, 0xf // 02E902D2
  mov dword ptr [ebp - 0x58], eax // 02E902D5
  mov edx, dword ptr [ebp - 0x58] // 02E902D8
  mov eax, dword ptr [ebp - 0x7c] // 02E902DB
  sub eax, dword ptr [ebp - 0x50] // 02E902DE
  cmp eax, edx // 02E902E1
  jb near fps_loc_02E903E1 // 02E902E3
  mov eax, dword ptr [ebp - 0x54] // 02E902E9
  inc eax // 02E902EC
  mov dword ptr [ebp - 0x68], eax // 02E902ED
  mov ecx, dword ptr [ebp - 0x68] // 02E902F0
  db 8D,04,0A // lea eax, [edx + ecx] // 02E902F3
  cmp eax, 0x218 // 02E902F6
  ja near fps_loc_02E903E1 // 02E902FB
  cmp ebx, 0x1f // 02E90301
  jne short fps_loc_02E9033C // 02E90304
  cmp edx, #2 // 02E90306
  jne near fps_loc_02E903E1 // 02E90309
  mov eax, dword ptr [ebp - 0x5c] // 02E9030F
  cmp dword ptr [eax + edi + #4], 0x90000000 // 02E90312
  jne near fps_loc_02E90402 // 02E9031A
  mov eax, dword ptr [eax + edi + #8] // 02E90320
  and eax, 0x70001fff // 02E90324
  cmp eax, 0x20000800 // 02E90329
  sete al // 02E9032E
  movzx eax, al // 02E90331
  or dword ptr [ebp - 0x6c], eax // 02E90334
  jmp near fps_loc_02E90407 // 02E90337
fps_loc_02E9033C:
  cmp ebx, 0x51 // 02E9033C
  jne short fps_loc_02E90355 // 02E9033F
  cmp dword ptr [ebp - 0x58], #5 // 02E90341
  jne near fps_loc_02E903E1 // 02E90345
  mov edx, #1 // 02E9034B
  jmp near fps_loc_02E903F9 // 02E90350
fps_loc_02E90355:
  cmp ebx, 0x24 // 02E90355
  ja short fps_loc_02E903AE // 02E90358
  cmp ebx, 0xd // 02E9035A
  ja short fps_loc_02E9038B // 02E9035D
  xor edx, edx // 02E9035F
  test ebx, ebx // 02E90361
  je near fps_loc_02E903F4 // 02E90363
  mov eax, #1 // 02E90369
  mov ecx, ebx // 02E9036E
  shl eax, cl // 02E90370
  test eax, 0x3f2c // 02E90372
  jne short fps_loc_02E903E8 // 02E90377
  and eax, 0xc2 // 02E90379
  cmp eax, #1 // 02E9037E
  sbb edx, edx // 02E90381
  and edx, #2 // 02E90383
  add edx, #2 // 02E90386
  jmp short fps_loc_02E903F4 // 02E90389
fps_loc_02E9038B:
  lea ecx, [ebx - 0xe] // 02E9038B
  mov eax, #1 // 02E9038E
  shl eax, cl // 02E90393
  test eax, 0x600023 // 02E90395
  jne short fps_loc_02E903D5 // 02E9039A
  and eax, 0xc0008 // 02E9039C
  jne short fps_loc_02E903E8 // 02E903A1
  cmp ebx, 0x12 // 02E903A3
  jne near fps_loc_02E90500 // 02E903A6
  jmp short fps_loc_02E903C9 // 02E903AC
fps_loc_02E903AE:
  cmp ebx, 0x41 // 02E903AE
  je short fps_loc_02E903EF // 02E903B1
  cmp ebx, 0x40 // 02E903B3
  jbe short fps_loc_02E903E1 // 02E903B6
  cmp ebx, 0x5a // 02E903B8
  je short fps_loc_02E903C9 // 02E903BB
  ja short fps_loc_02E903D0 // 02E903BD
  cmp ebx, 0x42 // 02E903BF
  je short fps_loc_02E903E8 // 02E903C2
  cmp ebx, 0x58 // 02E903C4
  jne short fps_loc_02E903E1 // 02E903C7
fps_loc_02E903C9:
  mov edx, #4 // 02E903C9
  jmp short fps_loc_02E903F4 // 02E903CE
fps_loc_02E903D0:
  cmp ebx, 0x5c // 02E903D0
  ja short fps_loc_02E903DC // 02E903D3
fps_loc_02E903D5:
  mov edx, #2 // 02E903D5
  jmp short fps_loc_02E903F4 // 02E903DA
fps_loc_02E903DC:
  cmp ebx, 0x5f // 02E903DC
  je short fps_loc_02E903E8 // 02E903DF
fps_loc_02E903E1:
  xor eax, eax // 02E903E1
  jmp near fps_loc_02E90500 // 02E903E3
fps_loc_02E903E8:
  mov edx, #3 // 02E903E8
  jmp short fps_loc_02E903F4 // 02E903ED
fps_loc_02E903EF:
  mov edx, #1 // 02E903EF
fps_loc_02E903F4:
  cmp dword ptr [ebp - 0x58], edx // 02E903F4
  jne short fps_loc_02E903E1 // 02E903F7
fps_loc_02E903F9:
  mov dword ptr [ebp - 0x64], #1 // 02E903F9
  jmp short fps_loc_02E9040E // 02E90400
fps_loc_02E90402:
  mov edx, #2 // 02E90402
fps_loc_02E90407:
  mov dword ptr [ebp - 0x64], #2 // 02E90407
fps_loc_02E9040E:
  mov ecx, dword ptr [ebp - 0x54] // 02E9040E
  mov eax, dword ptr [ebp - 0x4c] // 02E90411
  mov dword ptr [eax + ecx*#4], esi // 02E90414
  and esi, 0xffef // 02E90417
  cmp esi, 0x41 // 02E9041D
  mov esi, #1 // 02E90420
  sete al // 02E90425
  cmp ebx, 0x1f // 02E90428
  sete cl // 02E9042B
  or eax, ecx // 02E9042E
  mov byte ptr [ebp - 0x71], al // 02E90430
  mov eax, dword ptr [ebp - 0x5c] // 02E90433
  add eax, edi // 02E90436
  mov dword ptr [ebp - 0x78], eax // 02E90438
  mov eax, dword ptr [ebp - 0x68] // 02E9043B
  mov dword ptr [ebp - 0x54], eax // 02E9043E
fps_loc_02E90441:
  cmp dword ptr [ebp - 0x58], esi // 02E90441
  jb near fps_loc_02E904E2 // 02E90444
  mov eax, dword ptr [ebp - 0x78] // 02E9044A
  mov ecx, dword ptr [eax + esi*#4] // 02E9044D
  cmp esi, dword ptr [ebp - 0x64] // 02E90450
  jb short fps_loc_02E904CF // 02E90453
  cmp edx, esi // 02E90455
  jb short fps_loc_02E904CF // 02E90457
  test ecx, ecx // 02E90459
  jns short fps_loc_02E903E1 // 02E9045B
  mov eax, ecx // 02E9045D
  and eax, 0x2000 // 02E9045F
  jne near fps_loc_02E903E1 // 02E90464
  mov ebx, ecx // 02E9046A
  mov edi, ecx // 02E9046C
  shr ebx, 0x1c // 02E9046E
  shr edi, #8 // 02E90471
  and edi, 0x18 // 02E90474
  and ebx, #7 // 02E90477
  or ebx, edi // 02E9047A
  mov edi, ecx // 02E9047C
  and edi, 0x7ff // 02E9047E
  setne byte ptr [ebp - 0x68] // 02E90484
  cmp ebx, 0xa // 02E90488
  jne short fps_loc_02E90493 // 02E9048B
  cmp byte ptr [ebp - 0x68], #0 // 02E9048D
  jne short fps_loc_02E90500 // 02E90491
fps_loc_02E90493:
  test ebx, ebx // 02E90493
  jne short fps_loc_02E9049C // 02E90495
  cmp edi, 0x1d // 02E90497
  ja short fps_loc_02E90500 // 02E9049A
fps_loc_02E9049C:
  cmp ebx, #2 // 02E9049C
  jne short fps_loc_02E904A9 // 02E9049F
  cmp edi, 0xdf // 02E904A1
  je short fps_loc_02E90500 // 02E904A7
fps_loc_02E904A9:
  cmp ebx, #8 // 02E904A9
  jne short fps_loc_02E904CF // 02E904AC
  cmp esi, #1 // 02E904AE
  jne short fps_loc_02E90500 // 02E904B1
  cmp byte ptr [ebp - 0x68], #0 // 02E904B3
  jne short fps_loc_02E90500 // 02E904B7
  cmp byte ptr [ebp - 0x71], #0 // 02E904B9
  jne short fps_loc_02E90500 // 02E904BD
  mov dword ptr [ebp - 0x70], #1 // 02E904BF
  and ecx, 0x8fffe000 // 02E904C6
  or ecx, 0x1f // 02E904CC
fps_loc_02E904CF:
  inc dword ptr [ebp - 0x54] // 02E904CF
  mov eax, dword ptr [ebp - 0x4c] // 02E904D2
  inc esi // 02E904D5
  mov edi, dword ptr [ebp - 0x54] // 02E904D6
  mov dword ptr [eax + edi*#4 - #4], ecx // 02E904D9
  jmp near fps_loc_02E90441 // 02E904DD
fps_loc_02E904E2:
  mov eax, dword ptr [ebp - 0x50] // 02E904E2
  mov esi, dword ptr [ebp - 0x58] // 02E904E5
  lea eax, [eax + esi + #1] // 02E904E8
  mov dword ptr [ebp - 0x50], eax // 02E904EC
fps_loc_02E904EF:
  mov edi, dword ptr [ebp - 0x60] // 02E904EF
  cmp dword ptr [ebp - 0x50], edi // 02E904F2
  jb near fps_loc_02E901E2 // 02E904F5
  jmp near fps_loc_02E903E1 // 02E904FB
fps_loc_02E90500:
  add esp, 0x70 // 02E90500
  pop ebx // 02E90503
  pop esi // 02E90504
  pop edi // 02E90505
  pop ebp // 02E90506
  ret // 02E90507

// Cache up to eight device/original-shader pairs; transform supported bytecode; release evicted COM references.
fps_orb_text_variant:
  push ebp // 02E90508
  mov ebp, esp // 02E90509
  push edi // 02E9050B
  mov edi, eax // 02E9050C
  xor eax, eax // 02E9050E
  push esi // 02E90510
  mov esi, edx // 02E90511
  push ebx // 02E90513
  sub esp, 0x1068 // 02E90514
  mov dword ptr [ebp - 0x1074], 0x800 // 02E9051A
fps_loc_02E90524:
  imul ecx, eax, 0xc // 02E90524
  cmp dword ptr [ecx + darkness_orb_state+83C], edi // 02E90527
  jne short fps_loc_02E90542 // 02E9052D
  cmp dword ptr [ecx + darkness_orb_state+840], esi // 02E9052F
  jne short fps_loc_02E90542 // 02E90535
  mov eax, dword ptr [ecx + darkness_orb_state+844] // 02E90537
  jmp near fps_loc_02E906DF // 02E9053D
fps_loc_02E90542:
  inc eax // 02E90542
  cmp eax, #8 // 02E90543
  jne short fps_loc_02E90524 // 02E90546
  inc dword ptr [darkness_orb_state+20] // 02E90548
  mov ebx, dword ptr [darkness_orb_state+89C] // 02E9054E
  lea eax, [ebx + #1] // 02E90554
  and ebx, #7 // 02E90557
  imul edx, ebx, 0xc // 02E9055A
  mov dword ptr [darkness_orb_state+89C], eax // 02E9055D
  lea eax, [edx + fps_orb_data_state] // 02E90562
  cmp dword ptr [edx + darkness_orb_state+844], #0 // 02E90568
  je short fps_loc_02E90582 // 02E9056F
  mov edx, dword ptr [edx + darkness_orb_state+844] // 02E90571
  mov edx, dword ptr [edx] // 02E90577
  push dword ptr [eax + 0x844] // 02E90579
  call dword ptr [edx + #8] // 02E9057F
fps_loc_02E90582:
  imul edx, ebx, 0xc // 02E90582
  lea eax, [edx + fps_orb_data_state] // 02E90585
  cmp dword ptr [edx + darkness_orb_state+840], #0 // 02E9058B
  je short fps_loc_02E905A5 // 02E90592
  mov edx, dword ptr [edx + darkness_orb_state+840] // 02E90594
  mov edx, dword ptr [edx] // 02E9059A
  push dword ptr [eax + 0x840] // 02E9059C
  call dword ptr [edx + #8] // 02E905A2
fps_loc_02E905A5:
  imul edx, ebx, 0xc // 02E905A5
  lea eax, [edx + fps_orb_data_state] // 02E905A8
  cmp dword ptr [edx + darkness_orb_state+83C], #0 // 02E905AE
  je short fps_loc_02E905C8 // 02E905B5
  mov edx, dword ptr [edx + darkness_orb_state+83C] // 02E905B7
  mov edx, dword ptr [edx] // 02E905BD
  push dword ptr [eax + 0x83c] // 02E905BF
  call dword ptr [edx + #8] // 02E905C5
fps_loc_02E905C8:
  imul eax, ebx, 0xc // 02E905C8
  xor edx, edx // 02E905CB
  mov dword ptr [eax + darkness_orb_state+83C], edi // 02E905CD
  mov dword ptr [eax + darkness_orb_state+840], esi // 02E905D3
  mov dword ptr [eax + darkness_orb_state+844], edx // 02E905D9
  mov eax, dword ptr [edi] // 02E905DF
  push edi // 02E905E1
  call dword ptr [eax + #4] // 02E905E2
  mov eax, dword ptr [esi] // 02E905E5
  push esi // 02E905E7
  call dword ptr [eax + #4] // 02E905E8
  mov eax, dword ptr [esi] // 02E905EB
  lea edx, [ebp - 0x1074] // 02E905ED
  push edx // 02E905F3
  push #0 // 02E905F4
  push esi // 02E905F6
  call dword ptr [eax + 0x10] // 02E905F7
  mov dword ptr [darkness_orb_state+24], eax // 02E905FA
  test eax, eax // 02E905FF
  js short fps_loc_02E90646 // 02E90601
  mov eax, dword ptr [ebp - 0x1074] // 02E90603
  cmp eax, 0x800 // 02E90609
  ja short fps_loc_02E90646 // 02E9060E
  test al, #3 // 02E90610
  lea edx, [ebp - 0x1074] // 02E90612
  jne short fps_loc_02E90646 // 02E90618
  mov eax, dword ptr [esi] // 02E9061A
  push edx // 02E9061C
  lea edx, [ebp - 0x106c] // 02E9061D
  push edx // 02E90623
  push esi // 02E90624
  call dword ptr [eax + 0x10] // 02E90625
  mov dword ptr [darkness_orb_state+24], eax // 02E90628
  test eax, eax // 02E9062D
  js short fps_loc_02E90646 // 02E9062F
  mov edx, dword ptr [ebp - 0x1074] // 02E90631
  cmp edx, 0x800 // 02E90637
  ja short fps_loc_02E90646 // 02E9063D
  mov eax, edx // 02E9063F
  and eax, #3 // 02E90641
  je short fps_loc_02E90657 // 02E90644
fps_loc_02E90646:
  mov dword ptr [darkness_orb_state+28], #1 // 02E90646
fps_loc_02E90650:
  xor eax, eax // 02E90650
  jmp near fps_loc_02E906DF // 02E90652
fps_loc_02E90657:
  shr edx, #2 // 02E90657
  mov dword ptr [darkness_orb_state+34], edx // 02E9065A
fps_loc_02E90660:
  cmp edx, eax // 02E90660
  lea esi, [ebp - 0x106c] // 02E90662
  je short fps_loc_02E90677 // 02E90668
  mov ecx, dword ptr [esi + eax*#4] // 02E9066A
  mov dword ptr [eax*#4 + darkness_orb_state+3C], ecx // 02E9066D
  inc eax // 02E90674
  jmp short fps_loc_02E90660 // 02E90675
fps_loc_02E90677:
  lea ecx, [ebp - 0x86c] // 02E90677
  mov eax, esi // 02E9067D
  call fps_orb_text_orb_transform_constprop_0 // 02E9067F
  lea ecx, [ebp - 0x86c] // 02E90684
  test eax, eax // 02E9068A
  jne short fps_loc_02E9069A // 02E9068C
  mov dword ptr [darkness_orb_state+28], #2 // 02E9068E
  jmp short fps_loc_02E90650 // 02E90698
fps_loc_02E9069A:
  mov eax, dword ptr [edi] // 02E9069A
  lea edx, [ebp - 0x1070] // 02E9069C
  xor esi, esi // 02E906A2
  mov dword ptr [ebp - 0x1070], esi // 02E906A4
  push edx // 02E906AA
  push ecx // 02E906AB
  push edi // 02E906AC
  call dword ptr [eax + 0x1a8] // 02E906AD
  mov dword ptr [darkness_orb_state+24], eax // 02E906B3
  test eax, eax // 02E906B8
  jns short fps_loc_02E906C8 // 02E906BA
  mov dword ptr [darkness_orb_state+28], #3 // 02E906BC
  jmp short fps_loc_02E90650 // 02E906C6
fps_loc_02E906C8:
  imul ebx, ebx, 0xc // 02E906C8
  mov eax, dword ptr [ebp - 0x1070] // 02E906CB
  xor edx, edx // 02E906D1
  mov dword ptr [ebx + darkness_orb_state+844], eax // 02E906D3
  mov dword ptr [darkness_orb_state+28], edx // 02E906D9
fps_loc_02E906DF:
  lea esp, [ebp - 0xc] // 02E906DF
  pop ebx // 02E906E2
  pop esi // 02E906E3
  pop edi // 02E906E4
  pop ebp // 02E906E5
  ret // 02E906E6
  nop // 02E906E7

// Resolve current common atlas on sampler 1; save/restore shader, texture and all 13 sampler states around the native draw.
fps_orb_text_draw:
  push ebp // 02E906E8
  xor edx, edx // 02E906E9
  mov ebp, esp // 02E906EB
  push edi // 02E906ED
  push esi // 02E906EE
  xor esi, esi // 02E906EF
  push ebx // 02E906F1
  sub esp, 0x44 // 02E906F2
  mov ebx, dword ptr [TOS.exe+72999C] // 02E906F5
  mov dword ptr [ebp - 0x4c], edx // 02E906FB
  mov dword ptr [ebp - 0x48], edx // 02E906FE
  lea edx, [ebp - 0x4c] // 02E90701
  mov eax, dword ptr [ebx] // 02E90704
  inc dword ptr [darkness_orb_state+C] // 02E90706
  push edx // 02E9070C
  push ebx // 02E9070D
  call dword ptr [eax + 0x1b0] // 02E9070E
  test eax, eax // 02E90714
  js short fps_loc_02E90730 // 02E90716
  mov esi, dword ptr [ebp - 0x4c] // 02E90718
  test esi, esi // 02E9071B
  je short fps_loc_02E90730 // 02E9071D
  mov edx, esi // 02E9071F
  mov eax, ebx // 02E90721
  mov dword ptr [darkness_orb_state+2C], esi // 02E90723
  call fps_orb_text_variant // 02E90729
  mov esi, eax // 02E9072E
fps_loc_02E90730:
  mov ecx, dword ptr [TOS.exe+71C0B8] // 02E90730
  mov eax, dword ptr [TOS.exe+71C0BC] // 02E90736
  cmp ecx, 0x1000 // 02E9073B
  ja short fps_loc_02E90762 // 02E90741
  xor edx, edx // 02E90743
  test eax, eax // 02E90745
  jne short fps_loc_02E9074F // 02E90747
  jmp short fps_loc_02E90762 // 02E90749
fps_loc_02E9074B:
  inc edx // 02E9074B
  add eax, 0x1c // 02E9074C
fps_loc_02E9074F:
  cmp ecx, edx // 02E9074F
  je short fps_loc_02E90762 // 02E90751
  cmp dword ptr [eax], 0xd000000 // 02E90753
  jne short fps_loc_02E9074B // 02E90759
  mov eax, dword ptr [eax + 0x10] // 02E9075B
  test eax, eax // 02E9075E
  jne short fps_loc_02E90766 // 02E90760
fps_loc_02E90762:
  xor edi, edi // 02E90762
  jmp short fps_loc_02E90779 // 02E90764
fps_loc_02E90766:
  cmp dword ptr [eax + #4], #3 // 02E90766
  ja short fps_loc_02E90762 // 02E9076A
  mov ecx, dword ptr [eax] // 02E9076C
  test ecx, ecx // 02E9076E
  je short fps_loc_02E90762 // 02E90770
  mov eax, dword ptr [ecx] // 02E90772
  call dword ptr [eax + #4] // 02E90774
  mov edi, eax // 02E90777
fps_loc_02E90779:
  test esi, esi // 02E90779
  je short fps_loc_02E907BC // 02E9077B
  test edi, edi // 02E9077D
  je short fps_loc_02E907BC // 02E9077F
  mov eax, dword ptr [ebx] // 02E90781
  lea edx, [ebp - 0x48] // 02E90783
  push edx // 02E90786
  push #1 // 02E90787
  push ebx // 02E90789
  call dword ptr [eax + 0x100] // 02E9078A
  test eax, eax // 02E90790
  js short fps_loc_02E907BC // 02E90792
  xor edx, edx // 02E90794
fps_loc_02E90796:
  mov eax, dword ptr [ebx] // 02E90796
  lea ecx, [ebp + edx*#4 - 0x40] // 02E90798
  inc edx // 02E9079C
  push ecx // 02E9079D
  push edx // 02E9079E
  mov dword ptr [ebp - 0x50], edx // 02E9079F
  push #1 // 02E907A2
  push ebx // 02E907A4
  call dword ptr [eax + 0x110] // 02E907A5
  test eax, eax // 02E907AB
  js short fps_loc_02E907BC // 02E907AD
  mov edx, dword ptr [ebp - 0x50] // 02E907AF
  cmp edx, 0xd // 02E907B2
  jne short fps_loc_02E90796 // 02E907B5
  jmp near fps_loc_02E9083D // 02E907B7
fps_loc_02E907BC:
  xor edi, edi // 02E907BC
fps_loc_02E907BE:
  inc dword ptr [darkness_orb_state+14] // 02E907BE
  xor esi, esi // 02E907C4
fps_loc_02E907C6:
  push dword ptr [ebp + 0x1c] // 02E907C6
  mov eax, TOS.exe+1CF250 // 02E907C9
  push dword ptr [ebp + 0x18] // 02E907CE
  push dword ptr [ebp + 0x14] // 02E907D1
  push dword ptr [ebp + 0x10] // 02E907D4
  push dword ptr [ebp + 0xc] // 02E907D7
  push dword ptr [ebp + #8] // 02E907DA
  call eax // 02E907DD
  add esp, 0x18 // 02E907DF
  test esi, esi // 02E907E2
  je short fps_loc_02E907F2 // 02E907E4
  mov eax, dword ptr [ebx] // 02E907E6
  push dword ptr [ebp - 0x4c] // 02E907E8
  push ebx // 02E907EB
  call dword ptr [eax + 0x1ac] // 02E907EC
fps_loc_02E907F2:
  test edi, edi // 02E907F2
  je short fps_loc_02E9081A // 02E907F4
  mov eax, dword ptr [ebx] // 02E907F6
  push dword ptr [ebp - 0x48] // 02E907F8
  push #1 // 02E907FB
  push ebx // 02E907FD
  call dword ptr [eax + 0x104] // 02E907FE
fps_loc_02E90804:
  mov eax, dword ptr [ebx] // 02E90804
  push dword ptr [ebp + edi*#4 - 0x44] // 02E90806
  push edi // 02E9080A
  inc edi // 02E9080B
  push #1 // 02E9080C
  push ebx // 02E9080E
  call dword ptr [eax + 0x114] // 02E9080F
  cmp edi, 0xe // 02E90815
  jne short fps_loc_02E90804 // 02E90818
fps_loc_02E9081A:
  mov eax, dword ptr [ebp - 0x48] // 02E9081A
  test eax, eax // 02E9081D
  je short fps_loc_02E90827 // 02E9081F
  mov edx, dword ptr [eax] // 02E90821
  push eax // 02E90823
  call dword ptr [edx + #8] // 02E90824
fps_loc_02E90827:
  mov eax, dword ptr [ebp - 0x4c] // 02E90827
  test eax, eax // 02E9082A
  je near fps_loc_02E908CA // 02E9082C
  mov edx, dword ptr [eax] // 02E90832
  push eax // 02E90834
  call dword ptr [edx + #8] // 02E90835
  jmp near fps_loc_02E908CA // 02E90838
fps_loc_02E9083D:
  mov eax, dword ptr [edi] // 02E9083D
  mov ecx, edi // 02E9083F
  push #1 // 02E90841
  call dword ptr [eax + 0x1c] // 02E90843
  mov eax, dword ptr [ebx] // 02E90846
  push #1 // 02E90848
  push #6 // 02E9084A
  push #1 // 02E9084C
  push ebx // 02E9084E
  call dword ptr [eax + 0x114] // 02E9084F
  mov eax, dword ptr [ebx] // 02E90855
  push #1 // 02E90857
  push #5 // 02E90859
  push #1 // 02E9085B
  push ebx // 02E9085D
  call dword ptr [eax + 0x114] // 02E9085E
  mov eax, dword ptr [ebx] // 02E90864
  push #0 // 02E90866
  push #7 // 02E90868
  push #1 // 02E9086A
  push ebx // 02E9086C
  call dword ptr [eax + 0x114] // 02E9086D
  xor eax, eax // 02E90873
  lea edx, [ebp - 0x44] // 02E90875
  mov dword ptr [ebp - 0x44], eax // 02E90878
  mov eax, dword ptr [ebx] // 02E9087B
  push edx // 02E9087D
  push #1 // 02E9087E
  push ebx // 02E90880
  call dword ptr [eax + 0x100] // 02E90881
  test eax, eax // 02E90887
  mov eax, dword ptr [ebp - 0x44] // 02E90889
  mov dword ptr [darkness_orb_state+30], eax // 02E9088C
  jns short fps_loc_02E9089D // 02E90891
fps_loc_02E90893:
  mov edi, #1 // 02E90893
  jmp near fps_loc_02E907BE // 02E90898
fps_loc_02E9089D:
  test eax, eax // 02E9089D
  je short fps_loc_02E90893 // 02E9089F
  mov edx, dword ptr [eax] // 02E908A1
  push eax // 02E908A3
  call dword ptr [edx + #8] // 02E908A4
  mov eax, dword ptr [ebx] // 02E908A7
  push esi // 02E908A9
  push ebx // 02E908AA
  call dword ptr [eax + 0x1ac] // 02E908AB
  mov dword ptr [darkness_orb_state+24], eax // 02E908B1
  test eax, eax // 02E908B6
  js short fps_loc_02E90893 // 02E908B8
  inc dword ptr [darkness_orb_state+10] // 02E908BA
  mov edi, #1 // 02E908C0
  jmp near fps_loc_02E907C6 // 02E908C5
fps_loc_02E908CA:
  lea esp, [ebp - 0xc] // 02E908CA
  pop ebx // 02E908CD
  pop esi // 02E908CE
  pop edi // 02E908CF
  pop ebp // 02E908D0
  ret // 02E908D1
  nop // 02E908D2
  nop // 02E908D3

// Select bank-1 category-28 exact release-orb rectangle, neutralize RGB to max channel, and forward other submissions to common selector.
fps_orb_text_submit3:
  inc dword ptr [fps_orb_data_state] // 02E908D4
  cmp dword ptr [TOS.exe+720268], 0xd000001 // 02E908DA
  jne near fps_loc_02E90A76 // 02E908E4
  inc dword ptr [darkness_orb_state+4] // 02E908EA
  mov eax, dword ptr [TOS.exe+72026C] // 02E908F0
  mov dword ptr [darkness_orb_state+38], eax // 02E908F5
  mov eax, dword ptr [TOS.exe+72026C] // 02E908FA
  cmp dword ptr [TOS.exe+720268], 0xd000001 // 02E908FF
  jne near fps_loc_02E90A76 // 02E90909
  shr eax, #4 // 02E9090F
  cmp eax, 0x1c // 02E90912
  jne near fps_loc_02E90A76 // 02E90915
  cmp dword ptr [ecx], TOS.exe+4789B8 // 02E9091B
  jne near fps_loc_02E90A76 // 02E90921
  fld1 // 02E90927
  xor eax, eax // 02E90929
  fchs // 02E9092B
  fld dword ptr [fps_orb_rdata] // 02E9092D
  fld st(1) // 02E90933
  fld st(1) // 02E90935
fps_loc_02E90937:
  fldz // 02E90937
  fld dword ptr [ecx + eax*#8 + 0xa4] // 02E90939
  fcomi st(1) // 02E90940
  jb near fps_loc_02E90A2A // 02E90942
  fld1 // 02E90948
  fcomi st(1) // 02E9094A
  jb near fps_loc_02E90A38 // 02E9094C
  fld dword ptr [ecx + eax*#8 + 0xa8] // 02E90952
  fcomi st(3) // 02E90959
  fstp st(3) // 02E9095B
  jb near fps_loc_02E90A48 // 02E9095D
  fcomip st(2) // 02E90963
  jb near fps_loc_02E90A58 // 02E90965
  fxch st(2) // 02E9096B
  fcomi st(2) // 02E9096D
  fcmovnbe st(2) // 02E9096F
  fxch st(2) // 02E90971
  fcomi st(3) // 02E90973
  fcmovbe st(3) // 02E90975
  fstp st(3) // 02E90977
  fxch st(3) // 02E90979
  fcomi st(3) // 02E9097B
  fcmovnbe st(3) // 02E9097D
  fxch st(3) // 02E9097F
  fcomi st(4) // 02E90981
  fcmovbe st(4) // 02E90983
  fstp st(4) // 02E90985
  inc eax // 02E90987
  cmp eax, #4 // 02E90988
  jne short fps_loc_02E90937 // 02E9098B
  fld dword ptr [fps_orb_rdata+4] // 02E9098D
  mov al, #0 // 02E90993
  fucomip st(1) // 02E90995
  fstp st(0) // 02E90997
  setnp dl // 02E90999
  cmovne edx, eax // 02E9099C
  test dl, dl // 02E9099F
  je near fps_loc_02E90A66 // 02E909A1
  fld dword ptr [fps_orb_rdata+8] // 02E909A7
  fucomip st(1) // 02E909AD
  fstp st(0) // 02E909AF
  setnp dl // 02E909B1
  cmovne edx, eax // 02E909B4
  test dl, dl // 02E909B7
  je near fps_loc_02E90A6E // 02E909B9
  fld dword ptr [fps_orb_rdata+C] // 02E909BF
  fucomip st(1) // 02E909C5
  fstp st(0) // 02E909C7
  setnp dl // 02E909C9
  cmovne edx, eax // 02E909CC
  test dl, dl // 02E909CF
  je near fps_loc_02E90A74 // 02E909D1
  fld dword ptr [fps_orb_rdata+10] // 02E909D7
  fucomip st(1) // 02E909DD
  fstp st(0) // 02E909DF
  setnp dl // 02E909E1
  cmove eax, edx // 02E909E4
  test al, al // 02E909E7
  je near fps_loc_02E90A76 // 02E909E9
  inc dword ptr [darkness_orb_state+8] // 02E909EF
  lea edx, [ecx + 0xa4] // 02E909F5
  lea eax, [ecx + 0x64] // 02E909FB
  mov dword ptr [ecx], fps_orb_vt3 // 02E909FE
fps_loc_02E90A04:
  fld dword ptr [eax] // 02E90A04
  fld dword ptr [eax + #4] // 02E90A06
  fcomi st(1) // 02E90A09
  fcmovbe st(1) // 02E90A0B
  fstp st(1) // 02E90A0D
  fld dword ptr [eax + #8] // 02E90A0F
  fcomi st(1) // 02E90A12
  fcmovbe st(1) // 02E90A14
  fstp st(1) // 02E90A16
  add eax, 0x10 // 02E90A18
  fst dword ptr [eax - #8] // 02E90A1B
  fst dword ptr [eax - 0xc] // 02E90A1E
  fstp dword ptr [eax - 0x10] // 02E90A21
  cmp edx, eax // 02E90A24
  jne short fps_loc_02E90A04 // 02E90A26
  jmp short fps_loc_02E90A76 // 02E90A28
fps_loc_02E90A2A:
  fstp st(0) // 02E90A2A
  fstp st(0) // 02E90A2C
  fstp st(0) // 02E90A2E
  fstp st(0) // 02E90A30
  fstp st(0) // 02E90A32
  fstp st(0) // 02E90A34
  jmp short fps_loc_02E90A76 // 02E90A36
fps_loc_02E90A38:
  fstp st(0) // 02E90A38
  fstp st(0) // 02E90A3A
  fstp st(0) // 02E90A3C
  fstp st(0) // 02E90A3E
  fstp st(0) // 02E90A40
  fstp st(0) // 02E90A42
  fstp st(0) // 02E90A44
  jmp short fps_loc_02E90A76 // 02E90A46
fps_loc_02E90A48:
  fstp st(0) // 02E90A48
  fstp st(0) // 02E90A4A
  fstp st(0) // 02E90A4C
  fstp st(0) // 02E90A4E
  fstp st(0) // 02E90A50
  fstp st(0) // 02E90A52
  fstp st(0) // 02E90A54
  jmp short fps_loc_02E90A76 // 02E90A56
fps_loc_02E90A58:
  fstp st(0) // 02E90A58
  fstp st(0) // 02E90A5A
  fstp st(0) // 02E90A5C
  fstp st(0) // 02E90A5E
  fstp st(0) // 02E90A60
  fstp st(0) // 02E90A62
  jmp short fps_loc_02E90A76 // 02E90A64
fps_loc_02E90A66:
  fstp st(0) // 02E90A66
  fstp st(0) // 02E90A68
  fstp st(0) // 02E90A6A
  jmp short fps_loc_02E90A76 // 02E90A6C
fps_loc_02E90A6E:
  fstp st(0) // 02E90A6E
  fstp st(0) // 02E90A70
  jmp short fps_loc_02E90A76 // 02E90A72
fps_loc_02E90A74:
  fstp st(0) // 02E90A74
fps_loc_02E90A76:
  mov eax, fps_darkness_text_submit3 // 02E90A76
  jmp eax // 02E90A7B
  nop // 02E90A7D
  nop // 02E90A7E
  nop // 02E90A7F

// Nine-entry 3D orb vtable; includes native bounds method in slot 8.
fps_orb_vt3:
  dd TOS.exe+186B20 // 02E90A80: vtable callback
  dd TOS.exe+188630 // 02E90A84: vtable callback
  dd TOS.exe+1873D0 // 02E90A88: vtable callback
  dd TOS.exe+1874C0 // 02E90A8C: vtable callback
  dd TOS.exe+187510 // 02E90A90: vtable callback
  dd TOS.exe+187360 // 02E90A94: vtable callback
  dd fps_orb_text_execute3 // 02E90A98: vtable callback
  dd fps_orb_text_clone3 // 02E90A9C: vtable callback
  dd TOS.exe+1872E0 // 02E90AA0: vtable callback
  db 00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00 // 02E90AA4: constants / retained padding
  db 00,00,00,00,00,00,00,00,00,00,00,00 // 02E90AB4: constants / retained padding

// Corrected nine-entry common Darkness 3D vtable; callbacks reach the common helper allocation.
fps_orb_commonvt3:
  dd TOS.exe+186B20 // 02E90AC0: vtable callback
  dd TOS.exe+188630 // 02E90AC4: vtable callback
  dd TOS.exe+1873D0 // 02E90AC8: vtable callback
  dd TOS.exe+1874C0 // 02E90ACC: vtable callback
  dd TOS.exe+187510 // 02E90AD0: vtable callback
  dd TOS.exe+187360 // 02E90AD4: vtable callback
  dd fps_darkness_text_execute3 // 02E90AD8: vtable callback
  dd fps_darkness_text_clone3 // 02E90ADC: vtable callback
  dd TOS.exe+1872E0 // 02E90AE0: vtable callback
  db 00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00 // 02E90AE4: constants / retained padding
  db 00,00,00,00,00,00,00,00,00,00,00,00 // 02E90AF4: constants / retained padding

// Floating-point UV classifier and sample constants; never interpret as code.
fps_orb_rdata:
  db 00,00,00,40,00,00,41,3E,00,00,7F,3E,00,00,C1,3E // 02E90B00: constants / retained padding
  db 00,00,FF,3E // 02E90B10: constants / retained padding

// Compiler identification string retained from reference binary.
fps_orb_rdata_zzz:
  db 47,43,43,3A,20,28,47,4E,55,29,20,31,36,2E,32,2E // 02E90B14: constants / retained padding
  db 30,00,00,00 // 02E90B24: constants / retained padding

// Immutable 15-DWORD ps_3_0 shader tail plus four padding bytes; DWORD shader register tokens are not executable addresses.
fps_orb_data:
  db 01,00,00,02,1E,00,0F,80,DF,00,E4,A0,5F,00,00,03 // 02E90B28: constants / retained padding
  db 1E,00,0F,80,1E,00,E4,80,01,08,E4,A0,05,00,00,03 // 02E90B38: constants / retained padding
  db 1F,00,07,80,1F,00,E4,80,1E,00,E4,80,01,00,00,02 // 02E90B48: constants / retained padding
  db 00,08,0F,80,1F,00,E4,80,FF,FF,00,00,00,00,00,00 // 02E90B58: constants / retained padding

// ----------------------------------------------------------------------
// Reference payload 02E94020..02E9502B; retained code/data/padding.
fps_darkness_rendering_code+A70:
// Classify still-white E/F/G/H/I atlas rectangles after normal UV remapping.
fps_darkness_text_dark_family:
  fld1 // 02E94020
  mov edx, eax // 02E94022
  xor eax, eax // 02E94024
  fchs // 02E94026
  fld st(0) // 02E94028
  fld dword ptr [fps_darkness_rdata] // 02E9402A
  fld st(0) // 02E94030
  jmp short fps_loc_02E9403A // 02E94032
fps_loc_02E94034:
  fstp st(2) // 02E94034
  fstp st(0) // 02E94036
  fxch st(1) // 02E94038
fps_loc_02E9403A:
  fld dword ptr [fps_darkness_rdata+4] // 02E9403A
  fld dword ptr [edx + eax*#8] // 02E94040
  fmul st(0), st(1) // 02E94043
  fldz // 02E94045
  fxch st(1) // 02E94047
  fcomi st(1) // 02E94049
  jae near fps_loc_02E94144 // 02E9404B
  fstp st(0) // 02E94051
  fstp st(0) // 02E94053
  fstp st(0) // 02E94055
  fstp st(0) // 02E94057
  fstp st(0) // 02E94059
  fstp st(0) // 02E9405B
  fstp st(0) // 02E9405D
  jmp near fps_loc_02E94141 // 02E9405F
fps_loc_02E94064:
  fstp st(0) // 02E94064
  fstp st(0) // 02E94066
  fstp st(0) // 02E94068
  fstp st(0) // 02E9406A
  fstp st(0) // 02E9406C
  fstp st(0) // 02E9406E
  fstp st(0) // 02E94070
  jmp near fps_loc_02E94141 // 02E94072
fps_loc_02E94077:
  fstp st(0) // 02E94077
  fstp st(0) // 02E94079
  fstp st(0) // 02E9407B
  fstp st(0) // 02E9407D
  fstp st(0) // 02E9407F
  fstp st(0) // 02E94081
  fstp st(0) // 02E94083
  jmp near fps_loc_02E94141 // 02E94085
fps_loc_02E9408A:
  fstp st(0) // 02E9408A
  fstp st(0) // 02E9408C
  fstp st(0) // 02E9408E
  fstp st(0) // 02E94090
  fstp st(0) // 02E94092
  fstp st(0) // 02E94094
  jmp near fps_loc_02E94141 // 02E94096
fps_loc_02E9409B:
  fstp st(0) // 02E9409B
  fstp st(0) // 02E9409D
  fstp st(0) // 02E9409F
  fstp st(0) // 02E940A1
  fstp st(0) // 02E940A3
  fstp st(0) // 02E940A5
  jmp near fps_loc_02E94141 // 02E940A7
fps_loc_02E940AC:
  fstp st(0) // 02E940AC
  fstp st(0) // 02E940AE
  fstp st(0) // 02E940B0
  fstp st(0) // 02E940B2
  fstp st(0) // 02E940B4
  fstp st(0) // 02E940B6
  jmp near fps_loc_02E94141 // 02E940B8
fps_loc_02E940BD:
  fstp st(0) // 02E940BD
  fstp st(0) // 02E940BF
  fstp st(0) // 02E940C1
  jmp short fps_loc_02E94141 // 02E940C3
fps_loc_02E940C5:
  fstp st(0) // 02E940C5
  fstp st(0) // 02E940C7
  jmp short fps_loc_02E94141 // 02E940C9
fps_loc_02E940CB:
  fstp st(0) // 02E940CB
  jmp short fps_loc_02E94141 // 02E940CD
fps_loc_02E940CF:
  fstp st(0) // 02E940CF
  fstp st(0) // 02E940D1
  fstp st(0) // 02E940D3
  fstp st(0) // 02E940D5
  fstp st(0) // 02E940D7
  jmp short fps_loc_02E94141 // 02E940D9
fps_loc_02E940DB:
  fstp st(0) // 02E940DB
  fstp st(0) // 02E940DD
  fstp st(0) // 02E940DF
  fstp st(0) // 02E940E1
  fstp st(0) // 02E940E3
  jmp short fps_loc_02E94141 // 02E940E5
fps_loc_02E940E7:
  fstp st(0) // 02E940E7
  fstp st(0) // 02E940E9
  fstp st(0) // 02E940EB
  fstp st(0) // 02E940ED
  fstp st(0) // 02E940EF
  fstp st(0) // 02E940F1
  jmp short fps_loc_02E94141 // 02E940F3
fps_loc_02E940F5:
  fstp st(0) // 02E940F5
  fstp st(0) // 02E940F7
  fstp st(0) // 02E940F9
  fstp st(0) // 02E940FB
  fstp st(0) // 02E940FD
  fstp st(0) // 02E940FF
  jmp short fps_loc_02E94141 // 02E94101
fps_loc_02E94103:
  fstp st(0) // 02E94103
  fstp st(0) // 02E94105
  fstp st(0) // 02E94107
  fstp st(0) // 02E94109
  fstp st(0) // 02E9410B
  fstp st(0) // 02E9410D
  jmp short fps_loc_02E94141 // 02E9410F
fps_loc_02E94111:
  fstp st(0) // 02E94111
  fstp st(0) // 02E94113
  fstp st(0) // 02E94115
  fstp st(0) // 02E94117
  jmp short fps_loc_02E94141 // 02E94119
fps_loc_02E9411B:
  fstp st(0) // 02E9411B
  jmp short fps_loc_02E94141 // 02E9411D
fps_loc_02E9411F:
  fstp st(0) // 02E9411F
  fstp st(0) // 02E94121
  fstp st(0) // 02E94123
  fstp st(0) // 02E94125
  jmp short fps_loc_02E94141 // 02E94127
fps_loc_02E94129:
  fstp st(0) // 02E94129
  fstp st(0) // 02E9412B
  fstp st(0) // 02E9412D
  jmp short fps_loc_02E94141 // 02E9412F
fps_loc_02E94131:
  fstp st(0) // 02E94131
  fstp st(0) // 02E94133
  fstp st(0) // 02E94135
  jmp short fps_loc_02E94141 // 02E94137
fps_loc_02E94139:
  fstp st(0) // 02E94139
  fstp st(0) // 02E9413B
  jmp short fps_loc_02E94141 // 02E9413D
fps_loc_02E9413F:
  fstp st(0) // 02E9413F
fps_loc_02E94141:
  xor eax, eax // 02E94141
  ret // 02E94143
fps_loc_02E94144:
  fxch st(2) // 02E94144
  fcomi st(2) // 02E94146
  jb near fps_loc_02E94064 // 02E94148
  fld dword ptr [edx + eax*#8 + #4] // 02E9414E
  fmul st(0), st(1) // 02E94152
  fcomi st(2) // 02E94154
  fstp st(2) // 02E94156
  jb near fps_loc_02E94077 // 02E94158
  fcomip st(1) // 02E9415E
  jb near fps_loc_02E9408A // 02E94160
  fxch st(2) // 02E94166
  fcomi st(1) // 02E94168
  fcmovnbe st(1) // 02E9416A
  fld st(0) // 02E9416C
  fxch st(2) // 02E9416E
  fcomi st(5) // 02E94170
  fcmovbe st(5) // 02E94172
  fstp st(5) // 02E94174
  fxch st(3) // 02E94176
  fcomi st(2) // 02E94178
  fcmovnbe st(2) // 02E9417A
  fld st(0) // 02E9417C
  fxch st(3) // 02E9417E
  fcomi st(6) // 02E94180
  fcmovbe st(6) // 02E94182
  fstp st(6) // 02E94184
  inc eax // 02E94186
  cmp eax, #4 // 02E94187
  jne near fps_loc_02E94034 // 02E9418A
  fxch st(3) // 02E94190
  fcomi st(4) // 02E94192
  jae near fps_loc_02E9409B // 02E94194
  fxch st(3) // 02E9419A
  fcomi st(5) // 02E9419C
  jae near fps_loc_02E940AC // 02E9419E
  fld dword ptr [fps_darkness_rdata+8] // 02E941A4
  fxch st(1) // 02E941AA
  fcomi st(1) // 02E941AC
  fstp st(1) // 02E941AE
  jb short fps_loc_02E94206 // 02E941B0
  fstp st(0) // 02E941B2
  fstp st(0) // 02E941B4
  fld dword ptr [fps_darkness_rdata+C] // 02E941B6
  fcomip st(1) // 02E941BC
  jb near fps_loc_02E942A3 // 02E941BE
  fstp st(0) // 02E941C4
  fld dword ptr [fps_darkness_rdata+10] // 02E941C6
  fxch st(3) // 02E941CC
  fcomi st(3) // 02E941CE
  fstp st(3) // 02E941D0
  jb near fps_loc_02E940BD // 02E941D2
  fld dword ptr [fps_darkness_rdata+14] // 02E941D8
  fcomip st(3) // 02E941DE
  fstp st(2) // 02E941E0
  jb near fps_loc_02E940C5 // 02E941E2
  fldz // 02E941E8
  fxch st(2) // 02E941EA
  fcomip st(2) // 02E941EC
  fstp st(1) // 02E941EE
  jb near fps_loc_02E940CB // 02E941F0
  fld dword ptr [fps_darkness_rdata+18] // 02E941F6
  xor eax, eax // 02E941FC
  fcomip st(1) // 02E941FE
  fstp st(0) // 02E94200
  setae al // 02E94202
  ret // 02E94205
fps_loc_02E94206:
  fstp st(2) // 02E94206
  fstp st(2) // 02E94208
  fld dword ptr [fps_darkness_rdata+1C] // 02E9420A
  fxch st(1) // 02E94210
  fcomi st(1) // 02E94212
  jb near fps_loc_02E940CF // 02E94214
  fld dword ptr [fps_darkness_rdata+20] // 02E9421A
  fcomi st(1) // 02E94220
  fstp st(1) // 02E94222
  jb near fps_loc_02E940DB // 02E94224
  fld dword ptr [fps_darkness_rdata+24] // 02E9422A
  fxch st(5) // 02E94230
  fcomi st(5) // 02E94232
  jb near fps_loc_02E940E7 // 02E94234
  fld dword ptr [fps_darkness_rdata+28] // 02E9423A
  fcomi st(1) // 02E94240
  fstp st(1) // 02E94242
  jb near fps_loc_02E940F5 // 02E94244
  fld dword ptr [fps_darkness_rdata+2C] // 02E9424A
  fxch st(4) // 02E94250
  fcomi st(4) // 02E94252
  fstp st(4) // 02E94254
  jb near fps_loc_02E94103 // 02E94256
  fxch st(1) // 02E9425C
  fcomip st(4) // 02E9425E
  mov eax, #2 // 02E94260
  jae near fps_loc_02E9430C // 02E94265
  fxch st(2) // 02E9426B
  fcomi st(1) // 02E9426D
  fstp st(1) // 02E9426F
  jb near fps_loc_02E94111 // 02E94271
  fxch st(1) // 02E94277
  fcomip st(2) // 02E94279
  mov eax, #3 // 02E9427B
  jae near fps_loc_02E94318 // 02E94280
  fcomip st(2) // 02E94286
  fstp st(1) // 02E94288
  jb near fps_loc_02E9411B // 02E9428A
  fld dword ptr [fps_darkness_rdata+30] // 02E94290
  xor eax, eax // 02E94296
  fcomip st(1) // 02E94298
  fstp st(0) // 02E9429A
  setae al // 02E9429C
  shl eax, #2 // 02E9429F
  ret // 02E942A2
fps_loc_02E942A3:
  fld dword ptr [fps_darkness_rdata+24] // 02E942A3
  fxch st(1) // 02E942A9
  fcomi st(1) // 02E942AB
  fstp st(1) // 02E942AD
  jb near fps_loc_02E9411F // 02E942AF
  fld dword ptr [fps_darkness_rdata+28] // 02E942B5
  fcomip st(1) // 02E942BB
  fstp st(0) // 02E942BD
  jb near fps_loc_02E94129 // 02E942BF
  fld dword ptr [fps_darkness_rdata+34] // 02E942C5
  fxch st(3) // 02E942CB
  fcomi st(3) // 02E942CD
  fstp st(3) // 02E942CF
  jb near fps_loc_02E94131 // 02E942D1
  fld dword ptr [fps_darkness_rdata+30] // 02E942D7
  fcomip st(3) // 02E942DD
  fstp st(2) // 02E942DF
  jb near fps_loc_02E94139 // 02E942E1
  fld dword ptr [fps_darkness_rdata+2C] // 02E942E7
  fxch st(2) // 02E942ED
  fcomip st(2) // 02E942EF
  fstp st(1) // 02E942F1
  jb near fps_loc_02E9413F // 02E942F3
  fld dword ptr [fps_darkness_rdata+38] // 02E942F9
  fcomip st(1) // 02E942FF
  fstp st(0) // 02E94301
  sbb eax, eax // 02E94303
  not eax // 02E94305
  and eax, #5 // 02E94307
  jmp short fps_loc_02E9431E // 02E9430A
fps_loc_02E9430C:
  fstp st(0) // 02E9430C
  fstp st(0) // 02E9430E
  fstp st(0) // 02E94310
  fstp st(0) // 02E94312
  fstp st(0) // 02E94314
  jmp short fps_loc_02E9431E // 02E94316
fps_loc_02E94318:
  fstp st(0) // 02E94318
  fstp st(0) // 02E9431A
  fstp st(0) // 02E9431C
fps_loc_02E9431E:
  ret // 02E9431E
  nop // 02E9431F

// Clone the native 2D command then restore the specialized vtable.
fps_darkness_text_clone2:
  push ebp // 02E94320
  mov eax, TOS.exe+185710 // 02E94321
  mov ebp, esp // 02E94326
  call eax // 02E94328
  test eax, eax // 02E9432A
  je short fps_loc_02E9433A // 02E9432C
  mov dword ptr [eax], fps_darkness_vt2 // 02E9432E
  inc dword ptr [darkness_shader_state+20] // 02E94334
fps_loc_02E9433A:
  pop ebp // 02E9433A
  ret // 02E9433B

// Clone the native 3D command then restore the specialized vtable.
fps_darkness_text_clone3:
  push ebp // 02E9433C
  mov eax, TOS.exe+187660 // 02E9433D
  mov ebp, esp // 02E94342
  call eax // 02E94344
  test eax, eax // 02E94346
  je short fps_loc_02E94356 // 02E94348
  mov dword ptr [eax], fps_orb_commonvt3 // 02E9434A
  inc dword ptr [darkness_shader_state+20] // 02E94350
fps_loc_02E94356:
  pop ebp // 02E94356
  ret // 02E94357

// Bounded diagnostic counters and up to eight observed texture/UV combinations.
fps_darkness_text_observe:
  inc dword ptr [darkness_shader_state+8A4] // 02E94358
  mov ecx, eax // 02E9435E
  mov eax, dword ptr [TOS.exe+72026C] // 02E94360
  shr eax, #4 // 02E94365
  cmp eax, 0xe // 02E94368
  jne near fps_loc_02E94430 // 02E9436B
  inc dword ptr [darkness_shader_state+8A8] // 02E94371
  mov eax, dword ptr [ecx] // 02E94377
  cmp eax, TOS.exe+4789B8 // 02E94379
  je short fps_loc_02E9438B // 02E9437E
  cmp eax, TOS.exe+474370 // 02E94380
  jne near fps_loc_02E94430 // 02E94385
fps_loc_02E9438B:
  push ebp // 02E9438B
  xor eax, eax // 02E9438C
  mov ebp, esp // 02E9438E
  push edi // 02E94390
  push esi // 02E94391
  mov esi, dword ptr [darkness_shader_state+8AC] // 02E94392
  push ebx // 02E94398
fps_loc_02E94399:
  cmp esi, eax // 02E94399
  je short fps_loc_02E943DD // 02E9439B
  imul ebx, eax, 0x2c // 02E9439D
  mov edi, dword ptr [TOS.exe+720268] // 02E943A0
  cmp dword ptr [ebx + darkness_shader_state+8B4], edi // 02E943A6
  jne short fps_loc_02E943DA // 02E943AC
  fld dword ptr [ebx + darkness_shader_state+8BC] // 02E943AE
  fld dword ptr [ecx + 0xa4] // 02E943B4
  fxch st(1) // 02E943BA
  fucomip st(1) // 02E943BC
  fstp st(0) // 02E943BE
  jp short fps_loc_02E943DA // 02E943C0
  jne short fps_loc_02E943DA // 02E943C2
  fld dword ptr [ebx + darkness_shader_state+8C0] // 02E943C4
  fld dword ptr [ecx + 0xa8] // 02E943CA
  fxch st(1) // 02E943D0
  fucomip st(1) // 02E943D2
  fstp st(0) // 02E943D4
  jp short fps_loc_02E943DA // 02E943D6
  je short fps_loc_02E9442B // 02E943D8
fps_loc_02E943DA:
  inc eax // 02E943DA
  jmp short fps_loc_02E94399 // 02E943DB
fps_loc_02E943DD:
  cmp eax, #8 // 02E943DD
  je short fps_loc_02E9442B // 02E943E0
  imul edx, eax, 0x2c // 02E943E2
  mov ebx, dword ptr [TOS.exe+72026C] // 02E943E5
  imul esi, eax, 0xb // 02E943EB
  mov dword ptr [edx + darkness_shader_state+8B0], ebx // 02E943EE
  mov ebx, dword ptr [TOS.exe+720268] // 02E943F4
  mov dword ptr [edx + darkness_shader_state+8B4], ebx // 02E943FA
  mov ebx, dword ptr [ecx] // 02E94400
  mov dword ptr [edx + darkness_shader_state+8B8], ebx // 02E94402
  xor edx, edx // 02E94408
fps_loc_02E9440A:
  fld dword ptr [ecx + edx*#4 + 0xa4] // 02E9440A
  lea ebx, [edx + esi + 0x22c] // 02E94411
  inc edx // 02E94418
  fstp dword ptr [ebx*#4 + darkness_shader_state+C] // 02E94419
  cmp edx, #8 // 02E94420
  jne short fps_loc_02E9440A // 02E94423
  inc eax // 02E94425
  mov dword ptr [darkness_shader_state+8AC], eax // 02E94426
fps_loc_02E9442B:
  pop ebx // 02E9442B
  pop esi // 02E9442C
  pop edi // 02E9442D
  pop ebp // 02E9442E
  ret // 02E9442F
fps_loc_02E94430:
  ret // 02E94430
  nop // 02E94431
  nop // 02E94432
  nop // 02E94433

// Replace only the expected newly queued indexed draw callback.
fps_darkness_text_tag:
  mov edx, dword ptr [TOS.exe+19B9BCC] // 02E94434
  lea ecx, [edx - 0x20] // 02E9443A
  cmp ecx, eax // 02E9443D
  jne short fps_loc_02E9445F // 02E9443F
  cmp dword ptr [eax], TOS.exe+1D6EC0 // 02E94441
  jne short fps_loc_02E9445F // 02E94447
  cmp dword ptr [edx - 0x1c], TOS.exe+1CF250 // 02E94449
  jne short fps_loc_02E9445F // 02E94450
  mov dword ptr [edx - 0x1c], fps_darkness_text_draw // 02E94452
  inc dword ptr [darkness_shader_state+24] // 02E94459
fps_loc_02E9445F:
  ret // 02E9445F

// Call native 2D execution and tag the queued indexed draw.
fps_darkness_text_execute2:
  push ebp // 02E94460
  mov eax, TOS.exe+185700 // 02E94461
  mov ebp, esp // 02E94466
  call eax // 02E94468
  pop ebp // 02E9446A
  jmp near fps_darkness_text_tag // 02E9446B

// Call native 3D execution and tag the queued indexed draw.
fps_darkness_text_execute3:
  push ebp // 02E94470
  mov eax, TOS.exe+187650 // 02E94471
  mov ebp, esp // 02E94476
  call eax // 02E94478
  pop ebp // 02E9447A
  jmp near fps_darkness_text_tag // 02E9447B

// Cache up to eight device/original-shader pairs; transform supported bytecode; release evicted COM references.
fps_darkness_text_variant:
  push ebp // 02E94480
  mov ebp, esp // 02E94481
  push edi // 02E94483
  mov edi, eax // 02E94484
  xor eax, eax // 02E94486
  push esi // 02E94488
  mov esi, edx // 02E94489
  push ebx // 02E9448B
  sub esp, 0x105c // 02E9448C
  mov dword ptr [ebp - 0x1068], 0x800 // 02E94492
fps_loc_02E9449C:
  imul ecx, eax, 0xc // 02E9449C
  cmp dword ptr [ecx + darkness_shader_state+840], edi // 02E9449F
  jne short fps_loc_02E944BA // 02E944A5
  cmp dword ptr [ecx + darkness_shader_state+844], esi // 02E944A7
  jne short fps_loc_02E944BA // 02E944AD
  mov eax, dword ptr [ecx + darkness_shader_state+848] // 02E944AF
  jmp near fps_loc_02E94657 // 02E944B5
fps_loc_02E944BA:
  inc eax // 02E944BA
  cmp eax, #8 // 02E944BB
  jne short fps_loc_02E9449C // 02E944BE
  inc dword ptr [darkness_shader_state+28] // 02E944C0
  mov ebx, dword ptr [darkness_shader_state+8A0] // 02E944C6
  lea eax, [ebx + #1] // 02E944CC
  and ebx, #7 // 02E944CF
  imul edx, ebx, 0xc // 02E944D2
  mov dword ptr [darkness_shader_state+8A0], eax // 02E944D5
  lea eax, [edx + fps_darkness_data_state] // 02E944DA
  cmp dword ptr [edx + darkness_shader_state+848], #0 // 02E944E0
  je short fps_loc_02E944FA // 02E944E7
  mov edx, dword ptr [edx + darkness_shader_state+848] // 02E944E9
  mov edx, dword ptr [edx] // 02E944EF
  push dword ptr [eax + 0x848] // 02E944F1
  call dword ptr [edx + #8] // 02E944F7
fps_loc_02E944FA:
  imul edx, ebx, 0xc // 02E944FA
  lea eax, [edx + fps_darkness_data_state] // 02E944FD
  cmp dword ptr [edx + darkness_shader_state+844], #0 // 02E94503
  je short fps_loc_02E9451D // 02E9450A
  mov edx, dword ptr [edx + darkness_shader_state+844] // 02E9450C
  mov edx, dword ptr [edx] // 02E94512
  push dword ptr [eax + 0x844] // 02E94514
  call dword ptr [edx + #8] // 02E9451A
fps_loc_02E9451D:
  imul edx, ebx, 0xc // 02E9451D
  lea eax, [edx + fps_darkness_data_state] // 02E94520
  cmp dword ptr [edx + darkness_shader_state+840], #0 // 02E94526
  je short fps_loc_02E94540 // 02E9452D
  mov edx, dword ptr [edx + darkness_shader_state+840] // 02E9452F
  mov edx, dword ptr [edx] // 02E94535
  push dword ptr [eax + 0x840] // 02E94537
  call dword ptr [edx + #8] // 02E9453D
fps_loc_02E94540:
  imul eax, ebx, 0xc // 02E94540
  xor edx, edx // 02E94543
  mov dword ptr [eax + darkness_shader_state+840], edi // 02E94545
  mov dword ptr [eax + darkness_shader_state+844], esi // 02E9454B
  mov dword ptr [eax + darkness_shader_state+848], edx // 02E94551
  mov eax, dword ptr [edi] // 02E94557
  push edi // 02E94559
  call dword ptr [eax + #4] // 02E9455A
  mov eax, dword ptr [esi] // 02E9455D
  push esi // 02E9455F
  call dword ptr [eax + #4] // 02E94560
  mov eax, dword ptr [esi] // 02E94563
  lea edx, [ebp - 0x1068] // 02E94565
  push edx // 02E9456B
  push #0 // 02E9456C
  push esi // 02E9456E
  call dword ptr [eax + 0x10] // 02E9456F
  mov dword ptr [darkness_shader_state+2C], eax // 02E94572
  test eax, eax // 02E94577
  js short fps_loc_02E945BE // 02E94579
  mov eax, dword ptr [ebp - 0x1068] // 02E9457B
  cmp eax, 0x800 // 02E94581
  ja short fps_loc_02E945BE // 02E94586
  test al, #3 // 02E94588
  lea edx, [ebp - 0x1068] // 02E9458A
  jne short fps_loc_02E945BE // 02E94590
  mov eax, dword ptr [esi] // 02E94592
  push edx // 02E94594
  lea edx, [ebp - 0x1060] // 02E94595
  push edx // 02E9459B
  push esi // 02E9459C
  call dword ptr [eax + 0x10] // 02E9459D
  mov dword ptr [darkness_shader_state+2C], eax // 02E945A0
  test eax, eax // 02E945A5
  js short fps_loc_02E945BE // 02E945A7
  mov edx, dword ptr [ebp - 0x1068] // 02E945A9
  cmp edx, 0x800 // 02E945AF
  ja short fps_loc_02E945BE // 02E945B5
  mov eax, edx // 02E945B7
  and eax, #3 // 02E945B9
  je short fps_loc_02E945CF // 02E945BC
fps_loc_02E945BE:
  mov dword ptr [darkness_shader_state+30], #1 // 02E945BE
fps_loc_02E945C8:
  xor eax, eax // 02E945C8
  jmp near fps_loc_02E94657 // 02E945CA
fps_loc_02E945CF:
  shr edx, #2 // 02E945CF
  mov dword ptr [darkness_shader_state+3C], edx // 02E945D2
fps_loc_02E945D8:
  cmp edx, eax // 02E945D8
  lea esi, [ebp - 0x1060] // 02E945DA
  je short fps_loc_02E945EF // 02E945E0
  mov ecx, dword ptr [esi + eax*#4] // 02E945E2
  mov dword ptr [eax*#4 + darkness_shader_state+40], ecx // 02E945E5
  inc eax // 02E945EC
  jmp short fps_loc_02E945D8 // 02E945ED
fps_loc_02E945EF:
  lea ecx, [ebp - 0x860] // 02E945EF
  mov eax, esi // 02E945F5
  call fps_darkness_text_dark_transform_constprop_0 // 02E945F7
  lea ecx, [ebp - 0x860] // 02E945FC
  test eax, eax // 02E94602
  jne short fps_loc_02E94612 // 02E94604
  mov dword ptr [darkness_shader_state+30], #2 // 02E94606
  jmp short fps_loc_02E945C8 // 02E94610
fps_loc_02E94612:
  mov eax, dword ptr [edi] // 02E94612
  lea edx, [ebp - 0x1064] // 02E94614
  xor esi, esi // 02E9461A
  mov dword ptr [ebp - 0x1064], esi // 02E9461C
  push edx // 02E94622
  push ecx // 02E94623
  push edi // 02E94624
  call dword ptr [eax + 0x1a8] // 02E94625
  mov dword ptr [darkness_shader_state+2C], eax // 02E9462B
  test eax, eax // 02E94630
  jns short fps_loc_02E94640 // 02E94632
  mov dword ptr [darkness_shader_state+30], #3 // 02E94634
  jmp short fps_loc_02E945C8 // 02E9463E
fps_loc_02E94640:
  imul ebx, ebx, 0xc // 02E94640
  mov eax, dword ptr [ebp - 0x1064] // 02E94643
  xor edx, edx // 02E94649
  mov dword ptr [ebx + darkness_shader_state+848], eax // 02E9464B
  mov dword ptr [darkness_shader_state+30], edx // 02E94651
fps_loc_02E94657:
  lea esp, [ebp - 0xc] // 02E94657
  pop ebx // 02E9465A
  pop esi // 02E9465B
  pop edi // 02E9465C
  pop ebp // 02E9465D
  ret // 02E9465E
  nop // 02E9465F

// Select specialized 2D vtable only for common-atlas palette-14 still-white Darkness rectangles.
fps_darkness_text_submit2:
  push ebp // 02E94660
  mov eax, ecx // 02E94661
  mov ebp, esp // 02E94663
  push ebx // 02E94665
  mov ebx, ecx // 02E94666
  call fps_darkness_text_observe // 02E94668
  cmp dword ptr [TOS.exe+720268], 0xd000000 // 02E9466D
  jne short fps_loc_02E946AA // 02E94677
  mov eax, dword ptr [TOS.exe+72026C] // 02E94679
  shr eax, #4 // 02E9467E
  cmp eax, 0xe // 02E94681
  jne short fps_loc_02E946AA // 02E94684
  cmp dword ptr [ebx], TOS.exe+474370 // 02E94686
  jne short fps_loc_02E946AA // 02E9468C
  lea eax, [ebx + 0xa4] // 02E9468E
  call fps_darkness_text_dark_family // 02E94694
  test eax, eax // 02E94699
  je short fps_loc_02E946AA // 02E9469B
  inc dword ptr [eax*#4 + darkness_shader_state-4] // 02E9469D
  mov dword ptr [ebx], fps_darkness_vt2 // 02E946A4
fps_loc_02E946AA:
  mov ecx, ebx // 02E946AA
  mov eax, TOS.exe+185510 // 02E946AC
  pop ebx // 02E946B1
  pop ebp // 02E946B2
  jmp eax // 02E946B3
  nop // 02E946B5
  nop // 02E946B6
  nop // 02E946B7

// Select corrected common 3D table for eligible Darkness rectangles.
fps_darkness_text_submit3:
  push ebp // 02E946B8
  mov eax, ecx // 02E946B9
  mov ebp, esp // 02E946BB
  push ebx // 02E946BD
  mov ebx, ecx // 02E946BE
  call fps_darkness_text_observe // 02E946C0
  cmp dword ptr [TOS.exe+720268], 0xd000000 // 02E946C5
  jne short fps_loc_02E94702 // 02E946CF
  mov eax, dword ptr [TOS.exe+72026C] // 02E946D1
  shr eax, #4 // 02E946D6
  cmp eax, 0xe // 02E946D9
  jne short fps_loc_02E94702 // 02E946DC
  cmp dword ptr [ebx], TOS.exe+4789B8 // 02E946DE
  jne short fps_loc_02E94702 // 02E946E4
  lea eax, [ebx + 0xa4] // 02E946E6
  call fps_darkness_text_dark_family // 02E946EC
  test eax, eax // 02E946F1
  je short fps_loc_02E94702 // 02E946F3
  inc dword ptr [eax*#4 + darkness_shader_state-4] // 02E946F5
  mov dword ptr [ebx], fps_orb_commonvt3 // 02E946FC
fps_loc_02E94702:
  mov ecx, ebx // 02E94702
  mov eax, TOS.exe+1873D0 // 02E94704
  pop ebx // 02E94709
  pop ebp // 02E9470A
  jmp eax // 02E9470B
  nop // 02E9470D
  nop // 02E9470E
  nop // 02E9470F

// Linker layout padding; preserve as raw data if byte coverage requires it.
  db 66,90,66,90,66,90,66,90,66,90,66,90,66,90,66,90 // 02E94710: constants / retained padding
  db 66,90,66,90,66,90,66,90,66,90,66,90,66,90,66,90 // 02E94720: constants / retained padding
  db 66,90,66,90,66,90,66,90,66,90,66,90,66,90,66,90 // 02E94730: constants / retained padding
  db 66,90,66,90,66,90,66,90,66,90,66,90,66,90,66,90 // 02E94740: constants / retained padding
  db 66,90,66,90,66,90,66,90,66,90,66,90,66,90,66,90 // 02E94750: constants / retained padding
  db 66,90,66,90,66,90,66,90,66,90,66,90,66,90,66,90 // 02E94760: constants / retained padding
  db 66,90,66,90,66,90,66,90,66,90,66,90,66,90,66,90 // 02E94770: constants / retained padding
  db 66,90,66,90,66,90,66,90,66,90,66,90,66,90,66,90 // 02E94780: constants / retained padding
  db 66,90,66,90,66,90,66,90,66,90,66,90,66,90,66,90 // 02E94790: constants / retained padding
  db 66,90,66,90,66,90,66,90,66,90,66,90,66,90,66,90 // 02E947A0: constants / retained padding
  db 66,90,66,90,66,90,66,90,66,90,66,90,66,90,66,90 // 02E947B0: constants / retained padding
  db 66,90,66,90,66,90,66,90,66,90,66,90,66,90,66,90 // 02E947C0: constants / retained padding
  db 66,90,66,90,66,90,66,90,66,90,66,90,66,90,66,90 // 02E947D0: constants / retained padding
  db 66,90,66,90,66,90,66,90,66,90,66,90,66,90,66,90 // 02E947E0: constants / retained padding
  db 66,90,66,90,66,90,66,90,66,90,66,90,66,90,66,90 // 02E947F0: constants / retained padding
  db 66,90,66,90,66,90,66,90,66,90,66,90,66,90,66,90 // 02E94800: constants / retained padding
  db 66,90,66,90,66,90,66,90,66,90,66,90,66,90,66,90 // 02E94810: constants / retained padding
  db 66,90,66,90,66,90,66,90,66,90,66,90,66,90,66,90 // 02E94820: constants / retained padding
  db 66,90,66,90,66,90,66,90,66,90,66,90,66,90,66,90 // 02E94830: constants / retained padding
  db 66,90,66,90,66,90,66,90,66,90,66,90,66,90,66,90 // 02E94840: constants / retained padding
  db 66,90,66,90,66,90,66,90,66,90,66,90,66,90,66,90 // 02E94850: constants / retained padding
  db 66,90,66,90,66,90,66,90,66,90,66,90,66,90,66,90 // 02E94860: constants / retained padding
  db 66,90,66,90,66,90,66,90,66,90,66,90,66,90,66,90 // 02E94870: constants / retained padding
  db 66,90,66,90,66,90,66,90,66,90,66,90,66,90,66,90 // 02E94880: constants / retained padding
  db 66,90,66,90,66,90,66,90,66,90,66,90,66,90,66,90 // 02E94890: constants / retained padding
  db 66,90,66,90,66,90,66,90,66,90,66,90,66,90,66,90 // 02E948A0: constants / retained padding
  db 66,90,66,90,66,90,66,90,66,90,66,90,66,90,66,90 // 02E948B0: constants / retained padding
  db 66,90,66,90,66,90,66,90,66,90,66,90,66,90,66,90 // 02E948C0: constants / retained padding
  db 66,90,66,90,66,90,66,90,66,90,66,90,66,90,66,90 // 02E948D0: constants / retained padding
  db 66,90,66,90,66,90,66,90,66,90,66,90,66,90,66,90 // 02E948E0: constants / retained padding
  db 66,90,66,90,66,90,66,90,66,90,66,90,66,90,66,90 // 02E948F0: constants / retained padding
  db 66,90,66,90,66,90,66,90,66,90,66,90,66,90,66,90 // 02E94900: constants / retained padding
  db 66,90,66,90,66,90,66,90,66,90,66,90,66,90,66,90 // 02E94910: constants / retained padding
  db 66,90,66,90,66,90,66,90,66,90,66,90,66,90,66,90 // 02E94920: constants / retained padding
  db 66,90,66,90,66,90,66,90,66,90,66,90,66,90,66,90 // 02E94930: constants / retained padding
  db 66,90,66,90,66,90,66,90,66,90,66,90,66,90,66,90 // 02E94940: constants / retained padding
  db 66,90,66,90,66,90,66,90,66,90,66,90,66,90,66,90 // 02E94950: constants / retained padding
  db 66,90,66,90,66,90,66,90,66,90,66,90,66,90,66,90 // 02E94960: constants / retained padding
  db 66,90,66,90,66,90,66,90,66,90,66,90,66,90,66,90 // 02E94970: constants / retained padding
  db 66,90,66,90,66,90,66,90,66,90,66,90,66,90,66,90 // 02E94980: constants / retained padding
  db 66,90,66,90,66,90,66,90,66,90,66,90,66,90,66,90 // 02E94990: constants / retained padding
  db 66,90,66,90,66,90,66,90,66,90,66,90,66,90,66,90 // 02E949A0: constants / retained padding
  db 66,90,66,90,66,90,66,90,66,90,66,90,66,90,66,90 // 02E949B0: constants / retained padding
  db 66,90,66,90,66,90,66,90,66,90,66,90,66,90,66,90 // 02E949C0: constants / retained padding
  db 66,90,66,90,66,90,66,90,66,90,66,90,66,90,66,90 // 02E949D0: constants / retained padding
  db 66,90,66,90,66,90,66,90,66,90,66,90,66,90,66,90 // 02E949E0: constants / retained padding
  db 66,90,66,90,66,90,66,90,66,90,66,90,66,90,66,90 // 02E949F0: constants / retained padding
  db 66,90,66,90,66,90,66,90,66,90,66,90,66,90,66,90 // 02E94A00: constants / retained padding
  db 66,90,66,90,66,90,66,90,66,90,66,90,66,90,66,90 // 02E94A10: constants / retained padding
  db 66,90,66,90,66,90,66,90,66,90,66,90,66,90,66,90 // 02E94A20: constants / retained padding
  db 66,90,66,90,66,90,66,90,66,90,66,90,66,90,66,90 // 02E94A30: constants / retained padding
  db 66,90,66,90,66,90,66,90,66,90,66,90,66,90,66,90 // 02E94A40: constants / retained padding
  db 66,90,66,90,66,90,66,90,66,90,66,90,66,90,66,90 // 02E94A50: constants / retained padding
  db 66,90,66,90,66,90,66,90,66,90 // 02E94A60: constants / retained padding

// Temporarily select D-sampling shader, draw, and restore original shader.
fps_darkness_text_draw:
  push ebp // 02E94A6A
  xor edx, edx // 02E94A6B
  mov ebp, esp // 02E94A6D
  push esi // 02E94A6F
  push ebx // 02E94A70
  push eax // 02E94A71
  mov ebx, dword ptr [TOS.exe+72999C] // 02E94A72
  mov dword ptr [ebp - 0xc], edx // 02E94A78
  lea edx, [ebp - 0xc] // 02E94A7B
  mov eax, dword ptr [ebx] // 02E94A7E
  inc dword ptr [darkness_shader_state+14] // 02E94A80
  push edx // 02E94A86
  push ebx // 02E94A87
  call dword ptr [eax + 0x1b0] // 02E94A88
  test eax, eax // 02E94A8E
  js short fps_loc_02E94AC7 // 02E94A90
  mov edx, dword ptr [ebp - 0xc] // 02E94A92
  test edx, edx // 02E94A95
  je short fps_loc_02E94AC7 // 02E94A97
  mov eax, ebx // 02E94A99
  mov dword ptr [darkness_shader_state+34], edx // 02E94A9B
  call fps_darkness_text_variant // 02E94AA1
  mov esi, eax // 02E94AA6
  test eax, eax // 02E94AA8
  je short fps_loc_02E94AC7 // 02E94AAA
  mov eax, dword ptr [ebx] // 02E94AAC
  push esi // 02E94AAE
  push ebx // 02E94AAF
  call dword ptr [eax + 0x1ac] // 02E94AB0
  mov dword ptr [darkness_shader_state+2C], eax // 02E94AB6
  test eax, eax // 02E94ABB
  js short fps_loc_02E94AC7 // 02E94ABD
  inc dword ptr [darkness_shader_state+18] // 02E94ABF
  jmp short fps_loc_02E94ACF // 02E94AC5
fps_loc_02E94AC7:
  inc dword ptr [darkness_shader_state+1C] // 02E94AC7
  xor esi, esi // 02E94ACD
fps_loc_02E94ACF:
  push dword ptr [ebp + 0x1c] // 02E94ACF
  mov eax, TOS.exe+1CF250 // 02E94AD2
  push dword ptr [ebp + 0x18] // 02E94AD7
  push dword ptr [ebp + 0x14] // 02E94ADA
  push dword ptr [ebp + 0x10] // 02E94ADD
  push dword ptr [ebp + 0xc] // 02E94AE0
  push dword ptr [ebp + #8] // 02E94AE3
  call eax // 02E94AE6
  add esp, 0x18 // 02E94AE8
  test esi, esi // 02E94AEB
  je short fps_loc_02E94AFB // 02E94AED
  mov eax, dword ptr [ebx] // 02E94AEF
  push dword ptr [ebp - 0xc] // 02E94AF1
  push ebx // 02E94AF4
  call dword ptr [eax + 0x1ac] // 02E94AF5
fps_loc_02E94AFB:
  mov eax, dword ptr [ebp - 0xc] // 02E94AFB
  test eax, eax // 02E94AFE
  je short fps_loc_02E94B08 // 02E94B00
  mov edx, dword ptr [eax] // 02E94B02
  push eax // 02E94B04
  call dword ptr [edx + #8] // 02E94B05
fps_loc_02E94B08:
  lea esp, [ebp - #8] // 02E94B08
  pop ebx // 02E94B0B
  pop esi // 02E94B0C
  pop ebp // 02E94B0D
  ret // 02E94B0E
  nop // 02E94B0F
  nop // 02E94B10
  nop // 02E94B11

// Linker layout padding; preserve as raw data if byte coverage requires it.
  db 66,90,66,90,66,90,66,90,66,90,66,90,66,90,66,90 // 02E94B12: constants / retained padding
  db 66,90,66,90,66,90,66,90,66,90,66,90,66,90,66,90 // 02E94B22: constants / retained padding
  db 66,90,66,90,66,90,66,90,66,90,66,90,66,90,66,90 // 02E94B32: constants / retained padding
  db 66,90,66,90,66,90,66,90,66,90,66,90,66,90,66,90 // 02E94B42: constants / retained padding
  db 66,90,66,90,66,90,66,90,66,90,66,90,66,90,66,90 // 02E94B52: constants / retained padding
  db 66,90,66,90,66,90,66,90,66,90,66,90,66,90,66,90 // 02E94B62: constants / retained padding
  db 66,90,66,90,66,90,66,90,66,90,66,90,66,90,66,90 // 02E94B72: constants / retained padding
  db 66,90,66,90,66,90,66,90,66,90,66,90,66,90,66,90 // 02E94B82: constants / retained padding
  db 66,90,66,90,66,90,66,90,66,90,66,90,66,90,66,90 // 02E94B92: constants / retained padding
  db 66,90,66,90,66,90,66,90,66,90,66,90,66,90,66,90 // 02E94BA2: constants / retained padding
  db 66,90,66,90,66,90,66,90,66,90,66,90,66,90 // 02E94BB2: constants / retained padding

// Historical eight-entry 3D vtable, retained but superseded by orb common_vt3.
fps_darkness_vt3:
  dd TOS.exe+186B20 // 02E94BC0: vtable callback
  dd TOS.exe+188630 // 02E94BC4: vtable callback
  dd TOS.exe+1873D0 // 02E94BC8: vtable callback
  dd TOS.exe+1874C0 // 02E94BCC: vtable callback
  dd TOS.exe+187510 // 02E94BD0: vtable callback
  dd TOS.exe+187360 // 02E94BD4: vtable callback
  dd fps_darkness_text_execute3 // 02E94BD8: vtable callback
  dd fps_darkness_text_clone3 // 02E94BDC: vtable callback

// Eight-entry 2D command vtable; clone/execute slots are patch-local pointers.
fps_darkness_vt2:
  dd TOS.exe+186B20 // 02E94BE0: vtable callback
  dd TOS.exe+188630 // 02E94BE4: vtable callback
  dd TOS.exe+185510 // 02E94BE8: vtable callback
  dd TOS.exe+185600 // 02E94BEC: vtable callback
  dd TOS.exe+19E6E0 // 02E94BF0: vtable callback
  dd TOS.exe+1854B0 // 02E94BF4: vtable callback
  dd fps_darkness_text_execute2 // 02E94BF8: vtable callback
  dd fps_darkness_text_clone2 // 02E94BFC: vtable callback

// Validate straight-line ps_3_0 and append same-atlas D RGB multiply, retaining original alpha.
fps_darkness_text_dark_transform_constprop_0:
  push ebp // 02E94C00
  mov ebp, esp // 02E94C01
  push edi // 02E94C03
  push esi // 02E94C04
  push ebx // 02E94C05
  sub esp, 0x74 // 02E94C06
  mov dword ptr [ebp - 0x5c], eax // 02E94C09
  lea eax, [edx - #2] // 02E94C0C
  mov dword ptr [ebp - 0x60], edx // 02E94C0F
  mov dword ptr [ebp - 0x4c], ecx // 02E94C12
  cmp eax, 0x1fe // 02E94C15
  ja near fps_loc_02E94E78 // 02E94C1A
  mov eax, dword ptr [ebp - 0x5c] // 02E94C20
  cmp dword ptr [eax], 0xffff0300 // 02E94C23
  jne near fps_loc_02E94E78 // 02E94C29
  mov eax, dword ptr [ebp - 0x4c] // 02E94C2F
  xor edx, edx // 02E94C32
  xor ecx, ecx // 02E94C34
  mov dword ptr [ebp - 0x50], #7 // 02E94C36
  mov dword ptr [ebp - 0x70], ecx // 02E94C3D
  mov edi, #1 // 02E94C40
  mov dword ptr [eax], 0xffff0300 // 02E94C45
  mov dword ptr [eax + #4], 0x5000051 // 02E94C4B
  mov dword ptr [eax + #8], 0xa00f00df // 02E94C52
  mov dword ptr [eax + 0xc], 0x3f1e4000 // 02E94C59
  mov dword ptr [eax + 0x10], 0x3f104000 // 02E94C60
  mov dword ptr [eax + 0x14], edx // 02E94C67
  mov dword ptr [eax + 0x18], edx // 02E94C6A
  mov eax, dword ptr [ebp - 0x60] // 02E94C6D
  mov dword ptr [ebp - 0x6c], ecx // 02E94C70
  dec eax // 02E94C73
  mov dword ptr [ebp - 0x80], eax // 02E94C74
fps_loc_02E94C77:
  lea eax, [edi*#4] // 02E94C77
  mov dword ptr [ebp - 0x64], eax // 02E94C7E
  mov eax, dword ptr [ebp - 0x5c] // 02E94C81
  mov esi, dword ptr [eax + edi*#4] // 02E94C84
  movzx ebx, si // 02E94C87
  cmp ebx, 0xffff // 02E94C8A
  jne short fps_loc_02E94CF3 // 02E94C90
  cmp esi, 0xffff // 02E94C92
  jne near fps_loc_02E94E78 // 02E94C98
  lea eax, [edi + #1] // 02E94C9E
  cmp dword ptr [ebp - 0x60], eax // 02E94CA1
  jne near fps_loc_02E94E78 // 02E94CA4
  mov eax, dword ptr [ebp - 0x6c] // 02E94CAA
  mov edx, dword ptr [ebp - 0x70] // 02E94CAD
  xor eax, #1 // 02E94CB0
  xor edx, #1 // 02E94CB3
  or eax, edx // 02E94CB6
  jne near fps_loc_02E94E78 // 02E94CB8
  lea edi, [ebp - 0x48] // 02E94CBE
  mov esi, fps_darkness_data // 02E94CC1
  lea ebx, [ebp - 0x48] // 02E94CC6
  mov ecx, 0xf // 02E94CC9
  rep movsd dword ptr es:[edi], dword ptr [esi] // 02E94CCE
  mov edi, dword ptr [ebp - 0x4c] // 02E94CD0
  mov esi, dword ptr [ebp - 0x50] // 02E94CD3
  lea edx, [edi + esi*#4] // 02E94CD6
fps_loc_02E94CD9:
  mov ecx, dword ptr [ebx + eax*#4] // 02E94CD9
  mov dword ptr [edx + eax*#4], ecx // 02E94CDC
  inc eax // 02E94CDF
  cmp eax, 0xf // 02E94CE0
  jne short fps_loc_02E94CD9 // 02E94CE3
  mov eax, dword ptr [ebp - 0x50] // 02E94CE5
  add eax, 0xf // 02E94CE8
  mov dword ptr [ebp - 0x58], eax // 02E94CEB
  jmp near fps_loc_02E94F91 // 02E94CEE
fps_loc_02E94CF3:
  cmp ebx, 0xfffe // 02E94CF3
  jne short fps_loc_02E94D52 // 02E94CF9
  mov eax, dword ptr [ebp - 0x60] // 02E94CFB
  shr esi, 0x10 // 02E94CFE
  and esi, 0x7fff // 02E94D01
  dec eax // 02E94D07
  sub eax, edi // 02E94D08
  cmp eax, esi // 02E94D0A
  jb near fps_loc_02E94E78 // 02E94D0C
  mov eax, dword ptr [ebp - 0x50] // 02E94D12
  db 8D,44,06,01 // lea eax, [esi + eax + #1] // 02E94D15
  mov dword ptr [ebp - 0x54], eax // 02E94D19
  cmp eax, 0x215 // 02E94D1C
  ja near fps_loc_02E94E78 // 02E94D21
  mov eax, dword ptr [ebp - 0x4c] // 02E94D27
  mov ebx, dword ptr [ebp - 0x50] // 02E94D2A
  mov ecx, dword ptr [ebp - 0x64] // 02E94D2D
  add ecx, dword ptr [ebp - 0x5c] // 02E94D30
  lea ebx, [eax + ebx*#4] // 02E94D33
  xor eax, eax // 02E94D36
fps_loc_02E94D38:
  mov edx, dword ptr [ecx + eax*#4] // 02E94D38
  mov dword ptr [ebx + eax*#4], edx // 02E94D3B
  inc eax // 02E94D3E
  cmp esi, eax // 02E94D3F
  jae short fps_loc_02E94D38 // 02E94D41
  mov eax, dword ptr [ebp - 0x54] // 02E94D43
  lea edi, [edi + esi + #1] // 02E94D46
  mov dword ptr [ebp - 0x50], eax // 02E94D4A
  jmp near fps_loc_02E94F83 // 02E94D4D
fps_loc_02E94D52:
  bt esi, 0x1c // 02E94D52
  jb near fps_loc_02E94E78 // 02E94D56
  mov eax, esi // 02E94D5C
  shr eax, 0x18 // 02E94D5E
  and eax, 0xf // 02E94D61
  mov dword ptr [ebp - 0x54], eax // 02E94D64
  mov eax, dword ptr [ebp - 0x80] // 02E94D67
  mov edx, dword ptr [ebp - 0x54] // 02E94D6A
  sub eax, edi // 02E94D6D
  cmp eax, edx // 02E94D6F
  jb near fps_loc_02E94E78 // 02E94D71
  mov eax, dword ptr [ebp - 0x50] // 02E94D77
  inc eax // 02E94D7A
  mov dword ptr [ebp - 0x74], eax // 02E94D7B
  mov ecx, dword ptr [ebp - 0x74] // 02E94D7E
  db 8D,04,0A // lea eax, [edx + ecx] // 02E94D81
  cmp eax, 0x215 // 02E94D84
  ja near fps_loc_02E94E78 // 02E94D89
  cmp ebx, 0x1f // 02E94D8F
  jne short fps_loc_02E94DD0 // 02E94D92
  cmp edx, #2 // 02E94D94
  jne near fps_loc_02E94E78 // 02E94D97
  mov eax, dword ptr [ebp - 0x5c] // 02E94D9D
  mov edx, dword ptr [ebp - 0x64] // 02E94DA0
  cmp dword ptr [eax + edx + #4], 0x90000000 // 02E94DA3
  jne near fps_loc_02E94E9C // 02E94DAB
  mov eax, dword ptr [eax + edx + #8] // 02E94DB1
  mov dword ptr [ebp - 0x58], eax // 02E94DB5
  and eax, 0x70001fff // 02E94DB8
  cmp eax, 0x20000800 // 02E94DBD
  sete al // 02E94DC2
  movzx eax, al // 02E94DC5
  or dword ptr [ebp - 0x6c], eax // 02E94DC8
  jmp near fps_loc_02E94E9C // 02E94DCB
fps_loc_02E94DD0:
  cmp ebx, 0x51 // 02E94DD0
  jne short fps_loc_02E94DE9 // 02E94DD3
  cmp dword ptr [ebp - 0x54], #5 // 02E94DD5
  jne near fps_loc_02E94E78 // 02E94DD9
  mov edx, #1 // 02E94DDF
  jmp near fps_loc_02E94E93 // 02E94DE4
fps_loc_02E94DE9:
  cmp ebx, 0x24 // 02E94DE9
  ja short fps_loc_02E94E45 // 02E94DEC
  cmp ebx, 0xd // 02E94DEE
  ja short fps_loc_02E94E1F // 02E94DF1
  xor edx, edx // 02E94DF3
  test ebx, ebx // 02E94DF5
  je near fps_loc_02E94E8E // 02E94DF7
  mov eax, #1 // 02E94DFD
  mov ecx, ebx // 02E94E02
  shl eax, cl // 02E94E04
  test eax, 0x3f2c // 02E94E06
  jne short fps_loc_02E94E82 // 02E94E0B
  and eax, 0xc2 // 02E94E0D
  cmp eax, #1 // 02E94E12
  sbb edx, edx // 02E94E15
  and edx, #2 // 02E94E17
  add edx, #2 // 02E94E1A
  jmp short fps_loc_02E94E8E // 02E94E1D
fps_loc_02E94E1F:
  lea ecx, [ebx - 0xe] // 02E94E1F
  mov eax, #1 // 02E94E22
  shl eax, cl // 02E94E27
  test eax, 0x600023 // 02E94E29
  jne short fps_loc_02E94E6C // 02E94E2E
  and eax, 0xc0008 // 02E94E30
  mov dword ptr [ebp - 0x58], eax // 02E94E35
  jne short fps_loc_02E94E82 // 02E94E38
  cmp ebx, 0x12 // 02E94E3A
  jne near fps_loc_02E94F91 // 02E94E3D
  jmp short fps_loc_02E94E60 // 02E94E43
fps_loc_02E94E45:
  cmp ebx, 0x41 // 02E94E45
  je short fps_loc_02E94E89 // 02E94E48
  cmp ebx, 0x40 // 02E94E4A
  jbe short fps_loc_02E94E78 // 02E94E4D
  cmp ebx, 0x5a // 02E94E4F
  je short fps_loc_02E94E60 // 02E94E52
  ja short fps_loc_02E94E67 // 02E94E54
  cmp ebx, 0x42 // 02E94E56
  je short fps_loc_02E94E82 // 02E94E59
  cmp ebx, 0x58 // 02E94E5B
  jne short fps_loc_02E94E78 // 02E94E5E
fps_loc_02E94E60:
  mov edx, #4 // 02E94E60
  jmp short fps_loc_02E94E8E // 02E94E65
fps_loc_02E94E67:
  cmp ebx, 0x5c // 02E94E67
  ja short fps_loc_02E94E73 // 02E94E6A
fps_loc_02E94E6C:
  mov edx, #2 // 02E94E6C
  jmp short fps_loc_02E94E8E // 02E94E71
fps_loc_02E94E73:
  cmp ebx, 0x5f // 02E94E73
  je short fps_loc_02E94E82 // 02E94E76
fps_loc_02E94E78:
  xor eax, eax // 02E94E78
  mov dword ptr [ebp - 0x58], eax // 02E94E7A
  jmp near fps_loc_02E94F91 // 02E94E7D
fps_loc_02E94E82:
  mov edx, #3 // 02E94E82
  jmp short fps_loc_02E94E8E // 02E94E87
fps_loc_02E94E89:
  mov edx, #1 // 02E94E89
fps_loc_02E94E8E:
  cmp dword ptr [ebp - 0x54], edx // 02E94E8E
  jne short fps_loc_02E94E78 // 02E94E91
fps_loc_02E94E93:
  mov dword ptr [ebp - 0x68], #1 // 02E94E93
  jmp short fps_loc_02E94EA8 // 02E94E9A
fps_loc_02E94E9C:
  mov dword ptr [ebp - 0x68], #2 // 02E94E9C
  mov edx, #2 // 02E94EA3
fps_loc_02E94EA8:
  mov ecx, dword ptr [ebp - 0x50] // 02E94EA8
  mov eax, dword ptr [ebp - 0x4c] // 02E94EAB
  mov dword ptr [eax + ecx*#4], esi // 02E94EAE
  and esi, 0xffef // 02E94EB1
  cmp esi, 0x41 // 02E94EB7
  mov esi, #1 // 02E94EBA
  sete al // 02E94EBF
  cmp ebx, 0x1f // 02E94EC2
  sete cl // 02E94EC5
  or eax, ecx // 02E94EC8
  mov byte ptr [ebp - 0x75], al // 02E94ECA
  mov eax, dword ptr [ebp - 0x64] // 02E94ECD
  add eax, dword ptr [ebp - 0x5c] // 02E94ED0
  mov dword ptr [ebp - 0x7c], eax // 02E94ED3
  mov eax, dword ptr [ebp - 0x74] // 02E94ED6
  mov dword ptr [ebp - 0x50], eax // 02E94ED9
fps_loc_02E94EDC:
  cmp dword ptr [ebp - 0x54], esi // 02E94EDC
  jb near fps_loc_02E94F7C // 02E94EDF
  mov eax, dword ptr [ebp - 0x7c] // 02E94EE5
  mov ecx, dword ptr [eax + esi*#4] // 02E94EE8
  cmp esi, dword ptr [ebp - 0x68] // 02E94EEB
  jb short fps_loc_02E94F69 // 02E94EEE
  cmp edx, esi // 02E94EF0
  jb short fps_loc_02E94F69 // 02E94EF2
  test ecx, ecx // 02E94EF4
  jns short fps_loc_02E94E78 // 02E94EF6
  mov eax, ecx // 02E94EF8
  and eax, 0x2000 // 02E94EFA
  mov dword ptr [ebp - 0x58], eax // 02E94EFF
  jne near fps_loc_02E94E78 // 02E94F02
  mov ebx, ecx // 02E94F08
  shr ebx, 0x1c // 02E94F0A
  and ebx, #7 // 02E94F0D
  mov eax, ebx // 02E94F10
  mov ebx, ecx // 02E94F12
  shr ebx, #8 // 02E94F14
  and ebx, 0x18 // 02E94F17
  mov dword ptr [ebp - 0x74], ebx // 02E94F1A
  mov ebx, ecx // 02E94F1D
  and ebx, 0x7ff // 02E94F1F
  or eax, dword ptr [ebp - 0x74] // 02E94F25
  mov dword ptr [ebp - 0x64], ebx // 02E94F28
  mov ebx, eax // 02E94F2B
  jne short fps_loc_02E94F35 // 02E94F2D
  cmp dword ptr [ebp - 0x64], 0x1d // 02E94F2F
  ja short fps_loc_02E94F91 // 02E94F33
fps_loc_02E94F35:
  cmp ebx, #2 // 02E94F35
  jne short fps_loc_02E94F43 // 02E94F38
  cmp dword ptr [ebp - 0x64], 0xdf // 02E94F3A
  je short fps_loc_02E94F91 // 02E94F41
fps_loc_02E94F43:
  cmp ebx, #8 // 02E94F43
  jne short fps_loc_02E94F69 // 02E94F46
  cmp esi, #1 // 02E94F48
  jne short fps_loc_02E94F91 // 02E94F4B
  cmp dword ptr [ebp - 0x64], #0 // 02E94F4D
  jne short fps_loc_02E94F91 // 02E94F51
  cmp byte ptr [ebp - 0x75], #0 // 02E94F53
  jne short fps_loc_02E94F91 // 02E94F57
  mov dword ptr [ebp - 0x70], #1 // 02E94F59
  and ecx, 0x8fffe000 // 02E94F60
  or ecx, 0x1f // 02E94F66
fps_loc_02E94F69:
  inc dword ptr [ebp - 0x50] // 02E94F69
  mov eax, dword ptr [ebp - 0x4c] // 02E94F6C
  inc esi // 02E94F6F
  mov ebx, dword ptr [ebp - 0x50] // 02E94F70
  mov dword ptr [eax + ebx*#4 - #4], ecx // 02E94F73
  jmp near fps_loc_02E94EDC // 02E94F77
fps_loc_02E94F7C:
  mov eax, dword ptr [ebp - 0x54] // 02E94F7C
  db 8D,7C,07,01 // lea edi, [edi + eax + #1] // 02E94F7F
fps_loc_02E94F83:
  cmp edi, dword ptr [ebp - 0x60] // 02E94F83
  jb near fps_loc_02E94C77 // 02E94F86
  jmp near fps_loc_02E94E78 // 02E94F8C
fps_loc_02E94F91:
  mov eax, dword ptr [ebp - 0x58] // 02E94F91
  add esp, 0x74 // 02E94F94
  pop ebx // 02E94F97
  pop esi // 02E94F98
  pop edi // 02E94F99
  pop ebp // 02E94F9A
  ret // 02E94F9B

// Floating-point UV classifier and sample constants; never interpret as code.
fps_darkness_rdata:
  db 00,00,00,45,00,00,80,44,B8,7E,C0,43,48,81,C0,43 // 02E94F9C: constants / retained padding
  db B8,7E,DF,43,48,81,DF,43,1F,05,80,42,B8,FE,BF,43 // 02E94FAC: constants / retained padding
  db 48,01,C0,43,B8,FE,DF,43,48,01,E0,43,71,FD,7F,43 // 02E94FBC: constants / retained padding
  db A4,00,00,44,B8,FE,FF,43,48,01,A0,43 // 02E94FCC: constants / retained padding

// Compiler identification string retained from reference binary.
fps_darkness_rdata_zzz:
  db 47,43,43,3A,20,28,47,4E,55,29,20,31,36,2E,32,2E // 02E94FD8: constants / retained padding
  db 30,00,00,00 // 02E94FE8: constants / retained padding

// Immutable 15-DWORD ps_3_0 shader tail plus four padding bytes; DWORD shader register tokens are not executable addresses.
fps_darkness_data:
  db 01,00,00,02,1E,00,0F,80,DF,00,E4,A0,5F,00,00,03 // 02E94FEC: constants / retained padding
  db 1E,00,0F,80,1E,00,E4,80,00,08,E4,A0,05,00,00,03 // 02E94FFC: constants / retained padding
  db 1F,00,07,80,1F,00,E4,80,1E,00,E4,80,01,00,00,02 // 02E9500C: constants / retained padding
  db 00,08,0F,80,1F,00,E4,80,FF,FF,00,00,00,00,00,00 // 02E9501C: constants / retained padding

// Private RW state; reference 02E92000..02E9289F.
darkness_orb_state:
// Zero-initialized cache/diagnostics. Runtime device, shader, texture pointers must start zero and be writable.
// Allocation bytes start at zero; no debugger state is copied.
  db 00

// Private RW state; reference 02E95300..02E95D1F.
darkness_shader_state:
// Zero-initialized cache/diagnostics. Runtime device, shader, texture pointers must start zero and be writable.
// Allocation bytes start at zero; no debugger state is copied.
  db 00

[DISABLE]
// Restoration evidence only; settings take effect on a fresh launch.

// Darkness rendering
TOS.exe+195232:
  db E8,D9,02,FF,FF
TOS.exe+195AA6:
  db E8,25,19,FF,FF
dealloc(fps_darkness_rendering_code)
dealloc(darkness_orb_state)
dealloc(darkness_shader_state)
