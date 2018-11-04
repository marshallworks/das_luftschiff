dofile("das_luftschiff/src.lua")
-- title:  Das Luftschiff
-- author: Gregory Marshall (MarshallWorks)
-- desc:   Keep it flying.
-- script: lua

-- <TILES>
-- 001:0000000000000000000000000000000500000005000000050000000500000005
-- 002:0000000000000000000000005500000000555500000000500000005000000005
-- 003:0000000000000000000000000000000000000000000000005555555500000000
-- 004:0000000000000000000000000000000000000000000000555555550000000000
-- 005:0000000000000000000000000000055500555000550000000000000000000000
-- 006:0000000000000000005555555500000000000000000000000000000000000000
-- 007:0000000000000000555555550000000000000000000000000000000000000000
-- 008:0000000000000000555550000000050000000500500005000500050000005000
-- 009:0000000000000000000000000005555500550000005000000050000000500555
-- 010:0000000000000000000000005555500000005500000005000000050055500500
-- 016:5555555500500050050005005555555500500050050005005000500055555555
-- 017:0000000500000050000000500000005000000500000005000000005500000000
-- 018:0000000000000000000000000000000000000000000000000000005555555550
-- 019:0000000000000000000000000000000000000000000000005555555500000500
-- 020:0000000000000000000000000000000000000000000000005500000005555555
-- 021:0000000000000000000000000000000000000000000000000000000055555555
-- 022:0000000000000000000000000000000000000000000000000000000055555555
-- 023:0000000000000000000000000000000000000000000000000000000555555550
-- 024:0000500000005000000500000005000000500000050000005000000000000000
-- 025:0050050000500500005055000050500005505000050050000500500005005000
-- 026:0050050000500500005505000005050000050550000500500005005000050050
-- 032:0050050000500500005505000050550000500500005005000055050000505500
-- 034:0500000050000000500000005555555505050005050500050500500000000000
-- 035:0000050000000050000000505555555000050500000005000050050000000000
-- 038:0500000050000000555555550500050505000005050050050000000500000000
-- 039:0000000500000005555555550005005000050050000500500000000000000000
-- 041:0000000000000000000000000000000000000000000055550005000000050000
-- 042:0000000000000000000000000000000000000000550000000050000000500000
-- 049:0000000000000000000000000000000500000005000000050000000500000005
-- 050:0000000000000000000000005500000000555500000000500000005000000005
-- 051:0000000000000000000000000000000000000000000000005555555500000000
-- 052:0000000000000000000000000000000000000000000000555555550000000000
-- 053:0000000000000000000000000000055500555000550000000000000000000000
-- 054:0000000000000000005555555500000000000000000000000000000000000000
-- 055:0000000000000000555555550000000000000000000000000000000000000000
-- 056:0000000000000000555550000000050000000500500005000500050000005000
-- 057:0005000000050000000500000000500000005000000050000000500000055555
-- 058:0050000000550000005555500505000005550000050000000500000055500000
-- 065:0000000500000050000000500000005000000500000005000000005500000000
-- 066:0000000000000000000000000000000000000000000000000000005555555550
-- 067:0000000000000000000000000000000000000000000000005555555500000500
-- 068:0000000000000000000000000000000000000000000000005500000005555555
-- 069:0000000000000000000000000000000000000000000000000000000055555555
-- 070:0000000000000000000000000000000000000000000000000000000055555555
-- 071:0000000000000000000000000000000000000000000000000000000555555550
-- 072:0000500000005000000500000005000000500000050000005000000000000000
-- 082:0500000050000000500000005555555505050500050005000500050000000000
-- 083:0000050000000050000000505555555005005000050055000500050000000000
-- 086:0500000050000000555555550505005005055050050000500000005000000000
-- 087:0000000500000005555555550050005000500050005000500000005000000000
-- </TILES>

-- <SPRITES>
-- 001:0000000000555500055555500555555005555550005555000555555005555550
-- 017:0555555005555550055555500555555005555550055505500555055005550550
-- </SPRITES>

-- <MAP>
-- 000:010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
-- 001:020000000000000000000000000000000000000000000000000000000002000000000000000000000000000000000000000000000000000000000200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
-- 002:020000000000000000000000000000000000000000000000000000000002000000000000000000000000000000000000000000000000000000000200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
-- 003:020000000000000000000000000000000000000000000000000000000002000000000000000101010101010000000000000000000000000000000200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
-- 004:020101010101010101000000000000000000000000000000000000000002000000000000000200000000020000000000000000000000000000000200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
-- 005:020000000000000002000000000000000000000000000000000000000002000000000000000200000000010101010101010000000000000000000200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
-- 006:020000000000000002000000000000000000000000000000000000000002000000000000000200000000020000000000020000000000000000000200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
-- 007:020000000000000002000000000000000000000000000000000000000002000000000000000200000000020000000000020000000000000000000200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
-- 008:020000000000000002000000000000000000000000000000000000000002000000000000000200000000020000000000010101010101010101000200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
-- 009:020090a0000000000200000000000000000000000092a200000000000002000000000000000200000000020000000000020000000000000002000200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
-- 010:020091a1000000000200000000000000000000000093a300000000000002000000000000000200000000020000000000020000000000000002000200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
-- 011:010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
-- </MAP>

-- <WAVES>
-- 000:00000000ffffffff00000000ffffffff
-- 001:0123456789abcdeffedcba9876543210
-- 002:0123456789abcdef0123456789abcdef
-- </WAVES>

-- <SFX>
-- 000:000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000304000000000
-- </SFX>

-- <PALETTE>
-- 000:140c1c44243430346d4e4a4e854c30346524d04648757161597dced27d2c8595a16daa2cd2aa996dc2cadad45edeeed6
-- </PALETTE>

