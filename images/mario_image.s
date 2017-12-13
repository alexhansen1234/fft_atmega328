.file "mario_image.s"
.global mario_color_table
	.data
	.type mario_color_table, @object
	.size mario, 32
mario_color_table:
	.word 0x00ff
	.word 0xffff
	.word 0x00ff
	.word 0xff00
	.word 0x00ff
	.word 0x00ff
	.word 0x00ff
	.word 0x0000
	.word 0x0000
	.word 0xffff
	.word 0x0000
	.word 0xff00
	.word 0x0000
	.word 0x00ff
	.word 0x0000
	.word 0x0000

.global mario_height
	.data
	.type mario_height, @object
	.size mario_height, 4
mario_height:
	.word 0x0000
	.word 0x0048

.global mario_width
	.data
	.type mario_width, @object
	.size mario_width, 4
mario_width:
	.word 0x0000
	.word 0x0048

.global mario
	.data
	.type mario, @object
	.size mario, 1524
mario:
	.byte 0x00
	.byte 0x02
	.byte 0x33
	.byte 0x05
	.byte 0x00
	.byte 0x0a
	.byte 0x71
	.byte 0x33
	.byte 0x17
	.byte 0x10
	.byte 0x60
	.byte 0x00
	.byte 0x00
	.byte 0x00
	.byte 0x02
	.byte 0x2f
	.byte 0x00
	.byte 0x00
	.byte 0x0e
	.byte 0x20
	.byte 0x47
	.byte 0x37
	.byte 0x77
	.byte 0x73
	.byte 0x77
	.byte 0x10
	.byte 0x00
	.byte 0x00
	.byte 0x00
	.byte 0x02
	.byte 0x17
	.byte 0x00
	.byte 0x00
	.byte 0x08
	.byte 0x75
	.byte 0x37
	.byte 0x35
	.byte 0x30
	.byte 0x0a
	.byte 0x00
	.byte 0x00
	.byte 0x16
	.byte 0x04
	.byte 0x04
	.byte 0x05
	.byte 0x05
	.byte 0x37
	.byte 0x77
	.byte 0x71
	.byte 0x77
	.byte 0x77
	.byte 0x70
	.byte 0x61
	.byte 0x00
	.byte 0x00
	.byte 0x00
	.byte 0x02
	.byte 0x16
	.byte 0x00
	.byte 0x02
	.byte 0x37
	.byte 0x02
	.byte 0x37
	.byte 0x08
	.byte 0x77
	.byte 0x00
	.byte 0x1a
	.byte 0x04
	.byte 0x00
	.byte 0x01
	.byte 0x02
	.byte 0x02
	.byte 0x12
	.byte 0x06
	.byte 0x07
	.byte 0x31
	.byte 0x73
	.byte 0x77
	.byte 0x37
	.byte 0x37
	.byte 0x00
	.byte 0x00
	.byte 0x00
	.byte 0x02
	.byte 0x16
	.byte 0x00
	.byte 0x00
	.byte 0x28
	.byte 0x77
	.byte 0x77
	.byte 0x37
	.byte 0x77
	.byte 0x77
	.byte 0x77
	.byte 0x73
	.byte 0x47
	.byte 0x06
	.byte 0x05
	.byte 0x04
	.byte 0x05
	.byte 0x21
	.byte 0x61
	.byte 0x73
	.byte 0x53
	.byte 0x34
	.byte 0x37
	.byte 0x73
	.byte 0x70
	.byte 0x00
	.byte 0x00
	.byte 0x00
	.byte 0x02
	.byte 0x15
	.byte 0x00
	.byte 0x00
	.byte 0x28
	.byte 0x37
	.byte 0x35
	.byte 0x35
	.byte 0x33
	.byte 0x73
	.byte 0x73
	.byte 0x77
	.byte 0x77
	.byte 0x07
	.byte 0x07
	.byte 0x06
	.byte 0x16
	.byte 0x04
	.byte 0x00
	.byte 0x73
	.byte 0x12
	.byte 0x15
	.byte 0x37
	.byte 0x13
	.byte 0x51
	.byte 0x00
	.byte 0x00
	.byte 0x00
	.byte 0x02
	.byte 0x15
	.byte 0x00
	.byte 0x00
	.byte 0x10
	.byte 0x71
	.byte 0x73
	.byte 0x73
	.byte 0x75
	.byte 0x35
	.byte 0x37
	.byte 0x17
	.byte 0x37
	.byte 0x0c
	.byte 0x00
	.byte 0x00
	.byte 0x0c
	.byte 0x13
	.byte 0x13
	.byte 0x33
	.byte 0x31
	.byte 0x37
	.byte 0x32
	.byte 0x00
	.byte 0x00
	.byte 0x00
	.byte 0x02
	.byte 0x15
	.byte 0x00
	.byte 0x00
	.byte 0x10
	.byte 0x37
	.byte 0x31
	.byte 0x21
	.byte 0x33
	.byte 0x33
	.byte 0x53
	.byte 0x77
	.byte 0x77
	.byte 0x0c
	.byte 0x00
	.byte 0x00
	.byte 0x0c
	.byte 0x63
	.byte 0x31
	.byte 0x11
	.byte 0x13
	.byte 0x71
	.byte 0x71
	.byte 0x00
	.byte 0x00
	.byte 0x00
	.byte 0x02
	.byte 0x16
	.byte 0x00
	.byte 0x00
	.byte 0x10
	.byte 0x35
	.byte 0x31
	.byte 0x31
	.byte 0x31
	.byte 0x73
	.byte 0x13
	.byte 0x17
	.byte 0x30
	.byte 0x0a
	.byte 0x00
	.byte 0x00
	.byte 0x0e
	.byte 0x07
	.byte 0x47
	.byte 0x33
	.byte 0x33
	.byte 0x13
	.byte 0x37
	.byte 0x30
	.byte 0x00
	.byte 0x00
	.byte 0x00
	.byte 0x02
	.byte 0x16
	.byte 0x00
	.byte 0x00
	.byte 0x10
	.byte 0x73
	.byte 0x13
	.byte 0x13
	.byte 0x53
	.byte 0x31
	.byte 0x77
	.byte 0x76
	.byte 0x70
	.byte 0x0a
	.byte 0x00
	.byte 0x00
	.byte 0x0c
	.byte 0x77
	.byte 0x67
	.byte 0x47
	.byte 0x43
	.byte 0x71
	.byte 0x77
	.byte 0x00
	.byte 0x00
	.byte 0x00
	.byte 0x02
	.byte 0x17
	.byte 0x00
	.byte 0x00
	.byte 0x0e
	.byte 0x37
	.byte 0x37
	.byte 0x33
	.byte 0x17
	.byte 0x66
	.byte 0x76
	.byte 0x77
	.byte 0x0a
	.byte 0x00
	.byte 0x00
	.byte 0x0e
	.byte 0x67
	.byte 0x47
	.byte 0x76
	.byte 0x76
	.byte 0x76
	.byte 0x73
	.byte 0x10
	.byte 0x00
	.byte 0x00
	.byte 0x00
	.byte 0x02
	.byte 0x1a
	.byte 0x00
	.byte 0x00
	.byte 0x22
	.byte 0x35
	.byte 0x66
	.byte 0x64
	.byte 0x77
	.byte 0x77
	.byte 0x60
	.byte 0x00
	.byte 0x00
	.byte 0x00
	.byte 0x06
	.byte 0x77
	.byte 0x77
	.byte 0x67
	.byte 0x67
	.byte 0x76
	.byte 0x46
	.byte 0x77
	.byte 0x00
	.byte 0x00
	.byte 0x00
	.byte 0x02
	.byte 0x1a
	.byte 0x00
	.byte 0x00
	.byte 0x22
	.byte 0x66
	.byte 0x04
	.byte 0x67
	.byte 0x67
	.byte 0x67
	.byte 0x50
	.byte 0x00
	.byte 0x00
	.byte 0x00
	.byte 0x67
	.byte 0x74
	.byte 0x76
	.byte 0x76
	.byte 0x56
	.byte 0x47
	.byte 0x74
	.byte 0x73
	.byte 0x00
	.byte 0x00
	.byte 0x00
	.byte 0x02
	.byte 0x1a
	.byte 0x00
	.byte 0x00
	.byte 0x22
	.byte 0x46
	.byte 0x76
	.byte 0x74
	.byte 0x76
	.byte 0x77
	.byte 0x60
	.byte 0x00
	.byte 0x00
	.byte 0x06
	.byte 0x76
	.byte 0x46
	.byte 0x64
	.byte 0x76
	.byte 0x76
	.byte 0x76
	.byte 0x77
	.byte 0x70
	.byte 0x00
	.byte 0x00
	.byte 0x00
	.byte 0x02
	.byte 0x1a
	.byte 0x00
	.byte 0x00
	.byte 0x22
	.byte 0x27
	.byte 0x46
	.byte 0x47
	.byte 0x64
	.byte 0x76
	.byte 0x00
	.byte 0x00
	.byte 0x00
	.byte 0x07
	.byte 0x42
	.byte 0x46
	.byte 0x47
	.byte 0x65
	.byte 0x65
	.byte 0x64
	.byte 0x67
	.byte 0x60
	.byte 0x00
	.byte 0x00
	.byte 0x00
	.byte 0x02
	.byte 0x1a
	.byte 0x00
	.byte 0x00
	.byte 0x20
	.byte 0x46
	.byte 0x76
	.byte 0x76
	.byte 0x77
	.byte 0x77
	.byte 0x00
	.byte 0x00
	.byte 0x00
	.byte 0x76
	.byte 0x64
	.byte 0x24
	.byte 0x24
	.byte 0x67
	.byte 0x67
	.byte 0x67
	.byte 0x77
	.byte 0x00
	.byte 0x00
	.byte 0x00
	.byte 0x02
	.byte 0x1a
	.byte 0x00
	.byte 0x00
	.byte 0x14
	.byte 0x76
	.byte 0x46
	.byte 0x77
	.byte 0x77
	.byte 0x77
	.byte 0x60
	.byte 0x00
	.byte 0x04
	.byte 0x76
	.byte 0x44
	.byte 0x08
	.byte 0x46
	.byte 0x02
	.byte 0x67
	.byte 0x02
	.byte 0x60
	.byte 0x00
	.byte 0x00
	.byte 0x00
	.byte 0x02
	.byte 0x1a
	.byte 0x00
	.byte 0x00
	.byte 0x1e
	.byte 0x64
	.byte 0x64
	.byte 0x67
	.byte 0x66
	.byte 0x76
	.byte 0x77
	.byte 0x60
	.byte 0x07
	.byte 0x63
	.byte 0x60
	.byte 0x52
	.byte 0x46
	.byte 0x67
	.byte 0x67
	.byte 0x74
	.byte 0x00
	.byte 0x00
	.byte 0x00
	.byte 0x02
	.byte 0x19
	.byte 0x00
	.byte 0x00
	.byte 0x22
	.byte 0x66
	.byte 0x04
	.byte 0x25
	.byte 0x21
	.byte 0x11
	.byte 0x30
	.byte 0x11
	.byte 0x31
	.byte 0x01
	.byte 0x11
	.byte 0x13
	.byte 0x11
	.byte 0x31
	.byte 0x33
	.byte 0x31
	.byte 0x01
	.byte 0x03
	.byte 0x00
	.byte 0x00
	.byte 0x00
	.byte 0x02
	.byte 0x19
	.byte 0x00
	.byte 0x00
	.byte 0x24
	.byte 0x13
	.byte 0x33
	.byte 0x13
	.byte 0x11
	.byte 0x31
	.byte 0x11
	.byte 0x01
	.byte 0x00
	.byte 0x10
	.byte 0x00
	.byte 0x00
	.byte 0x01
	.byte 0x01
	.byte 0x01
	.byte 0x33
	.byte 0x13
	.byte 0x31
	.byte 0x31
	.byte 0x00
	.byte 0x00
	.byte 0x00
	.byte 0x02
	.byte 0x16
	.byte 0x00
	.byte 0x00
	.byte 0x28
	.byte 0x21
	.byte 0x33
	.byte 0x11
	.byte 0x31
	.byte 0x11
	.byte 0x31
	.byte 0x00
	.byte 0x11
	.byte 0x01
	.byte 0x03
	.byte 0x11
	.byte 0x11
	.byte 0x11
	.byte 0x10
	.byte 0x01
	.byte 0x00
	.byte 0x13
	.byte 0x13
	.byte 0x11
	.byte 0x33
	.byte 0x00
	.byte 0x00
	.byte 0x00
	.byte 0x02
	.byte 0x14
	.byte 0x00
	.byte 0x00
	.byte 0x16
	.byte 0x31
	.byte 0x13
	.byte 0x11
	.byte 0x13
	.byte 0x11
	.byte 0x13
	.byte 0x10
	.byte 0x01
	.byte 0x01
	.byte 0x10
	.byte 0x11
	.byte 0x08
	.byte 0x13
	.byte 0x00
	.byte 0x0e
	.byte 0x10
	.byte 0x11
	.byte 0x31
	.byte 0x11
	.byte 0x13
	.byte 0x11
	.byte 0x30
	.byte 0x00
	.byte 0x00
	.byte 0x00
	.byte 0x02
	.byte 0x11
	.byte 0x00
	.byte 0x00
	.byte 0x30
	.byte 0x11
	.byte 0x31
	.byte 0x13
	.byte 0x13
	.byte 0x03
	.byte 0x11
	.byte 0x33
	.byte 0x13
	.byte 0x13
	.byte 0x13
	.byte 0x10
	.byte 0x10
	.byte 0x10
	.byte 0x11
	.byte 0x10
	.byte 0x10
	.byte 0x11
	.byte 0x11
	.byte 0x11
	.byte 0x10
	.byte 0x11
	.byte 0x11
	.byte 0x33
	.byte 0x10
	.byte 0x00
	.byte 0x00
	.byte 0x00
	.byte 0x02
	.byte 0x14
	.byte 0x00
	.byte 0x00
	.byte 0x2e
	.byte 0x31
	.byte 0x31
	.byte 0x31
	.byte 0x10
	.byte 0x00
	.byte 0x13
	.byte 0x77
	.byte 0x11
	.byte 0x11
	.byte 0x11
	.byte 0x10
	.byte 0x10
	.byte 0x00
	.byte 0x11
	.byte 0x11
	.byte 0x11
	.byte 0x31
	.byte 0x11
	.byte 0x10
	.byte 0x01
	.byte 0x01
	.byte 0x13
	.byte 0x10
	.byte 0x00
	.byte 0x00
	.byte 0x00
	.byte 0x02
	.byte 0x10
	.byte 0x00
	.byte 0x00
	.byte 0x32
	.byte 0x31
	.byte 0x13
	.byte 0x13
	.byte 0x33
	.byte 0x11
	.byte 0x00
	.byte 0x03
	.byte 0x13
	.byte 0x13
	.byte 0x67
	.byte 0x21
	.byte 0x11
	.byte 0x11
	.byte 0x11
	.byte 0x33
	.byte 0x33
	.byte 0x13
	.byte 0x11
	.byte 0x11
	.byte 0x10
	.byte 0x00
	.byte 0x00
	.byte 0x10
	.byte 0x11
	.byte 0x30
	.byte 0x00
	.byte 0x00
	.byte 0x00
	.byte 0x02
	.byte 0x0e
	.byte 0x00
	.byte 0x00
	.byte 0x34
	.byte 0x13
	.byte 0x33
	.byte 0x33
	.byte 0x33
	.byte 0x11
	.byte 0x10
	.byte 0x00
	.byte 0x31
	.byte 0x37
	.byte 0x20
	.byte 0x34
	.byte 0x61
	.byte 0x66
	.byte 0x37
	.byte 0x67
	.byte 0x11
	.byte 0x11
	.byte 0x11
	.byte 0x31
	.byte 0x11
	.byte 0x01
	.byte 0x10
	.byte 0x00
	.byte 0x01
	.byte 0x11
	.byte 0x30
	.byte 0x00
	.byte 0x00
	.byte 0x00
	.byte 0x02
	.byte 0x0d
	.byte 0x00
	.byte 0x00
	.byte 0x34
	.byte 0x13
	.byte 0x11
	.byte 0x00
	.byte 0x33
	.byte 0x31
	.byte 0x00
	.byte 0x03
	.byte 0x10
	.byte 0x06
	.byte 0x31
	.byte 0x44
	.byte 0x24
	.byte 0x13
	.byte 0x17
	.byte 0x67
	.byte 0x31
	.byte 0x31
	.byte 0x33
	.byte 0x33
	.byte 0x11
	.byte 0x10
	.byte 0x10
	.byte 0x00
	.byte 0x00
	.byte 0x01
	.byte 0x13
	.byte 0x00
	.byte 0x00
	.byte 0x00
	.byte 0x02
	.byte 0x0d
	.byte 0x00
	.byte 0x00
	.byte 0x34
	.byte 0x33
	.byte 0x00
	.byte 0x00
	.byte 0x00
	.byte 0x13
	.byte 0x00
	.byte 0x73
	.byte 0x70
	.byte 0x00
	.byte 0x44
	.byte 0x00
	.byte 0x43
	.byte 0x33
	.byte 0x11
	.byte 0x31
	.byte 0x33
	.byte 0x13
	.byte 0x13
	.byte 0x11
	.byte 0x33
	.byte 0x31
	.byte 0x31
	.byte 0x00
	.byte 0x00
	.byte 0x01
	.byte 0x17
	.byte 0x00
	.byte 0x00
	.byte 0x00
	.byte 0x02
	.byte 0x0b
	.byte 0x00
	.byte 0x00
	.byte 0x36
	.byte 0x13
	.byte 0x00
	.byte 0x00
	.byte 0x01
	.byte 0x31
	.byte 0x11
	.byte 0x33
	.byte 0x33
	.byte 0x73
	.byte 0x67
	.byte 0x60
	.byte 0x40
	.byte 0x44
	.byte 0x07
	.byte 0x63
	.byte 0x17
	.byte 0x31
	.byte 0x75
	.byte 0x35
	.byte 0x33
	.byte 0x01
	.byte 0x33
	.byte 0x11
	.byte 0x00
	.byte 0x00
	.byte 0x11
	.byte 0x13
	.byte 0x00
	.byte 0x00
	.byte 0x00
	.byte 0x02
	.byte 0x09
	.byte 0x00
	.byte 0x00
	.byte 0x38
	.byte 0x13
	.byte 0x10
	.byte 0x00
	.byte 0x00
	.byte 0x00
	.byte 0x12
	.byte 0x37
	.byte 0x73
	.byte 0x73
	.byte 0x17
	.byte 0x73
	.byte 0x70
	.byte 0x46
	.byte 0x06
	.byte 0x73
	.byte 0x47
	.byte 0x73
	.byte 0x16
	.byte 0x76
	.byte 0x73
	.byte 0x00
	.byte 0x12
	.byte 0x11
	.byte 0x10
	.byte 0x01
	.byte 0x01
	.byte 0x11
	.byte 0x31
	.byte 0x00
	.byte 0x00
	.byte 0x00
	.byte 0x02
	.byte 0x07
	.byte 0x00
	.byte 0x00
	.byte 0x06
	.byte 0x30
	.byte 0x31
	.byte 0x30
	.byte 0x08
	.byte 0x00
	.byte 0x00
	.byte 0x2c
	.byte 0x07
	.byte 0x33
	.byte 0x33
	.byte 0x23
	.byte 0x15
	.byte 0x64
	.byte 0x60
	.byte 0x64
	.byte 0x31
	.byte 0x36
	.byte 0x67
	.byte 0x77
	.byte 0x77
	.byte 0x74
	.byte 0x01
	.byte 0x71
	.byte 0x33
	.byte 0x10
	.byte 0x00
	.byte 0x11
	.byte 0x33
	.byte 0x10
	.byte 0x00
	.byte 0x00
	.byte 0x00
	.byte 0x02
	.byte 0x05
	.byte 0x00
	.byte 0x02
	.byte 0x30
	.byte 0x0a
	.byte 0x00
	.byte 0x00
	.byte 0x2e
	.byte 0x01
	.byte 0x61
	.byte 0x00
	.byte 0x37
	.byte 0x37
	.byte 0x13
	.byte 0x03
	.byte 0x64
	.byte 0x44
	.byte 0x46
	.byte 0x11
	.byte 0x11
	.byte 0x64
	.byte 0x73
	.byte 0x33
	.byte 0x70
	.byte 0x06
	.byte 0x00
	.byte 0x01
	.byte 0x33
	.byte 0x13
	.byte 0x13
	.byte 0x11
	.byte 0x00
	.byte 0x00
	.byte 0x00
	.byte 0x02
	.byte 0x08
	.byte 0x00
	.byte 0x02
	.byte 0x10
	.byte 0x08
	.byte 0x00
	.byte 0x00
	.byte 0x2e
	.byte 0x61
	.byte 0x03
	.byte 0x10
	.byte 0x37
	.byte 0x73
	.byte 0x37
	.byte 0x47
	.byte 0x27
	.byte 0x37
	.byte 0x74
	.byte 0x01
	.byte 0x76
	.byte 0x73
	.byte 0x77
	.byte 0x73
	.byte 0x63
	.byte 0x12
	.byte 0x00
	.byte 0x00
	.byte 0x13
	.byte 0x13
	.byte 0x10
	.byte 0x10
	.byte 0x00
	.byte 0x00
	.byte 0x00
	.byte 0x02
	.byte 0x07
	.byte 0x00
	.byte 0x02
	.byte 0x12
	.byte 0x08
	.byte 0x00
	.byte 0x00
	.byte 0x30
	.byte 0x61
	.byte 0x10
	.byte 0x10
	.byte 0x13
	.byte 0x73
	.byte 0x73
	.byte 0x06
	.byte 0x33
	.byte 0x37
	.byte 0x36
	.byte 0x60
	.byte 0x46
	.byte 0x13
	.byte 0x33
	.byte 0x33
	.byte 0x73
	.byte 0x30
	.byte 0x41
	.byte 0x00
	.byte 0x00
	.byte 0x01
	.byte 0x00
	.byte 0x11
	.byte 0x30
	.byte 0x00
	.byte 0x00
	.byte 0x00
	.byte 0x02
	.byte 0x11
	.byte 0x00
	.byte 0x00
	.byte 0x2c
	.byte 0x71
	.byte 0x01
	.byte 0x01
	.byte 0x03
	.byte 0x00
	.byte 0x07
	.byte 0x34
	.byte 0x73
	.byte 0x73
	.byte 0x33
	.byte 0x44
	.byte 0x67
	.byte 0x32
	.byte 0x13
	.byte 0x21
	.byte 0x31
	.byte 0x30
	.byte 0x04
	.byte 0x00
	.byte 0x00
	.byte 0x00
	.byte 0x11
	.byte 0x00
	.byte 0x00
	.byte 0x00
	.byte 0x02
	.byte 0x07
	.byte 0x00
	.byte 0x02
	.byte 0x30
	.byte 0x0c
	.byte 0x00
	.byte 0x00
	.byte 0x2a
	.byte 0x10
	.byte 0x10
	.byte 0x00
	.byte 0x03
	.byte 0x33
	.byte 0x47
	.byte 0x37
	.byte 0x77
	.byte 0x64
	.byte 0x63
	.byte 0x13
	.byte 0x31
	.byte 0x33
	.byte 0x33
	.byte 0x33
	.byte 0x00
	.byte 0x07
	.byte 0x00
	.byte 0x01
	.byte 0x03
	.byte 0x10
	.byte 0x00
	.byte 0x00
	.byte 0x00
	.byte 0x02
	.byte 0x06
	.byte 0x00
	.byte 0x02
	.byte 0x10
	.byte 0x0a
	.byte 0x00
	.byte 0x00
	.byte 0x24
	.byte 0x06
	.byte 0x10
	.byte 0x70
	.byte 0x10
	.byte 0x00
	.byte 0x00
	.byte 0x30
	.byte 0x01
	.byte 0x03
	.byte 0x77
	.byte 0x64
	.byte 0x33
	.byte 0x12
	.byte 0x30
	.byte 0x12
	.byte 0x30
	.byte 0x33
	.byte 0x30
	.byte 0x00
	.byte 0x00
	.byte 0x00
	.byte 0x02
	.byte 0x15
	.byte 0x00
	.byte 0x00
	.byte 0x20
	.byte 0x10
	.byte 0x01
	.byte 0x10
	.byte 0x00
	.byte 0x10
	.byte 0x10
	.byte 0x01
	.byte 0x11
	.byte 0x77
	.byte 0x67
	.byte 0x30
	.byte 0x31
	.byte 0x33
	.byte 0x31
	.byte 0x33
	.byte 0x33
	.byte 0x00
	.byte 0x00
	.byte 0x00
	.byte 0x02
	.byte 0x15
	.byte 0x00
	.byte 0x00
	.byte 0x1e
	.byte 0x10
	.byte 0x00
	.byte 0x20
	.byte 0x01
	.byte 0x27
	.byte 0x73
	.byte 0x12
	.byte 0x00
	.byte 0x01
	.byte 0x77
	.byte 0x73
	.byte 0x33
	.byte 0x33
	.byte 0x33
	.byte 0x33
	.byte 0x00
	.byte 0x00
	.byte 0x00
	.byte 0x02
	.byte 0x19
	.byte 0x00
	.byte 0x00
	.byte 0x16
	.byte 0x10
	.byte 0x10
	.byte 0x11
	.byte 0x77
	.byte 0x77
	.byte 0x30
	.byte 0x10
	.byte 0x03
	.byte 0x77
	.byte 0x30
	.byte 0x30
	.byte 0x00
	.byte 0x00
	.byte 0x00
	.byte 0x02
	.byte 0x05
	.byte 0x00
	.byte 0x02
	.byte 0x10
	.byte 0x0e
	.byte 0x00
	.byte 0x00
	.byte 0x16
	.byte 0x07
	.byte 0x10
	.byte 0x00
	.byte 0x00
	.byte 0x00
	.byte 0x07
	.byte 0x77
	.byte 0x73
	.byte 0x21
	.byte 0x00
	.byte 0x67
	.byte 0x00
	.byte 0x00
	.byte 0x00
	.byte 0x02
	.byte 0x1e
	.byte 0x00
	.byte 0x00
	.byte 0x0e
	.byte 0x30
	.byte 0x77
	.byte 0x77
	.byte 0x71
	.byte 0x03
	.byte 0x01
	.byte 0x77
	.byte 0x00
	.byte 0x00
	.byte 0x00
	.byte 0x02
	.byte 0x1d
	.byte 0x00
	.byte 0x00
	.byte 0x10
	.byte 0x10
	.byte 0x13
	.byte 0x31
	.byte 0x77
	.byte 0x70
	.byte 0x01
	.byte 0x00
	.byte 0x30
	.byte 0x00
	.byte 0x00
	.byte 0x00
	.byte 0x02
	.byte 0x18
	.byte 0x00
	.byte 0x00
	.byte 0x16
	.byte 0x25
	.byte 0x00
	.byte 0x00
	.byte 0x03
	.byte 0x00
	.byte 0x00
	.byte 0x73
	.byte 0x10
	.byte 0x77
	.byte 0x30
	.byte 0x10
	.byte 0x00
	.byte 0x00
	.byte 0x00
	.byte 0x02
	.byte 0x19
	.byte 0x00
	.byte 0x00
	.byte 0x16
	.byte 0x30
	.byte 0x00
	.byte 0x12
	.byte 0x10
	.byte 0x07
	.byte 0x00
	.byte 0x02
	.byte 0x13
	.byte 0x75
	.byte 0x21
	.byte 0x20
	.byte 0x00
	.byte 0x00
	.byte 0x00
	.byte 0x02
	.byte 0x1b
	.byte 0x00
	.byte 0x00
	.byte 0x14
	.byte 0x64
	.byte 0x00
	.byte 0x00
	.byte 0x67
	.byte 0x61
	.byte 0x31
	.byte 0x77
	.byte 0x72
	.byte 0x13
	.byte 0x11
	.byte 0x00
	.byte 0x00
	.byte 0x00
	.byte 0x02
	.byte 0x19
	.byte 0x00
	.byte 0x00
	.byte 0x14
	.byte 0x10
	.byte 0x77
	.byte 0x01
	.byte 0x00
	.byte 0x77
	.byte 0x50
	.byte 0x00
	.byte 0x77
	.byte 0x71
	.byte 0x13
	.byte 0x00
	.byte 0x00
	.byte 0x00
	.byte 0x02
	.byte 0x19
	.byte 0x00
	.byte 0x00
	.byte 0x16
	.byte 0x20
	.byte 0x72
	.byte 0x00
	.byte 0x50
	.byte 0x04
	.byte 0x61
	.byte 0x31
	.byte 0x27
	.byte 0x73
	.byte 0x20
	.byte 0x33
	.byte 0x00
	.byte 0x00
	.byte 0x00
	.byte 0x02
	.byte 0x19
	.byte 0x00
	.byte 0x00
	.byte 0x16
	.byte 0x10
	.byte 0x45
	.byte 0x01
	.byte 0x37
	.byte 0x40
	.byte 0x33
	.byte 0x03
	.byte 0x17
	.byte 0x77
	.byte 0x10
	.byte 0x10
	.byte 0x00
	.byte 0x00
	.byte 0x00
	.byte 0x02
	.byte 0x1a
	.byte 0x00
	.byte 0x00
	.byte 0x14
	.byte 0x37
	.byte 0x33
	.byte 0x72
	.byte 0x77
	.byte 0x35
	.byte 0x37
	.byte 0x30
	.byte 0x77
	.byte 0x73
	.byte 0x70
	.byte 0x00
	.byte 0x00
	.byte 0x00
	.byte 0x02
	.byte 0x16
	.byte 0x00
	.byte 0x00
	.byte 0x18
	.byte 0x30
	.byte 0x04
	.byte 0x77
	.byte 0x31
	.byte 0x31
	.byte 0x33
	.byte 0x33
	.byte 0x23
	.byte 0x37
	.byte 0x33
	.byte 0x37
	.byte 0x33
	.byte 0x00
	.byte 0x00
	.byte 0x00
	.byte 0x02
	.byte 0x16
	.byte 0x00
	.byte 0x00
	.byte 0x1a
	.byte 0x33
	.byte 0x33
	.byte 0x30
	.byte 0x32
	.byte 0x33
	.byte 0x21
	.byte 0x33
	.byte 0x73
	.byte 0x37
	.byte 0x37
	.byte 0x33
	.byte 0x73
	.byte 0x30
	.byte 0x00
	.byte 0x00
	.byte 0x00
	.byte 0x02
	.byte 0x17
	.byte 0x00
	.byte 0x02
	.byte 0x23
	.byte 0x08
	.byte 0x33
	.byte 0x00
	.byte 0x0e
	.byte 0x32
	.byte 0x33
	.byte 0x77
	.byte 0x33
	.byte 0x27
	.byte 0x33
	.byte 0x33
	.byte 0x00
	.byte 0x00
	.byte 0x00
	.byte 0x02
	.byte 0x18
	.byte 0x00
	.byte 0x08
	.byte 0x33
	.byte 0x00
	.byte 0x0e
	.byte 0x37
	.byte 0x37
	.byte 0x31
	.byte 0x33
	.byte 0x71
	.byte 0x33
	.byte 0x73
	.byte 0x00
	.byte 0x00
	.byte 0x00
	.byte 0x02
	.byte 0x18
	.byte 0x00
	.byte 0x00
	.byte 0x16
	.byte 0x37
	.byte 0x30
	.byte 0x30
	.byte 0x30
	.byte 0x73
	.byte 0x33
	.byte 0x32
	.byte 0x33
	.byte 0x33
	.byte 0x73
	.byte 0x30
	.byte 0x00
	.byte 0x00
	.byte 0x00
	.byte 0x02
	.byte 0x18
	.byte 0x00
	.byte 0x00
	.byte 0x14
	.byte 0x33
	.byte 0x30
	.byte 0x00
	.byte 0x30
	.byte 0x03
	.byte 0x13
	.byte 0x33
	.byte 0x36
	.byte 0x33
	.byte 0x33
	.byte 0x00
	.byte 0x00
	.byte 0x00
	.byte 0x02
	.byte 0x18
	.byte 0x00
	.byte 0x00
	.byte 0x14
	.byte 0x30
	.byte 0x03
	.byte 0x00
	.byte 0x30
	.byte 0x03
	.byte 0x32
	.byte 0x33
	.byte 0x13
	.byte 0x33
	.byte 0x30
	.byte 0x00
	.byte 0x00
	.byte 0x00
	.byte 0x02
	.byte 0x18
	.byte 0x00
	.byte 0x00
	.byte 0x12
	.byte 0x33
	.byte 0x03
	.byte 0x33
	.byte 0x00
	.byte 0x03
	.byte 0x33
	.byte 0x12
	.byte 0x33
	.byte 0x33
	.byte 0x00
	.byte 0x00
	.byte 0x00
	.byte 0x02
	.byte 0x19
	.byte 0x00
	.byte 0x00
	.byte 0x10
	.byte 0x30
	.byte 0x00
	.byte 0x00
	.byte 0x03
	.byte 0x33
	.byte 0x33
	.byte 0x33
	.byte 0x33
	.byte 0x00
	.byte 0x00
	.byte 0x00
	.byte 0x02
	.byte 0x19
	.byte 0x00
	.byte 0x00
	.byte 0x10
	.byte 0x33
	.byte 0x00
	.byte 0x00
	.byte 0x13
	.byte 0x21
	.byte 0x23
	.byte 0x33
	.byte 0x30
	.byte 0x00
	.byte 0x00
	.byte 0x00
	.byte 0x02
	.byte 0x1a
	.byte 0x00
	.byte 0x00
	.byte 0x0e
	.byte 0x33
	.byte 0x33
	.byte 0x03
	.byte 0x33
	.byte 0x33
	.byte 0x33
	.byte 0x30
	.byte 0x00
	.byte 0x00
	.byte 0x00
	.byte 0x02
	.byte 0x1b
	.byte 0x00
	.byte 0x0a
	.byte 0x33
	.byte 0x00
	.byte 0x00
	.byte 0x00
	.byte 0x02
	.byte 0x1d
	.byte 0x00
	.byte 0x00
	.byte 0x06
	.byte 0x33
	.byte 0x33
	.byte 0x03
	.byte 0x00
	.byte 0x01