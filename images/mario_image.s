.file "mario_image.s"

.global mario_data_size
	.text
	.type mario_data_size, @object
	.size mario_data_size, 2
mario_data_size:
	.word mario_data_end - mario_data

.global mario_color_table
	.text
	.type mario_color_table, @object
	.size mario_color_table, 32
mario_color_table:
	.word 0xffff
	.word 0x00ff
	.word 0xff00
	.word 0x00ff
	.word 0x00ff
	.word 0x00ff
	.word 0x0000
	.word 0x00ff
	.word 0xffff
	.word 0x0000
	.word 0xff00
	.word 0x0000
	.word 0x00ff
	.word 0x0000
	.word 0x0000
	.word 0x0000

.global mario_height
	.text
	.type mario_height, @object
	.size mario_height, 4
mario_height:
	.word 0x0048
	.word 0x0000

.global mario_width
	.text
	.type mario_width, @object
	.size mario_width, 4
mario_width:
	.word 0x0048
	.word 0x0000

.global mario_data
	.text
	.type mario_data, @object
	.size mario_data, 1520
mario_data:
	.byte 0x00 /* 0 */
	.byte 0x02 /* 1 */
	.byte 0x33 /* 2 */
	.byte 0x05 /* 3 */
	.byte 0x00 /* 4 */
	.byte 0x0a /* 5 */
	.byte 0x71 /* 6 */
	.byte 0x33 /* 7 */
	.byte 0x17 /* 8 */
	.byte 0x10 /* 9 */
	.byte 0x60 /* a */
	.byte 0x00 /* b */
	.byte 0x00 /* c */
	.byte 0x00 /* d */
	.byte 0x02 /* e */
	.byte 0x2f /* f */
	.byte 0x00 /* 10 */
	.byte 0x00 /* 11 */
	.byte 0x0e /* 12 */
	.byte 0x20 /* 13 */
	.byte 0x47 /* 14 */
	.byte 0x37 /* 15 */
	.byte 0x77 /* 16 */
	.byte 0x73 /* 17 */
	.byte 0x77 /* 18 */
	.byte 0x10 /* 19 */
	.byte 0x00 /* 1a */
	.byte 0x00 /* 1b */
	.byte 0x00 /* 1c */
	.byte 0x02 /* 1d */
	.byte 0x17 /* 1e */
	.byte 0x00 /* 1f */
	.byte 0x00 /* 20 */
	.byte 0x08 /* 21 */
	.byte 0x75 /* 22 */
	.byte 0x37 /* 23 */
	.byte 0x35 /* 24 */
	.byte 0x30 /* 25 */
	.byte 0x0a /* 26 */
	.byte 0x00 /* 27 */
	.byte 0x00 /* 28 */
	.byte 0x16 /* 29 */
	.byte 0x04 /* 2a */
	.byte 0x04 /* 2b */
	.byte 0x05 /* 2c */
	.byte 0x05 /* 2d */
	.byte 0x37 /* 2e */
	.byte 0x77 /* 2f */
	.byte 0x71 /* 30 */
	.byte 0x77 /* 31 */
	.byte 0x77 /* 32 */
	.byte 0x70 /* 33 */
	.byte 0x61 /* 34 */
	.byte 0x00 /* 35 */
	.byte 0x00 /* 36 */
	.byte 0x00 /* 37 */
	.byte 0x02 /* 38 */
	.byte 0x16 /* 39 */
	.byte 0x00 /* 3a */
	.byte 0x02 /* 3b */
	.byte 0x37 /* 3c */
	.byte 0x02 /* 3d */
	.byte 0x37 /* 3e */
	.byte 0x08 /* 3f */
	.byte 0x77 /* 40 */
	.byte 0x00 /* 41 */
	.byte 0x1a /* 42 */
	.byte 0x04 /* 43 */
	.byte 0x00 /* 44 */
	.byte 0x01 /* 45 */
	.byte 0x02 /* 46 */
	.byte 0x02 /* 47 */
	.byte 0x12 /* 48 */
	.byte 0x06 /* 49 */
	.byte 0x07 /* 4a */
	.byte 0x31 /* 4b */
	.byte 0x73 /* 4c */
	.byte 0x77 /* 4d */
	.byte 0x37 /* 4e */
	.byte 0x37 /* 4f */
	.byte 0x00 /* 50 */
	.byte 0x00 /* 51 */
	.byte 0x00 /* 52 */
	.byte 0x02 /* 53 */
	.byte 0x16 /* 54 */
	.byte 0x00 /* 55 */
	.byte 0x00 /* 56 */
	.byte 0x28 /* 57 */
	.byte 0x77 /* 58 */
	.byte 0x77 /* 59 */
	.byte 0x37 /* 5a */
	.byte 0x77 /* 5b */
	.byte 0x77 /* 5c */
	.byte 0x77 /* 5d */
	.byte 0x73 /* 5e */
	.byte 0x47 /* 5f */
	.byte 0x06 /* 60 */
	.byte 0x05 /* 61 */
	.byte 0x04 /* 62 */
	.byte 0x05 /* 63 */
	.byte 0x21 /* 64 */
	.byte 0x61 /* 65 */
	.byte 0x73 /* 66 */
	.byte 0x53 /* 67 */
	.byte 0x34 /* 68 */
	.byte 0x37 /* 69 */
	.byte 0x73 /* 6a */
	.byte 0x70 /* 6b */
	.byte 0x00 /* 6c */
	.byte 0x00 /* 6d */
	.byte 0x00 /* 6e */
	.byte 0x02 /* 6f */
	.byte 0x15 /* 70 */
	.byte 0x00 /* 71 */
	.byte 0x00 /* 72 */
	.byte 0x28 /* 73 */
	.byte 0x37 /* 74 */
	.byte 0x35 /* 75 */
	.byte 0x35 /* 76 */
	.byte 0x33 /* 77 */
	.byte 0x73 /* 78 */
	.byte 0x73 /* 79 */
	.byte 0x77 /* 7a */
	.byte 0x77 /* 7b */
	.byte 0x07 /* 7c */
	.byte 0x07 /* 7d */
	.byte 0x06 /* 7e */
	.byte 0x16 /* 7f */
	.byte 0x04 /* 80 */
	.byte 0x00 /* 81 */
	.byte 0x73 /* 82 */
	.byte 0x12 /* 83 */
	.byte 0x15 /* 84 */
	.byte 0x37 /* 85 */
	.byte 0x13 /* 86 */
	.byte 0x51 /* 87 */
	.byte 0x00 /* 88 */
	.byte 0x00 /* 89 */
	.byte 0x00 /* 8a */
	.byte 0x02 /* 8b */
	.byte 0x15 /* 8c */
	.byte 0x00 /* 8d */
	.byte 0x00 /* 8e */
	.byte 0x10 /* 8f */
	.byte 0x71 /* 90 */
	.byte 0x73 /* 91 */
	.byte 0x73 /* 92 */
	.byte 0x75 /* 93 */
	.byte 0x35 /* 94 */
	.byte 0x37 /* 95 */
	.byte 0x17 /* 96 */
	.byte 0x37 /* 97 */
	.byte 0x0c /* 98 */
	.byte 0x00 /* 99 */
	.byte 0x00 /* 9a */
	.byte 0x0c /* 9b */
	.byte 0x13 /* 9c */
	.byte 0x13 /* 9d */
	.byte 0x33 /* 9e */
	.byte 0x31 /* 9f */
	.byte 0x37 /* a0 */
	.byte 0x32 /* a1 */
	.byte 0x00 /* a2 */
	.byte 0x00 /* a3 */
	.byte 0x00 /* a4 */
	.byte 0x02 /* a5 */
	.byte 0x15 /* a6 */
	.byte 0x00 /* a7 */
	.byte 0x00 /* a8 */
	.byte 0x10 /* a9 */
	.byte 0x37 /* aa */
	.byte 0x31 /* ab */
	.byte 0x21 /* ac */
	.byte 0x33 /* ad */
	.byte 0x33 /* ae */
	.byte 0x53 /* af */
	.byte 0x77 /* b0 */
	.byte 0x77 /* b1 */
	.byte 0x0c /* b2 */
	.byte 0x00 /* b3 */
	.byte 0x00 /* b4 */
	.byte 0x0c /* b5 */
	.byte 0x63 /* b6 */
	.byte 0x31 /* b7 */
	.byte 0x11 /* b8 */
	.byte 0x13 /* b9 */
	.byte 0x71 /* ba */
	.byte 0x71 /* bb */
	.byte 0x00 /* bc */
	.byte 0x00 /* bd */
	.byte 0x00 /* be */
	.byte 0x02 /* bf */
	.byte 0x16 /* c0 */
	.byte 0x00 /* c1 */
	.byte 0x00 /* c2 */
	.byte 0x10 /* c3 */
	.byte 0x35 /* c4 */
	.byte 0x31 /* c5 */
	.byte 0x31 /* c6 */
	.byte 0x31 /* c7 */
	.byte 0x73 /* c8 */
	.byte 0x13 /* c9 */
	.byte 0x17 /* ca */
	.byte 0x30 /* cb */
	.byte 0x0a /* cc */
	.byte 0x00 /* cd */
	.byte 0x00 /* ce */
	.byte 0x0e /* cf */
	.byte 0x07 /* d0 */
	.byte 0x47 /* d1 */
	.byte 0x33 /* d2 */
	.byte 0x33 /* d3 */
	.byte 0x13 /* d4 */
	.byte 0x37 /* d5 */
	.byte 0x30 /* d6 */
	.byte 0x00 /* d7 */
	.byte 0x00 /* d8 */
	.byte 0x00 /* d9 */
	.byte 0x02 /* da */
	.byte 0x16 /* db */
	.byte 0x00 /* dc */
	.byte 0x00 /* dd */
	.byte 0x10 /* de */
	.byte 0x73 /* df */
	.byte 0x13 /* e0 */
	.byte 0x13 /* e1 */
	.byte 0x53 /* e2 */
	.byte 0x31 /* e3 */
	.byte 0x77 /* e4 */
	.byte 0x76 /* e5 */
	.byte 0x70 /* e6 */
	.byte 0x0a /* e7 */
	.byte 0x00 /* e8 */
	.byte 0x00 /* e9 */
	.byte 0x0c /* ea */
	.byte 0x77 /* eb */
	.byte 0x67 /* ec */
	.byte 0x47 /* ed */
	.byte 0x43 /* ee */
	.byte 0x71 /* ef */
	.byte 0x77 /* f0 */
	.byte 0x00 /* f1 */
	.byte 0x00 /* f2 */
	.byte 0x00 /* f3 */
	.byte 0x02 /* f4 */
	.byte 0x17 /* f5 */
	.byte 0x00 /* f6 */
	.byte 0x00 /* f7 */
	.byte 0x0e /* f8 */
	.byte 0x37 /* f9 */
	.byte 0x37 /* fa */
	.byte 0x33 /* fb */
	.byte 0x17 /* fc */
	.byte 0x66 /* fd */
	.byte 0x76 /* fe */
	.byte 0x77 /* ff */
	.byte 0x0a /* 100 */
	.byte 0x00 /* 101 */
	.byte 0x00 /* 102 */
	.byte 0x0e /* 103 */
	.byte 0x67 /* 104 */
	.byte 0x47 /* 105 */
	.byte 0x76 /* 106 */
	.byte 0x76 /* 107 */
	.byte 0x76 /* 108 */
	.byte 0x73 /* 109 */
	.byte 0x10 /* 10a */
	.byte 0x00 /* 10b */
	.byte 0x00 /* 10c */
	.byte 0x00 /* 10d */
	.byte 0x02 /* 10e */
	.byte 0x1a /* 10f */
	.byte 0x00 /* 110 */
	.byte 0x00 /* 111 */
	.byte 0x22 /* 112 */
	.byte 0x35 /* 113 */
	.byte 0x66 /* 114 */
	.byte 0x64 /* 115 */
	.byte 0x77 /* 116 */
	.byte 0x77 /* 117 */
	.byte 0x60 /* 118 */
	.byte 0x00 /* 119 */
	.byte 0x00 /* 11a */
	.byte 0x00 /* 11b */
	.byte 0x06 /* 11c */
	.byte 0x77 /* 11d */
	.byte 0x77 /* 11e */
	.byte 0x67 /* 11f */
	.byte 0x67 /* 120 */
	.byte 0x76 /* 121 */
	.byte 0x46 /* 122 */
	.byte 0x77 /* 123 */
	.byte 0x00 /* 124 */
	.byte 0x00 /* 125 */
	.byte 0x00 /* 126 */
	.byte 0x02 /* 127 */
	.byte 0x1a /* 128 */
	.byte 0x00 /* 129 */
	.byte 0x00 /* 12a */
	.byte 0x22 /* 12b */
	.byte 0x66 /* 12c */
	.byte 0x04 /* 12d */
	.byte 0x67 /* 12e */
	.byte 0x67 /* 12f */
	.byte 0x67 /* 130 */
	.byte 0x50 /* 131 */
	.byte 0x00 /* 132 */
	.byte 0x00 /* 133 */
	.byte 0x00 /* 134 */
	.byte 0x67 /* 135 */
	.byte 0x74 /* 136 */
	.byte 0x76 /* 137 */
	.byte 0x76 /* 138 */
	.byte 0x56 /* 139 */
	.byte 0x47 /* 13a */
	.byte 0x74 /* 13b */
	.byte 0x73 /* 13c */
	.byte 0x00 /* 13d */
	.byte 0x00 /* 13e */
	.byte 0x00 /* 13f */
	.byte 0x02 /* 140 */
	.byte 0x1a /* 141 */
	.byte 0x00 /* 142 */
	.byte 0x00 /* 143 */
	.byte 0x22 /* 144 */
	.byte 0x46 /* 145 */
	.byte 0x76 /* 146 */
	.byte 0x74 /* 147 */
	.byte 0x76 /* 148 */
	.byte 0x77 /* 149 */
	.byte 0x60 /* 14a */
	.byte 0x00 /* 14b */
	.byte 0x00 /* 14c */
	.byte 0x06 /* 14d */
	.byte 0x76 /* 14e */
	.byte 0x46 /* 14f */
	.byte 0x64 /* 150 */
	.byte 0x76 /* 151 */
	.byte 0x76 /* 152 */
	.byte 0x76 /* 153 */
	.byte 0x77 /* 154 */
	.byte 0x70 /* 155 */
	.byte 0x00 /* 156 */
	.byte 0x00 /* 157 */
	.byte 0x00 /* 158 */
	.byte 0x02 /* 159 */
	.byte 0x1a /* 15a */
	.byte 0x00 /* 15b */
	.byte 0x00 /* 15c */
	.byte 0x22 /* 15d */
	.byte 0x27 /* 15e */
	.byte 0x46 /* 15f */
	.byte 0x47 /* 160 */
	.byte 0x64 /* 161 */
	.byte 0x76 /* 162 */
	.byte 0x00 /* 163 */
	.byte 0x00 /* 164 */
	.byte 0x00 /* 165 */
	.byte 0x07 /* 166 */
	.byte 0x42 /* 167 */
	.byte 0x46 /* 168 */
	.byte 0x47 /* 169 */
	.byte 0x65 /* 16a */
	.byte 0x65 /* 16b */
	.byte 0x64 /* 16c */
	.byte 0x67 /* 16d */
	.byte 0x60 /* 16e */
	.byte 0x00 /* 16f */
	.byte 0x00 /* 170 */
	.byte 0x00 /* 171 */
	.byte 0x02 /* 172 */
	.byte 0x1a /* 173 */
	.byte 0x00 /* 174 */
	.byte 0x00 /* 175 */
	.byte 0x20 /* 176 */
	.byte 0x46 /* 177 */
	.byte 0x76 /* 178 */
	.byte 0x76 /* 179 */
	.byte 0x77 /* 17a */
	.byte 0x77 /* 17b */
	.byte 0x00 /* 17c */
	.byte 0x00 /* 17d */
	.byte 0x00 /* 17e */
	.byte 0x76 /* 17f */
	.byte 0x64 /* 180 */
	.byte 0x24 /* 181 */
	.byte 0x24 /* 182 */
	.byte 0x67 /* 183 */
	.byte 0x67 /* 184 */
	.byte 0x67 /* 185 */
	.byte 0x77 /* 186 */
	.byte 0x00 /* 187 */
	.byte 0x00 /* 188 */
	.byte 0x00 /* 189 */
	.byte 0x02 /* 18a */
	.byte 0x1a /* 18b */
	.byte 0x00 /* 18c */
	.byte 0x00 /* 18d */
	.byte 0x14 /* 18e */
	.byte 0x76 /* 18f */
	.byte 0x46 /* 190 */
	.byte 0x77 /* 191 */
	.byte 0x77 /* 192 */
	.byte 0x77 /* 193 */
	.byte 0x60 /* 194 */
	.byte 0x00 /* 195 */
	.byte 0x04 /* 196 */
	.byte 0x76 /* 197 */
	.byte 0x44 /* 198 */
	.byte 0x08 /* 199 */
	.byte 0x46 /* 19a */
	.byte 0x02 /* 19b */
	.byte 0x67 /* 19c */
	.byte 0x02 /* 19d */
	.byte 0x60 /* 19e */
	.byte 0x00 /* 19f */
	.byte 0x00 /* 1a0 */
	.byte 0x00 /* 1a1 */
	.byte 0x02 /* 1a2 */
	.byte 0x1a /* 1a3 */
	.byte 0x00 /* 1a4 */
	.byte 0x00 /* 1a5 */
	.byte 0x1e /* 1a6 */
	.byte 0x64 /* 1a7 */
	.byte 0x64 /* 1a8 */
	.byte 0x67 /* 1a9 */
	.byte 0x66 /* 1aa */
	.byte 0x76 /* 1ab */
	.byte 0x77 /* 1ac */
	.byte 0x60 /* 1ad */
	.byte 0x07 /* 1ae */
	.byte 0x63 /* 1af */
	.byte 0x60 /* 1b0 */
	.byte 0x52 /* 1b1 */
	.byte 0x46 /* 1b2 */
	.byte 0x67 /* 1b3 */
	.byte 0x67 /* 1b4 */
	.byte 0x74 /* 1b5 */
	.byte 0x00 /* 1b6 */
	.byte 0x00 /* 1b7 */
	.byte 0x00 /* 1b8 */
	.byte 0x02 /* 1b9 */
	.byte 0x19 /* 1ba */
	.byte 0x00 /* 1bb */
	.byte 0x00 /* 1bc */
	.byte 0x22 /* 1bd */
	.byte 0x66 /* 1be */
	.byte 0x04 /* 1bf */
	.byte 0x25 /* 1c0 */
	.byte 0x21 /* 1c1 */
	.byte 0x11 /* 1c2 */
	.byte 0x30 /* 1c3 */
	.byte 0x11 /* 1c4 */
	.byte 0x31 /* 1c5 */
	.byte 0x01 /* 1c6 */
	.byte 0x11 /* 1c7 */
	.byte 0x13 /* 1c8 */
	.byte 0x11 /* 1c9 */
	.byte 0x31 /* 1ca */
	.byte 0x33 /* 1cb */
	.byte 0x31 /* 1cc */
	.byte 0x01 /* 1cd */
	.byte 0x03 /* 1ce */
	.byte 0x00 /* 1cf */
	.byte 0x00 /* 1d0 */
	.byte 0x00 /* 1d1 */
	.byte 0x02 /* 1d2 */
	.byte 0x19 /* 1d3 */
	.byte 0x00 /* 1d4 */
	.byte 0x00 /* 1d5 */
	.byte 0x24 /* 1d6 */
	.byte 0x13 /* 1d7 */
	.byte 0x33 /* 1d8 */
	.byte 0x13 /* 1d9 */
	.byte 0x11 /* 1da */
	.byte 0x31 /* 1db */
	.byte 0x11 /* 1dc */
	.byte 0x01 /* 1dd */
	.byte 0x00 /* 1de */
	.byte 0x10 /* 1df */
	.byte 0x00 /* 1e0 */
	.byte 0x00 /* 1e1 */
	.byte 0x01 /* 1e2 */
	.byte 0x01 /* 1e3 */
	.byte 0x01 /* 1e4 */
	.byte 0x33 /* 1e5 */
	.byte 0x13 /* 1e6 */
	.byte 0x31 /* 1e7 */
	.byte 0x31 /* 1e8 */
	.byte 0x00 /* 1e9 */
	.byte 0x00 /* 1ea */
	.byte 0x00 /* 1eb */
	.byte 0x02 /* 1ec */
	.byte 0x16 /* 1ed */
	.byte 0x00 /* 1ee */
	.byte 0x00 /* 1ef */
	.byte 0x28 /* 1f0 */
	.byte 0x21 /* 1f1 */
	.byte 0x33 /* 1f2 */
	.byte 0x11 /* 1f3 */
	.byte 0x31 /* 1f4 */
	.byte 0x11 /* 1f5 */
	.byte 0x31 /* 1f6 */
	.byte 0x00 /* 1f7 */
	.byte 0x11 /* 1f8 */
	.byte 0x01 /* 1f9 */
	.byte 0x03 /* 1fa */
	.byte 0x11 /* 1fb */
	.byte 0x11 /* 1fc */
	.byte 0x11 /* 1fd */
	.byte 0x10 /* 1fe */
	.byte 0x01 /* 1ff */
	.byte 0x00 /* 200 */
	.byte 0x13 /* 201 */
	.byte 0x13 /* 202 */
	.byte 0x11 /* 203 */
	.byte 0x33 /* 204 */
	.byte 0x00 /* 205 */
	.byte 0x00 /* 206 */
	.byte 0x00 /* 207 */
	.byte 0x02 /* 208 */
	.byte 0x14 /* 209 */
	.byte 0x00 /* 20a */
	.byte 0x00 /* 20b */
	.byte 0x16 /* 20c */
	.byte 0x31 /* 20d */
	.byte 0x13 /* 20e */
	.byte 0x11 /* 20f */
	.byte 0x13 /* 210 */
	.byte 0x11 /* 211 */
	.byte 0x13 /* 212 */
	.byte 0x10 /* 213 */
	.byte 0x01 /* 214 */
	.byte 0x01 /* 215 */
	.byte 0x10 /* 216 */
	.byte 0x11 /* 217 */
	.byte 0x08 /* 218 */
	.byte 0x13 /* 219 */
	.byte 0x00 /* 21a */
	.byte 0x0e /* 21b */
	.byte 0x10 /* 21c */
	.byte 0x11 /* 21d */
	.byte 0x31 /* 21e */
	.byte 0x11 /* 21f */
	.byte 0x13 /* 220 */
	.byte 0x11 /* 221 */
	.byte 0x30 /* 222 */
	.byte 0x00 /* 223 */
	.byte 0x00 /* 224 */
	.byte 0x00 /* 225 */
	.byte 0x02 /* 226 */
	.byte 0x11 /* 227 */
	.byte 0x00 /* 228 */
	.byte 0x00 /* 229 */
	.byte 0x30 /* 22a */
	.byte 0x11 /* 22b */
	.byte 0x31 /* 22c */
	.byte 0x13 /* 22d */
	.byte 0x13 /* 22e */
	.byte 0x03 /* 22f */
	.byte 0x11 /* 230 */
	.byte 0x33 /* 231 */
	.byte 0x13 /* 232 */
	.byte 0x13 /* 233 */
	.byte 0x13 /* 234 */
	.byte 0x10 /* 235 */
	.byte 0x10 /* 236 */
	.byte 0x10 /* 237 */
	.byte 0x11 /* 238 */
	.byte 0x10 /* 239 */
	.byte 0x10 /* 23a */
	.byte 0x11 /* 23b */
	.byte 0x11 /* 23c */
	.byte 0x11 /* 23d */
	.byte 0x10 /* 23e */
	.byte 0x11 /* 23f */
	.byte 0x11 /* 240 */
	.byte 0x33 /* 241 */
	.byte 0x10 /* 242 */
	.byte 0x00 /* 243 */
	.byte 0x00 /* 244 */
	.byte 0x00 /* 245 */
	.byte 0x02 /* 246 */
	.byte 0x14 /* 247 */
	.byte 0x00 /* 248 */
	.byte 0x00 /* 249 */
	.byte 0x2e /* 24a */
	.byte 0x31 /* 24b */
	.byte 0x31 /* 24c */
	.byte 0x31 /* 24d */
	.byte 0x10 /* 24e */
	.byte 0x00 /* 24f */
	.byte 0x13 /* 250 */
	.byte 0x77 /* 251 */
	.byte 0x11 /* 252 */
	.byte 0x11 /* 253 */
	.byte 0x11 /* 254 */
	.byte 0x10 /* 255 */
	.byte 0x10 /* 256 */
	.byte 0x00 /* 257 */
	.byte 0x11 /* 258 */
	.byte 0x11 /* 259 */
	.byte 0x11 /* 25a */
	.byte 0x31 /* 25b */
	.byte 0x11 /* 25c */
	.byte 0x10 /* 25d */
	.byte 0x01 /* 25e */
	.byte 0x01 /* 25f */
	.byte 0x13 /* 260 */
	.byte 0x10 /* 261 */
	.byte 0x00 /* 262 */
	.byte 0x00 /* 263 */
	.byte 0x00 /* 264 */
	.byte 0x02 /* 265 */
	.byte 0x10 /* 266 */
	.byte 0x00 /* 267 */
	.byte 0x00 /* 268 */
	.byte 0x32 /* 269 */
	.byte 0x31 /* 26a */
	.byte 0x13 /* 26b */
	.byte 0x13 /* 26c */
	.byte 0x33 /* 26d */
	.byte 0x11 /* 26e */
	.byte 0x00 /* 26f */
	.byte 0x03 /* 270 */
	.byte 0x13 /* 271 */
	.byte 0x13 /* 272 */
	.byte 0x67 /* 273 */
	.byte 0x21 /* 274 */
	.byte 0x11 /* 275 */
	.byte 0x11 /* 276 */
	.byte 0x11 /* 277 */
	.byte 0x33 /* 278 */
	.byte 0x33 /* 279 */
	.byte 0x13 /* 27a */
	.byte 0x11 /* 27b */
	.byte 0x11 /* 27c */
	.byte 0x10 /* 27d */
	.byte 0x00 /* 27e */
	.byte 0x00 /* 27f */
	.byte 0x10 /* 280 */
	.byte 0x11 /* 281 */
	.byte 0x30 /* 282 */
	.byte 0x00 /* 283 */
	.byte 0x00 /* 284 */
	.byte 0x00 /* 285 */
	.byte 0x02 /* 286 */
	.byte 0x0e /* 287 */
	.byte 0x00 /* 288 */
	.byte 0x00 /* 289 */
	.byte 0x34 /* 28a */
	.byte 0x13 /* 28b */
	.byte 0x33 /* 28c */
	.byte 0x33 /* 28d */
	.byte 0x33 /* 28e */
	.byte 0x11 /* 28f */
	.byte 0x10 /* 290 */
	.byte 0x00 /* 291 */
	.byte 0x31 /* 292 */
	.byte 0x37 /* 293 */
	.byte 0x20 /* 294 */
	.byte 0x34 /* 295 */
	.byte 0x61 /* 296 */
	.byte 0x66 /* 297 */
	.byte 0x37 /* 298 */
	.byte 0x67 /* 299 */
	.byte 0x11 /* 29a */
	.byte 0x11 /* 29b */
	.byte 0x11 /* 29c */
	.byte 0x31 /* 29d */
	.byte 0x11 /* 29e */
	.byte 0x01 /* 29f */
	.byte 0x10 /* 2a0 */
	.byte 0x00 /* 2a1 */
	.byte 0x01 /* 2a2 */
	.byte 0x11 /* 2a3 */
	.byte 0x30 /* 2a4 */
	.byte 0x00 /* 2a5 */
	.byte 0x00 /* 2a6 */
	.byte 0x00 /* 2a7 */
	.byte 0x02 /* 2a8 */
	.byte 0x0d /* 2a9 */
	.byte 0x00 /* 2aa */
	.byte 0x00 /* 2ab */
	.byte 0x34 /* 2ac */
	.byte 0x13 /* 2ad */
	.byte 0x11 /* 2ae */
	.byte 0x00 /* 2af */
	.byte 0x33 /* 2b0 */
	.byte 0x31 /* 2b1 */
	.byte 0x00 /* 2b2 */
	.byte 0x03 /* 2b3 */
	.byte 0x10 /* 2b4 */
	.byte 0x06 /* 2b5 */
	.byte 0x31 /* 2b6 */
	.byte 0x44 /* 2b7 */
	.byte 0x24 /* 2b8 */
	.byte 0x13 /* 2b9 */
	.byte 0x17 /* 2ba */
	.byte 0x67 /* 2bb */
	.byte 0x31 /* 2bc */
	.byte 0x31 /* 2bd */
	.byte 0x33 /* 2be */
	.byte 0x33 /* 2bf */
	.byte 0x11 /* 2c0 */
	.byte 0x10 /* 2c1 */
	.byte 0x10 /* 2c2 */
	.byte 0x00 /* 2c3 */
	.byte 0x00 /* 2c4 */
	.byte 0x01 /* 2c5 */
	.byte 0x13 /* 2c6 */
	.byte 0x00 /* 2c7 */
	.byte 0x00 /* 2c8 */
	.byte 0x00 /* 2c9 */
	.byte 0x02 /* 2ca */
	.byte 0x0d /* 2cb */
	.byte 0x00 /* 2cc */
	.byte 0x00 /* 2cd */
	.byte 0x34 /* 2ce */
	.byte 0x33 /* 2cf */
	.byte 0x00 /* 2d0 */
	.byte 0x00 /* 2d1 */
	.byte 0x00 /* 2d2 */
	.byte 0x13 /* 2d3 */
	.byte 0x00 /* 2d4 */
	.byte 0x73 /* 2d5 */
	.byte 0x70 /* 2d6 */
	.byte 0x00 /* 2d7 */
	.byte 0x44 /* 2d8 */
	.byte 0x00 /* 2d9 */
	.byte 0x43 /* 2da */
	.byte 0x33 /* 2db */
	.byte 0x11 /* 2dc */
	.byte 0x31 /* 2dd */
	.byte 0x33 /* 2de */
	.byte 0x13 /* 2df */
	.byte 0x13 /* 2e0 */
	.byte 0x11 /* 2e1 */
	.byte 0x33 /* 2e2 */
	.byte 0x31 /* 2e3 */
	.byte 0x31 /* 2e4 */
	.byte 0x00 /* 2e5 */
	.byte 0x00 /* 2e6 */
	.byte 0x01 /* 2e7 */
	.byte 0x17 /* 2e8 */
	.byte 0x00 /* 2e9 */
	.byte 0x00 /* 2ea */
	.byte 0x00 /* 2eb */
	.byte 0x02 /* 2ec */
	.byte 0x0b /* 2ed */
	.byte 0x00 /* 2ee */
	.byte 0x00 /* 2ef */
	.byte 0x36 /* 2f0 */
	.byte 0x13 /* 2f1 */
	.byte 0x00 /* 2f2 */
	.byte 0x00 /* 2f3 */
	.byte 0x01 /* 2f4 */
	.byte 0x31 /* 2f5 */
	.byte 0x11 /* 2f6 */
	.byte 0x33 /* 2f7 */
	.byte 0x33 /* 2f8 */
	.byte 0x73 /* 2f9 */
	.byte 0x67 /* 2fa */
	.byte 0x60 /* 2fb */
	.byte 0x40 /* 2fc */
	.byte 0x44 /* 2fd */
	.byte 0x07 /* 2fe */
	.byte 0x63 /* 2ff */
	.byte 0x17 /* 300 */
	.byte 0x31 /* 301 */
	.byte 0x75 /* 302 */
	.byte 0x35 /* 303 */
	.byte 0x33 /* 304 */
	.byte 0x01 /* 305 */
	.byte 0x33 /* 306 */
	.byte 0x11 /* 307 */
	.byte 0x00 /* 308 */
	.byte 0x00 /* 309 */
	.byte 0x11 /* 30a */
	.byte 0x13 /* 30b */
	.byte 0x00 /* 30c */
	.byte 0x00 /* 30d */
	.byte 0x00 /* 30e */
	.byte 0x02 /* 30f */
	.byte 0x09 /* 310 */
	.byte 0x00 /* 311 */
	.byte 0x00 /* 312 */
	.byte 0x38 /* 313 */
	.byte 0x13 /* 314 */
	.byte 0x10 /* 315 */
	.byte 0x00 /* 316 */
	.byte 0x00 /* 317 */
	.byte 0x00 /* 318 */
	.byte 0x12 /* 319 */
	.byte 0x37 /* 31a */
	.byte 0x73 /* 31b */
	.byte 0x73 /* 31c */
	.byte 0x17 /* 31d */
	.byte 0x73 /* 31e */
	.byte 0x70 /* 31f */
	.byte 0x46 /* 320 */
	.byte 0x06 /* 321 */
	.byte 0x73 /* 322 */
	.byte 0x47 /* 323 */
	.byte 0x73 /* 324 */
	.byte 0x16 /* 325 */
	.byte 0x76 /* 326 */
	.byte 0x73 /* 327 */
	.byte 0x00 /* 328 */
	.byte 0x12 /* 329 */
	.byte 0x11 /* 32a */
	.byte 0x10 /* 32b */
	.byte 0x01 /* 32c */
	.byte 0x01 /* 32d */
	.byte 0x11 /* 32e */
	.byte 0x31 /* 32f */
	.byte 0x00 /* 330 */
	.byte 0x00 /* 331 */
	.byte 0x00 /* 332 */
	.byte 0x02 /* 333 */
	.byte 0x07 /* 334 */
	.byte 0x00 /* 335 */
	.byte 0x00 /* 336 */
	.byte 0x06 /* 337 */
	.byte 0x30 /* 338 */
	.byte 0x31 /* 339 */
	.byte 0x30 /* 33a */
	.byte 0x08 /* 33b */
	.byte 0x00 /* 33c */
	.byte 0x00 /* 33d */
	.byte 0x2c /* 33e */
	.byte 0x07 /* 33f */
	.byte 0x33 /* 340 */
	.byte 0x33 /* 341 */
	.byte 0x23 /* 342 */
	.byte 0x15 /* 343 */
	.byte 0x64 /* 344 */
	.byte 0x60 /* 345 */
	.byte 0x64 /* 346 */
	.byte 0x31 /* 347 */
	.byte 0x36 /* 348 */
	.byte 0x67 /* 349 */
	.byte 0x77 /* 34a */
	.byte 0x77 /* 34b */
	.byte 0x74 /* 34c */
	.byte 0x01 /* 34d */
	.byte 0x71 /* 34e */
	.byte 0x33 /* 34f */
	.byte 0x10 /* 350 */
	.byte 0x00 /* 351 */
	.byte 0x11 /* 352 */
	.byte 0x33 /* 353 */
	.byte 0x10 /* 354 */
	.byte 0x00 /* 355 */
	.byte 0x00 /* 356 */
	.byte 0x00 /* 357 */
	.byte 0x02 /* 358 */
	.byte 0x05 /* 359 */
	.byte 0x00 /* 35a */
	.byte 0x02 /* 35b */
	.byte 0x30 /* 35c */
	.byte 0x0a /* 35d */
	.byte 0x00 /* 35e */
	.byte 0x00 /* 35f */
	.byte 0x2e /* 360 */
	.byte 0x01 /* 361 */
	.byte 0x61 /* 362 */
	.byte 0x00 /* 363 */
	.byte 0x37 /* 364 */
	.byte 0x37 /* 365 */
	.byte 0x13 /* 366 */
	.byte 0x03 /* 367 */
	.byte 0x64 /* 368 */
	.byte 0x44 /* 369 */
	.byte 0x46 /* 36a */
	.byte 0x11 /* 36b */
	.byte 0x11 /* 36c */
	.byte 0x64 /* 36d */
	.byte 0x73 /* 36e */
	.byte 0x33 /* 36f */
	.byte 0x70 /* 370 */
	.byte 0x06 /* 371 */
	.byte 0x00 /* 372 */
	.byte 0x01 /* 373 */
	.byte 0x33 /* 374 */
	.byte 0x13 /* 375 */
	.byte 0x13 /* 376 */
	.byte 0x11 /* 377 */
	.byte 0x00 /* 378 */
	.byte 0x00 /* 379 */
	.byte 0x00 /* 37a */
	.byte 0x02 /* 37b */
	.byte 0x08 /* 37c */
	.byte 0x00 /* 37d */
	.byte 0x02 /* 37e */
	.byte 0x10 /* 37f */
	.byte 0x08 /* 380 */
	.byte 0x00 /* 381 */
	.byte 0x00 /* 382 */
	.byte 0x2e /* 383 */
	.byte 0x61 /* 384 */
	.byte 0x03 /* 385 */
	.byte 0x10 /* 386 */
	.byte 0x37 /* 387 */
	.byte 0x73 /* 388 */
	.byte 0x37 /* 389 */
	.byte 0x47 /* 38a */
	.byte 0x27 /* 38b */
	.byte 0x37 /* 38c */
	.byte 0x74 /* 38d */
	.byte 0x01 /* 38e */
	.byte 0x76 /* 38f */
	.byte 0x73 /* 390 */
	.byte 0x77 /* 391 */
	.byte 0x73 /* 392 */
	.byte 0x63 /* 393 */
	.byte 0x12 /* 394 */
	.byte 0x00 /* 395 */
	.byte 0x00 /* 396 */
	.byte 0x13 /* 397 */
	.byte 0x13 /* 398 */
	.byte 0x10 /* 399 */
	.byte 0x10 /* 39a */
	.byte 0x00 /* 39b */
	.byte 0x00 /* 39c */
	.byte 0x00 /* 39d */
	.byte 0x02 /* 39e */
	.byte 0x07 /* 39f */
	.byte 0x00 /* 3a0 */
	.byte 0x02 /* 3a1 */
	.byte 0x12 /* 3a2 */
	.byte 0x08 /* 3a3 */
	.byte 0x00 /* 3a4 */
	.byte 0x00 /* 3a5 */
	.byte 0x30 /* 3a6 */
	.byte 0x61 /* 3a7 */
	.byte 0x10 /* 3a8 */
	.byte 0x10 /* 3a9 */
	.byte 0x13 /* 3aa */
	.byte 0x73 /* 3ab */
	.byte 0x73 /* 3ac */
	.byte 0x06 /* 3ad */
	.byte 0x33 /* 3ae */
	.byte 0x37 /* 3af */
	.byte 0x36 /* 3b0 */
	.byte 0x60 /* 3b1 */
	.byte 0x46 /* 3b2 */
	.byte 0x13 /* 3b3 */
	.byte 0x33 /* 3b4 */
	.byte 0x33 /* 3b5 */
	.byte 0x73 /* 3b6 */
	.byte 0x30 /* 3b7 */
	.byte 0x41 /* 3b8 */
	.byte 0x00 /* 3b9 */
	.byte 0x00 /* 3ba */
	.byte 0x01 /* 3bb */
	.byte 0x00 /* 3bc */
	.byte 0x11 /* 3bd */
	.byte 0x30 /* 3be */
	.byte 0x00 /* 3bf */
	.byte 0x00 /* 3c0 */
	.byte 0x00 /* 3c1 */
	.byte 0x02 /* 3c2 */
	.byte 0x11 /* 3c3 */
	.byte 0x00 /* 3c4 */
	.byte 0x00 /* 3c5 */
	.byte 0x2c /* 3c6 */
	.byte 0x71 /* 3c7 */
	.byte 0x01 /* 3c8 */
	.byte 0x01 /* 3c9 */
	.byte 0x03 /* 3ca */
	.byte 0x00 /* 3cb */
	.byte 0x07 /* 3cc */
	.byte 0x34 /* 3cd */
	.byte 0x73 /* 3ce */
	.byte 0x73 /* 3cf */
	.byte 0x33 /* 3d0 */
	.byte 0x44 /* 3d1 */
	.byte 0x67 /* 3d2 */
	.byte 0x32 /* 3d3 */
	.byte 0x13 /* 3d4 */
	.byte 0x21 /* 3d5 */
	.byte 0x31 /* 3d6 */
	.byte 0x30 /* 3d7 */
	.byte 0x04 /* 3d8 */
	.byte 0x00 /* 3d9 */
	.byte 0x00 /* 3da */
	.byte 0x00 /* 3db */
	.byte 0x11 /* 3dc */
	.byte 0x00 /* 3dd */
	.byte 0x00 /* 3de */
	.byte 0x00 /* 3df */
	.byte 0x02 /* 3e0 */
	.byte 0x07 /* 3e1 */
	.byte 0x00 /* 3e2 */
	.byte 0x02 /* 3e3 */
	.byte 0x30 /* 3e4 */
	.byte 0x0c /* 3e5 */
	.byte 0x00 /* 3e6 */
	.byte 0x00 /* 3e7 */
	.byte 0x2a /* 3e8 */
	.byte 0x10 /* 3e9 */
	.byte 0x10 /* 3ea */
	.byte 0x00 /* 3eb */
	.byte 0x03 /* 3ec */
	.byte 0x33 /* 3ed */
	.byte 0x47 /* 3ee */
	.byte 0x37 /* 3ef */
	.byte 0x77 /* 3f0 */
	.byte 0x64 /* 3f1 */
	.byte 0x63 /* 3f2 */
	.byte 0x13 /* 3f3 */
	.byte 0x31 /* 3f4 */
	.byte 0x33 /* 3f5 */
	.byte 0x33 /* 3f6 */
	.byte 0x33 /* 3f7 */
	.byte 0x00 /* 3f8 */
	.byte 0x07 /* 3f9 */
	.byte 0x00 /* 3fa */
	.byte 0x01 /* 3fb */
	.byte 0x03 /* 3fc */
	.byte 0x10 /* 3fd */
	.byte 0x00 /* 3fe */
	.byte 0x00 /* 3ff */
	.byte 0x00 /* 400 */
	.byte 0x02 /* 401 */
	.byte 0x06 /* 402 */
	.byte 0x00 /* 403 */
	.byte 0x02 /* 404 */
	.byte 0x10 /* 405 */
	.byte 0x0a /* 406 */
	.byte 0x00 /* 407 */
	.byte 0x00 /* 408 */
	.byte 0x24 /* 409 */
	.byte 0x06 /* 40a */
	.byte 0x10 /* 40b */
	.byte 0x70 /* 40c */
	.byte 0x10 /* 40d */
	.byte 0x00 /* 40e */
	.byte 0x00 /* 40f */
	.byte 0x30 /* 410 */
	.byte 0x01 /* 411 */
	.byte 0x03 /* 412 */
	.byte 0x77 /* 413 */
	.byte 0x64 /* 414 */
	.byte 0x33 /* 415 */
	.byte 0x12 /* 416 */
	.byte 0x30 /* 417 */
	.byte 0x12 /* 418 */
	.byte 0x30 /* 419 */
	.byte 0x33 /* 41a */
	.byte 0x30 /* 41b */
	.byte 0x00 /* 41c */
	.byte 0x00 /* 41d */
	.byte 0x00 /* 41e */
	.byte 0x02 /* 41f */
	.byte 0x15 /* 420 */
	.byte 0x00 /* 421 */
	.byte 0x00 /* 422 */
	.byte 0x20 /* 423 */
	.byte 0x10 /* 424 */
	.byte 0x01 /* 425 */
	.byte 0x10 /* 426 */
	.byte 0x00 /* 427 */
	.byte 0x10 /* 428 */
	.byte 0x10 /* 429 */
	.byte 0x01 /* 42a */
	.byte 0x11 /* 42b */
	.byte 0x77 /* 42c */
	.byte 0x67 /* 42d */
	.byte 0x30 /* 42e */
	.byte 0x31 /* 42f */
	.byte 0x33 /* 430 */
	.byte 0x31 /* 431 */
	.byte 0x33 /* 432 */
	.byte 0x33 /* 433 */
	.byte 0x00 /* 434 */
	.byte 0x00 /* 435 */
	.byte 0x00 /* 436 */
	.byte 0x02 /* 437 */
	.byte 0x15 /* 438 */
	.byte 0x00 /* 439 */
	.byte 0x00 /* 43a */
	.byte 0x1e /* 43b */
	.byte 0x10 /* 43c */
	.byte 0x00 /* 43d */
	.byte 0x20 /* 43e */
	.byte 0x01 /* 43f */
	.byte 0x27 /* 440 */
	.byte 0x73 /* 441 */
	.byte 0x12 /* 442 */
	.byte 0x00 /* 443 */
	.byte 0x01 /* 444 */
	.byte 0x77 /* 445 */
	.byte 0x73 /* 446 */
	.byte 0x33 /* 447 */
	.byte 0x33 /* 448 */
	.byte 0x33 /* 449 */
	.byte 0x33 /* 44a */
	.byte 0x00 /* 44b */
	.byte 0x00 /* 44c */
	.byte 0x00 /* 44d */
	.byte 0x02 /* 44e */
	.byte 0x19 /* 44f */
	.byte 0x00 /* 450 */
	.byte 0x00 /* 451 */
	.byte 0x16 /* 452 */
	.byte 0x10 /* 453 */
	.byte 0x10 /* 454 */
	.byte 0x11 /* 455 */
	.byte 0x77 /* 456 */
	.byte 0x77 /* 457 */
	.byte 0x30 /* 458 */
	.byte 0x10 /* 459 */
	.byte 0x03 /* 45a */
	.byte 0x77 /* 45b */
	.byte 0x30 /* 45c */
	.byte 0x30 /* 45d */
	.byte 0x00 /* 45e */
	.byte 0x00 /* 45f */
	.byte 0x00 /* 460 */
	.byte 0x02 /* 461 */
	.byte 0x05 /* 462 */
	.byte 0x00 /* 463 */
	.byte 0x02 /* 464 */
	.byte 0x10 /* 465 */
	.byte 0x0e /* 466 */
	.byte 0x00 /* 467 */
	.byte 0x00 /* 468 */
	.byte 0x16 /* 469 */
	.byte 0x07 /* 46a */
	.byte 0x10 /* 46b */
	.byte 0x00 /* 46c */
	.byte 0x00 /* 46d */
	.byte 0x00 /* 46e */
	.byte 0x07 /* 46f */
	.byte 0x77 /* 470 */
	.byte 0x73 /* 471 */
	.byte 0x21 /* 472 */
	.byte 0x00 /* 473 */
	.byte 0x67 /* 474 */
	.byte 0x00 /* 475 */
	.byte 0x00 /* 476 */
	.byte 0x00 /* 477 */
	.byte 0x02 /* 478 */
	.byte 0x1e /* 479 */
	.byte 0x00 /* 47a */
	.byte 0x00 /* 47b */
	.byte 0x0e /* 47c */
	.byte 0x30 /* 47d */
	.byte 0x77 /* 47e */
	.byte 0x77 /* 47f */
	.byte 0x71 /* 480 */
	.byte 0x03 /* 481 */
	.byte 0x01 /* 482 */
	.byte 0x77 /* 483 */
	.byte 0x00 /* 484 */
	.byte 0x00 /* 485 */
	.byte 0x00 /* 486 */
	.byte 0x02 /* 487 */
	.byte 0x1d /* 488 */
	.byte 0x00 /* 489 */
	.byte 0x00 /* 48a */
	.byte 0x10 /* 48b */
	.byte 0x10 /* 48c */
	.byte 0x13 /* 48d */
	.byte 0x31 /* 48e */
	.byte 0x77 /* 48f */
	.byte 0x70 /* 490 */
	.byte 0x01 /* 491 */
	.byte 0x00 /* 492 */
	.byte 0x30 /* 493 */
	.byte 0x00 /* 494 */
	.byte 0x00 /* 495 */
	.byte 0x00 /* 496 */
	.byte 0x02 /* 497 */
	.byte 0x18 /* 498 */
	.byte 0x00 /* 499 */
	.byte 0x00 /* 49a */
	.byte 0x16 /* 49b */
	.byte 0x25 /* 49c */
	.byte 0x00 /* 49d */
	.byte 0x00 /* 49e */
	.byte 0x03 /* 49f */
	.byte 0x00 /* 4a0 */
	.byte 0x00 /* 4a1 */
	.byte 0x73 /* 4a2 */
	.byte 0x10 /* 4a3 */
	.byte 0x77 /* 4a4 */
	.byte 0x30 /* 4a5 */
	.byte 0x10 /* 4a6 */
	.byte 0x00 /* 4a7 */
	.byte 0x00 /* 4a8 */
	.byte 0x00 /* 4a9 */
	.byte 0x02 /* 4aa */
	.byte 0x19 /* 4ab */
	.byte 0x00 /* 4ac */
	.byte 0x00 /* 4ad */
	.byte 0x16 /* 4ae */
	.byte 0x30 /* 4af */
	.byte 0x00 /* 4b0 */
	.byte 0x12 /* 4b1 */
	.byte 0x10 /* 4b2 */
	.byte 0x07 /* 4b3 */
	.byte 0x00 /* 4b4 */
	.byte 0x02 /* 4b5 */
	.byte 0x13 /* 4b6 */
	.byte 0x75 /* 4b7 */
	.byte 0x21 /* 4b8 */
	.byte 0x20 /* 4b9 */
	.byte 0x00 /* 4ba */
	.byte 0x00 /* 4bb */
	.byte 0x00 /* 4bc */
	.byte 0x02 /* 4bd */
	.byte 0x1b /* 4be */
	.byte 0x00 /* 4bf */
	.byte 0x00 /* 4c0 */
	.byte 0x14 /* 4c1 */
	.byte 0x64 /* 4c2 */
	.byte 0x00 /* 4c3 */
	.byte 0x00 /* 4c4 */
	.byte 0x67 /* 4c5 */
	.byte 0x61 /* 4c6 */
	.byte 0x31 /* 4c7 */
	.byte 0x77 /* 4c8 */
	.byte 0x72 /* 4c9 */
	.byte 0x13 /* 4ca */
	.byte 0x11 /* 4cb */
	.byte 0x00 /* 4cc */
	.byte 0x00 /* 4cd */
	.byte 0x00 /* 4ce */
	.byte 0x02 /* 4cf */
	.byte 0x19 /* 4d0 */
	.byte 0x00 /* 4d1 */
	.byte 0x00 /* 4d2 */
	.byte 0x14 /* 4d3 */
	.byte 0x10 /* 4d4 */
	.byte 0x77 /* 4d5 */
	.byte 0x01 /* 4d6 */
	.byte 0x00 /* 4d7 */
	.byte 0x77 /* 4d8 */
	.byte 0x50 /* 4d9 */
	.byte 0x00 /* 4da */
	.byte 0x77 /* 4db */
	.byte 0x71 /* 4dc */
	.byte 0x13 /* 4dd */
	.byte 0x00 /* 4de */
	.byte 0x00 /* 4df */
	.byte 0x00 /* 4e0 */
	.byte 0x02 /* 4e1 */
	.byte 0x19 /* 4e2 */
	.byte 0x00 /* 4e3 */
	.byte 0x00 /* 4e4 */
	.byte 0x16 /* 4e5 */
	.byte 0x20 /* 4e6 */
	.byte 0x72 /* 4e7 */
	.byte 0x00 /* 4e8 */
	.byte 0x50 /* 4e9 */
	.byte 0x04 /* 4ea */
	.byte 0x61 /* 4eb */
	.byte 0x31 /* 4ec */
	.byte 0x27 /* 4ed */
	.byte 0x73 /* 4ee */
	.byte 0x20 /* 4ef */
	.byte 0x33 /* 4f0 */
	.byte 0x00 /* 4f1 */
	.byte 0x00 /* 4f2 */
	.byte 0x00 /* 4f3 */
	.byte 0x02 /* 4f4 */
	.byte 0x19 /* 4f5 */
	.byte 0x00 /* 4f6 */
	.byte 0x00 /* 4f7 */
	.byte 0x16 /* 4f8 */
	.byte 0x10 /* 4f9 */
	.byte 0x45 /* 4fa */
	.byte 0x01 /* 4fb */
	.byte 0x37 /* 4fc */
	.byte 0x40 /* 4fd */
	.byte 0x33 /* 4fe */
	.byte 0x03 /* 4ff */
	.byte 0x17 /* 500 */
	.byte 0x77 /* 501 */
	.byte 0x10 /* 502 */
	.byte 0x10 /* 503 */
	.byte 0x00 /* 504 */
	.byte 0x00 /* 505 */
	.byte 0x00 /* 506 */
	.byte 0x02 /* 507 */
	.byte 0x1a /* 508 */
	.byte 0x00 /* 509 */
	.byte 0x00 /* 50a */
	.byte 0x14 /* 50b */
	.byte 0x37 /* 50c */
	.byte 0x33 /* 50d */
	.byte 0x72 /* 50e */
	.byte 0x77 /* 50f */
	.byte 0x35 /* 510 */
	.byte 0x37 /* 511 */
	.byte 0x30 /* 512 */
	.byte 0x77 /* 513 */
	.byte 0x73 /* 514 */
	.byte 0x70 /* 515 */
	.byte 0x00 /* 516 */
	.byte 0x00 /* 517 */
	.byte 0x00 /* 518 */
	.byte 0x02 /* 519 */
	.byte 0x16 /* 51a */
	.byte 0x00 /* 51b */
	.byte 0x00 /* 51c */
	.byte 0x18 /* 51d */
	.byte 0x30 /* 51e */
	.byte 0x04 /* 51f */
	.byte 0x77 /* 520 */
	.byte 0x31 /* 521 */
	.byte 0x31 /* 522 */
	.byte 0x33 /* 523 */
	.byte 0x33 /* 524 */
	.byte 0x23 /* 525 */
	.byte 0x37 /* 526 */
	.byte 0x33 /* 527 */
	.byte 0x37 /* 528 */
	.byte 0x33 /* 529 */
	.byte 0x00 /* 52a */
	.byte 0x00 /* 52b */
	.byte 0x00 /* 52c */
	.byte 0x02 /* 52d */
	.byte 0x16 /* 52e */
	.byte 0x00 /* 52f */
	.byte 0x00 /* 530 */
	.byte 0x1a /* 531 */
	.byte 0x33 /* 532 */
	.byte 0x33 /* 533 */
	.byte 0x30 /* 534 */
	.byte 0x32 /* 535 */
	.byte 0x33 /* 536 */
	.byte 0x21 /* 537 */
	.byte 0x33 /* 538 */
	.byte 0x73 /* 539 */
	.byte 0x37 /* 53a */
	.byte 0x37 /* 53b */
	.byte 0x33 /* 53c */
	.byte 0x73 /* 53d */
	.byte 0x30 /* 53e */
	.byte 0x00 /* 53f */
	.byte 0x00 /* 540 */
	.byte 0x00 /* 541 */
	.byte 0x02 /* 542 */
	.byte 0x17 /* 543 */
	.byte 0x00 /* 544 */
	.byte 0x02 /* 545 */
	.byte 0x23 /* 546 */
	.byte 0x08 /* 547 */
	.byte 0x33 /* 548 */
	.byte 0x00 /* 549 */
	.byte 0x0e /* 54a */
	.byte 0x32 /* 54b */
	.byte 0x33 /* 54c */
	.byte 0x77 /* 54d */
	.byte 0x33 /* 54e */
	.byte 0x27 /* 54f */
	.byte 0x33 /* 550 */
	.byte 0x33 /* 551 */
	.byte 0x00 /* 552 */
	.byte 0x00 /* 553 */
	.byte 0x00 /* 554 */
	.byte 0x02 /* 555 */
	.byte 0x18 /* 556 */
	.byte 0x00 /* 557 */
	.byte 0x08 /* 558 */
	.byte 0x33 /* 559 */
	.byte 0x00 /* 55a */
	.byte 0x0e /* 55b */
	.byte 0x37 /* 55c */
	.byte 0x37 /* 55d */
	.byte 0x31 /* 55e */
	.byte 0x33 /* 55f */
	.byte 0x71 /* 560 */
	.byte 0x33 /* 561 */
	.byte 0x73 /* 562 */
	.byte 0x00 /* 563 */
	.byte 0x00 /* 564 */
	.byte 0x00 /* 565 */
	.byte 0x02 /* 566 */
	.byte 0x18 /* 567 */
	.byte 0x00 /* 568 */
	.byte 0x00 /* 569 */
	.byte 0x16 /* 56a */
	.byte 0x37 /* 56b */
	.byte 0x30 /* 56c */
	.byte 0x30 /* 56d */
	.byte 0x30 /* 56e */
	.byte 0x73 /* 56f */
	.byte 0x33 /* 570 */
	.byte 0x32 /* 571 */
	.byte 0x33 /* 572 */
	.byte 0x33 /* 573 */
	.byte 0x73 /* 574 */
	.byte 0x30 /* 575 */
	.byte 0x00 /* 576 */
	.byte 0x00 /* 577 */
	.byte 0x00 /* 578 */
	.byte 0x02 /* 579 */
	.byte 0x18 /* 57a */
	.byte 0x00 /* 57b */
	.byte 0x00 /* 57c */
	.byte 0x14 /* 57d */
	.byte 0x33 /* 57e */
	.byte 0x30 /* 57f */
	.byte 0x00 /* 580 */
	.byte 0x30 /* 581 */
	.byte 0x03 /* 582 */
	.byte 0x13 /* 583 */
	.byte 0x33 /* 584 */
	.byte 0x36 /* 585 */
	.byte 0x33 /* 586 */
	.byte 0x33 /* 587 */
	.byte 0x00 /* 588 */
	.byte 0x00 /* 589 */
	.byte 0x00 /* 58a */
	.byte 0x02 /* 58b */
	.byte 0x18 /* 58c */
	.byte 0x00 /* 58d */
	.byte 0x00 /* 58e */
	.byte 0x14 /* 58f */
	.byte 0x30 /* 590 */
	.byte 0x03 /* 591 */
	.byte 0x00 /* 592 */
	.byte 0x30 /* 593 */
	.byte 0x03 /* 594 */
	.byte 0x32 /* 595 */
	.byte 0x33 /* 596 */
	.byte 0x13 /* 597 */
	.byte 0x33 /* 598 */
	.byte 0x30 /* 599 */
	.byte 0x00 /* 59a */
	.byte 0x00 /* 59b */
	.byte 0x00 /* 59c */
	.byte 0x02 /* 59d */
	.byte 0x18 /* 59e */
	.byte 0x00 /* 59f */
	.byte 0x00 /* 5a0 */
	.byte 0x12 /* 5a1 */
	.byte 0x33 /* 5a2 */
	.byte 0x03 /* 5a3 */
	.byte 0x33 /* 5a4 */
	.byte 0x00 /* 5a5 */
	.byte 0x03 /* 5a6 */
	.byte 0x33 /* 5a7 */
	.byte 0x12 /* 5a8 */
	.byte 0x33 /* 5a9 */
	.byte 0x33 /* 5aa */
	.byte 0x00 /* 5ab */
	.byte 0x00 /* 5ac */
	.byte 0x00 /* 5ad */
	.byte 0x02 /* 5ae */
	.byte 0x19 /* 5af */
	.byte 0x00 /* 5b0 */
	.byte 0x00 /* 5b1 */
	.byte 0x10 /* 5b2 */
	.byte 0x30 /* 5b3 */
	.byte 0x00 /* 5b4 */
	.byte 0x00 /* 5b5 */
	.byte 0x03 /* 5b6 */
	.byte 0x33 /* 5b7 */
	.byte 0x33 /* 5b8 */
	.byte 0x33 /* 5b9 */
	.byte 0x33 /* 5ba */
	.byte 0x00 /* 5bb */
	.byte 0x00 /* 5bc */
	.byte 0x00 /* 5bd */
	.byte 0x02 /* 5be */
	.byte 0x19 /* 5bf */
	.byte 0x00 /* 5c0 */
	.byte 0x00 /* 5c1 */
	.byte 0x10 /* 5c2 */
	.byte 0x33 /* 5c3 */
	.byte 0x00 /* 5c4 */
	.byte 0x00 /* 5c5 */
	.byte 0x13 /* 5c6 */
	.byte 0x21 /* 5c7 */
	.byte 0x23 /* 5c8 */
	.byte 0x33 /* 5c9 */
	.byte 0x30 /* 5ca */
	.byte 0x00 /* 5cb */
	.byte 0x00 /* 5cc */
	.byte 0x00 /* 5cd */
	.byte 0x02 /* 5ce */
	.byte 0x1a /* 5cf */
	.byte 0x00 /* 5d0 */
	.byte 0x00 /* 5d1 */
	.byte 0x0e /* 5d2 */
	.byte 0x33 /* 5d3 */
	.byte 0x33 /* 5d4 */
	.byte 0x03 /* 5d5 */
	.byte 0x33 /* 5d6 */
	.byte 0x33 /* 5d7 */
	.byte 0x33 /* 5d8 */
	.byte 0x30 /* 5d9 */
	.byte 0x00 /* 5da */
	.byte 0x00 /* 5db */
	.byte 0x00 /* 5dc */
	.byte 0x02 /* 5dd */
	.byte 0x1b /* 5de */
	.byte 0x00 /* 5df */
	.byte 0x0a /* 5e0 */
	.byte 0x33 /* 5e1 */
	.byte 0x00 /* 5e2 */
	.byte 0x00 /* 5e3 */
	.byte 0x00 /* 5e4 */
	.byte 0x02 /* 5e5 */
	.byte 0x1d /* 5e6 */
	.byte 0x00 /* 5e7 */
	.byte 0x00 /* 5e8 */
	.byte 0x06 /* 5e9 */
	.byte 0x33 /* 5ea */
	.byte 0x33 /* 5eb */
	.byte 0x03 /* 5ec */
	.byte 0x00 /* 5ed */
	.byte 0x01 /* 5ee */
	.byte 0x00
mario_data_end:
