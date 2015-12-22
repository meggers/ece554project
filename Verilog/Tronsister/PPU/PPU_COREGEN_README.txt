///////////////////////////////////////////////////////////////////////////

Name: pattern_table
Type: Single Port ROM


Read Width: 16
Read Depth: 2048
Enable: Always Enabled


Load Init File: True
Init File: sprite_memory.coe

///////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////

Name: BACKGROUND_PATTERN_TABLE
Type: Single Port ROM


Read Width: 16
Read Depth: 2048
Enable: Always Enabled


Load Init File: True
Init File: background_memory.coe

///////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////

Name: background_tile_table
Type: Simple Dual Port RAM

PORT A:
	Write Width: 8
	Write Depth: 1024
	Operating Mode: Write First
	Enable: Use ENA Pin

PORT B:
	Read Width: 8
	Operating Mode: Write First
	Enable: Always Enabled

Load Init File: True
Init File: bg_tile_table.coe


///////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////

Name: background_attribute_table
Type: Simple Dual Port RAM

PORT A:
	Write Width: 8
	Write Depth: 1024
	Operating Mode: Write First
	Enable: Always Enabled

PORT B:
	Read Width: 8
	Operating Mode: Write First
	Enable: Always Enabled

Load Init File: True
Init File: bg_attribute_table.coe

///////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////

Name: OAM_RAM
Type: Simple Dual Port RAM

PORT A:
	Write Width: 8
	Write Depth: 256
	Operating Mode: Write First
	Enable: Always Enabled

PORT B:
	Read Width: 8
	Operating Mode: Write First
	Enable: Always Enabled

Load Init File: True
Init File: oam.coe

///////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////

Name: OAMB
Type: Single Port RAM

PORT A:
	Write Width: 8
	Write Depth: 32
	Read Width: 8
	Operating Mode: Write First
	Enable: Use ENA Pin

Load Init File: False

Use RSTA Pin (set/reset pin): True
Output Reset Value (Hex): FF