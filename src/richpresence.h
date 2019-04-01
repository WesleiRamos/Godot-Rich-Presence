#include <Godot.hpp>
#include <Reference.hpp>
#include <discord_rpc.h>

namespace godot {
	class RichPresence: public Reference {
		
		GODOT_CLASS(RichPresence, Reference)

		public:
			void _init();
			~RichPresence();

			static void _register_methods();
			static void onReady(const DiscordUser* discordUser);
			static void onDisconnected(int code, const char* message);
			static void onError(int code, const char* message);
			static void onJoin(const char* secret);
			static void onJoinRequest(const DiscordUser* request);
			static void onSpectateGame(const char* secret);

			void init(Dictionary initialize);
			void clear(); 
			void update(Dictionary presence);
			void reply(String userId, int reply);
			void runCallbacks();
			void shutdown();
	};
}