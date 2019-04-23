
# Godot-Rich-Presence

Godot Rich Presence is a library made with GDNative that makes it possible to use Discord's Rich Presence in Godot 3.1

![Rich Presence](https://i.imgur.com/5IxTNBL.png)

## Functions

### init(Dictionary initialize)

| Key           | optional | description | default |
| ------------- | -------- | ---------------------------- | --- |
| app_id        | **no**      | id of your discord app| **-** |
| auto_register | **yes**      | If you want discord to create a protocol(?) of your game in the user's pc | 1 |
| steam_id      | **yes**      | Your games' steam id | null  |

More info in: [Initialization](https://discordapp.com/developers/docs/rich-presence/how-to#initialization)

### update(Dictionary presence)

| key | type | description|
| ----- | ---- | --------- |
| state | string | actual status |
| details | string | What's the player doing |
| start_timestamp | int | When the game started |
| end_timestamp | int | When the game will end|
| large_image_key | string | Name of the big image |
| large_image_text | string | tooltip of the big image |
| small_image_key | string | Name of the small image |
| small_image_text | string | Tooltip of the small image |
| party_id | string | The lobby where the player is in. |
| party_size | int | Number of players in the lobby |
| party_max | int | Maximum number of players for the lobby |
| spectate_secret | string | Hash for the button _Assist_(?) |
| join_secret | string | Hash for joining the game |

More info in [Updating Presence](https://discordapp.com/developers/docs/rich-presence/how-to#updating-presence) and [Rich Presence Field Requirements](https://discordapp.com/developers/docs/rich-presence/how-to#rich-presence-field-requirements)

### clear()
Reset the rpc

### The translation will be completed soon...
