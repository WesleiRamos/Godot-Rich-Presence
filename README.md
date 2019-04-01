
# Godot-Rich-Presence

Godot Rich Presence é uma biblioteca em GDNative para uso do rich presence do Discord na Godot engine 3.1.

![Rich Presence](https://i.imgur.com/5IxTNBL.png)

## Funções

### init(Dictionary initialize)
Recebe um **dict** com as seguintes chaves:

| chave         | opcional | descrição | padrão |
| ------------- | -------- | ---------------------------- | --- |
| app_id        | **não**      | id do seu aplicativo discord | **-** |
| auto_register | **sim**      | caso você queira que o discord crie um protocolo para seu jogo no computador do usuário | 1 |
| steam_id      | **sim**      | id do seu jogo steam, caso ele seja distribuido na steam | null  |

Mais informações em [Initialization](https://discordapp.com/developers/docs/rich-presence/how-to#initialization)

### update(Dictionary presence)
Atualiza a presença, recebe um **dict** com as seguintes chaves:

| chave | tipo | descrição |
| ----- | ---- | --------- |
| state | string | status atual do jogador |
| details | string |o que o jogador está fazendo |
| start_timestamp | int | quando a partida começou, se adicionado aparecerá _tempo decorrido_ |
| end_timestamp | int | quando a partida irá finalizar, se adicionado aparecerá _tesmpo restante_ |
| large_image_key | string | nome da imagem enviada que aparecerá como icone grande |
| large_image_text | string | tooltip que aparecerá quando o ponteiro do mouse fica em cima do icone grande |
| small_image_key | string | nome da imagem enviada que aparecerá como icone pequeno |
| small_image_text | string | tooltip que aparecerá quando o ponteiro do mouse fica em cima do icone pequeno |
| party_id | string | id do lobby/grupo/festa no qual o jogador está |
| party_size | int | quantidade de jogadores que estão no lobby/grupo/festa com o jogador |
| party_max | int | quantidade máxima de jogadores que podem estar no lobby/grupo/festa com o jogador |
| spectate_secret | string | hash único para o botão _Assistir_ |
| join_secret | string | hash único para os convites e para o botão _Pedir pra juntar-se_ |

OBS: para usar **party_size** é necessário definir **party_max** e vice-versa.

Mais informações em [Updating Presence](https://discordapp.com/developers/docs/rich-presence/how-to#updating-presence) e [Rich Presence Field Requirements](https://discordapp.com/developers/docs/rich-presence/how-to#rich-presence-field-requirements)

### clear()
Reseta a presença

### reply(String userId, int response)
Responde a uma solicitação para juntar-se a partida. Respostas possíveis:

| resposta | código |
| -------- | ------ |
| NÃO      | 0      |
| SIM      | 1      |
| IGNORAR  | 2      |

Mais informações em [Ask to join](https://discordapp.com/developers/docs/rich-presence/how-to#ask-to-join)

### run_callbacks()
Os callbacks do Discord-rpc só serão chamados após essa função ser chamada, se possível crie um timer para executa-la de tempos em tempos.
Mais informações em [So, how does it work?](https://discordapp.com/developers/docs/rich-presence/how-to#so-how-does-it-work)

### shutdown()
Desconecta do Discord

## Callbacks discord-rpc

É possível definir alguns sinais para eventos do discord-rpc, quando os callbacks forem chamados um sinal será emitido, os sinais são:

| sinal         | argumentos                             |
| ------------- | -------------------------------------- |
| ready         | **dict** user                          |
| disconnected  | **int** error_code, **string** message |
| error         | **int** error_code, **string** message |
| join_game     | **string** secret                      |
| join_request  | **dict** request                       |
| spectate_game | **string** secret                      |

**ready** e **join_request** recebem um **dict** que contém as seguintes chaves:

| chave         | descrição                         |
| ------------- | --------------------------------- |
| user_id       | id da conta do discord do usuário |
| username      |                                   |
| discriminator | numero da tag                     |
| avatar        | hash do avatar                    |

OBS: Eu apenas testei os eventos **ready** e **error**, acredito que os outros estejam funcionando também.

Mais informações em [So, how does it work?](https://discordapp.com/developers/docs/rich-presence/how-to#so-how-does-it-work)

## Como usar

Na pasta _example_ há um exemplo simples de como você deve usar.

## Compilando

Clone este repositório e depois clone os seguintes repositórios:
- https://github.com/discordapp/discord-rpc
- https://github.com/GodotNativeTools/godot-cpp

Tenha certeza que o diretório se parece com:
```
godot-cpp
discord-rpc
Godot-Rich-Presence
├── example/
└── src/
```

Execute o SConstruct usando o comando `scons platform=plataforma arch=64`, os arquivoc compilados irão ficar dentro da pasta `bin`.
