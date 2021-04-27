local discordWebhook = "urlwebhook" --Url do webhook

function sendDiscordMessage(message)
    sendOptions = {
        connectionAttempts = 3, -- Número máximo de tentativas, caso o url não responda
        connectTimeout = 5000, --Tempo em ms para as tentativas
        formFields = {
            content = message -- Conteudo que você quer enviar para o Webhook
        },
    }
    fetchRemote ( discordWebhook, sendOptions, function callback then end ) -- Conexão com o Webhook
end

---------Exemplo de Evento---------
addEventHandler( "onPlayerChat", root, 
	function(message, messageType)
		NamePlayer = getPlayerName( source ) -- Pegar o Nome do player.
		TeamName = getTeamName(getPlayerTeam( source )) -- Pegar o Team do Player
		if messageType == 0 then -- Se for chat Global
			sendDiscordMessage("**CHAT:** `"..NamePlayer.."`: "..message) 
		elseif messageType == 2 then -- Se for chat Team
			sendDiscordMessage("**CHAT "..TeamName.." :** `"..NamePlayer.."`: "..message)
		end
	end
)
