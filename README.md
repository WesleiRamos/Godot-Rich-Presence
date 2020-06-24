
# Godot-Rich-Presence

##### Leia em [português Brasil](README_PTBR.md).

Godot Rich Presence is a lib made with GDNative to use rich presence do Discord in Godot engine 3.1.

![Rich Presence](https://i.imgur.com/5IxTNBL.png)

## Functions

### init(Dictionary initialize)
Receives a **dict** with following keys:

| key         | optional | description | default |
| ------------- | -------- | ---------------------------- | --- |
| app_id        | **no**      | id of your discord app | **-** |
| auto_register | **yes**      | whether or not to register an application protocol for your game on the player's computer — necessary to launch games from Discord | 1 |
| steam_id      | **yes**      | your game's Steam application id, if your game is distributed on Steam | null  |

More information in [Initialization](https://discordapp.com/developers/docs/rich-presence/how-to#initialization)

### update(Dictionary presence)
Update the presence, receives a **dict** with following keys:

| key | type | description |
| ----- | ---- | --------- |
| state | string | the current player state |
| details | string | what the player is doing |
| start_timestamp | int | when the game started, it will show _elapsed_ |
| end_timestamp | int | when the game will end, it will show _remaining_ |
| large_image_key | string | name of the uploaded image for the large profile artwork |
| large_image_text | string | tooltip for the _large_image_key_ |
| small_image_key | string | name of the uploaded image for the small profile artwork |
| small_image_text | string | tootltip for the _small_image_key_ |
| party_id | string | id of the player's lobby/group/party |
| party_size | int | current size of the player's lobby/group/party |
| party_max | int | max size of the player's lobby/group/party |
| spectate_secret | string | unique hashed string for _Spectate_ button |
| join_secret | string | unique hashed string for _Ask to join_ |

OBS., to use **party_size** you need set **party_max** and vice-versa.

More information in [Updating Presence](https://discordapp.com/developers/docs/rich-presence/how-to#updating-presence) and [Rich Presence Field Requirements](https://discordapp.com/developers/docs/rich-presence/how-to#rich-presence-field-requirements)

### clear()
Reset the presence

### reply(String userId, int response)
Responds a request to join in the match, possible answers:

| response | code   |
| -------- | ------ |
| NO       | 0      |
| YES      | 1      |
| IGNORE   | 2      |

More information in [Ask to join](https://discordapp.com/developers/docs/rich-presence/how-to#ask-to-join)

### run_callbacks()
The Discord-rpc callback will only be called when this function is called, create a timer to exec this function in a interval of time.
More information in [So, how does it work?](https://discordapp.com/developers/docs/rich-presence/how-to#so-how-does-it-work)

### shutdown()
Shutdown Rich Presence

## Callbacks discord-rpc
It's possible define some signals to discord-rpc events, when the discord-rpc callbacks are called a signal will be emitted, the signals are:

| signal        | arguments                              |
| ------------- | -------------------------------------- |
| ready         | **dict** user                          |
| disconnected  | **int** error_code, **string** message |
| error         | **int** error_code, **string** message |
| join_game     | **string** secret                      |
| join_request  | **dict** request                       |
| spectate_game | **string** secret                      |

**ready** and **join_request** receives a **dict** with following keys:

| key           | description                       |
| ------------- | --------------------------------- |
| user_id       | id of player's discord account    |
| username      |                                   |
| discriminator | discord discriminator (e.g 2077)  |
| avatar        | avatar's hash                     |

OBS., I tried only the events **ready** and **error**, I believe the others works too.

More information in [So, how does it work?](https://discordapp.com/developers/docs/rich-presence/how-to#so-how-does-it-work)

## How to use?

The _example_ folder has a simple example of how to use it.

## Compiling

Clone this repo and then clone the following repositories:
- https://github.com/discordapp/discord-rpc
- https://github.com/GodotNativeTools/godot-cpp

Make sure the directory looks like:
```
godot-cpp
discord-rpc
Godot-Rich-Presence
├── example/
└── src/
```

Run SConstruct using the command `scons platform=plataforma arch=64`, the compiled files will be in `bin` folder.
