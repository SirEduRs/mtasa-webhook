local WebhoookEmbed = "url do webhook"

function sendDiscordMessageRes(message)
	local Json = {
		embeds = {
			{
				color = 65280, -- Código de cor somente em decimal. (www.spycolor.com)
				description = message,
        fields = {
          {
            name = "nome da Field",
            value = "Texto que você quer por na field",
            inline = true -- Opcional. Para deixar as fields na mesma linha
          }
        }
			}
		}
	}
	local Json = toJSON(Json) -- Transformar a table em JSON
	Json = Json:sub(2, -2)
	local sendOptions = {
		connectionAttempts = 3, --Número de tentativas para conectar ao Webhook
		connectTimeout = 6000, -- Tempo de conexão das tentivas
		headers = {
			['Content-Type'] = 'application/json' -- Discord só aceita requests no formato JSON
		},
		postData = Json
	}
    fetchRemote ( discordWebhookRes, sendOptions, callback ) -- Conexão com o Webhook
  end
