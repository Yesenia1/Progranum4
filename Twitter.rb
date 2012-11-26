# Tecnológico de Costa Rica
# Administración de Tecnologías de Información
# TI3404 Lenguajes de Programación
# Prof.: Andréi Fuentes Leiva

#Librerias para acceso a urls y manejo de html
require 'rubygems'
require 'open-uri'
require 'hpricot'
require 'twitter_oauth'


#Clase twitter para el login y tweeteo
class twitter
	def initialize()
		@cliente = TwitterOAuth::Client.new(:consumer_key => 'wcNijO3bOVG1eXlDLLBvVw',:consumer_secret => 'noJzrhOeQbWJXyywOhnmq8YuigfWnD7C8NKateKtc')
		request_token = @cliente.request_token
		puts ("Favor autorizar la aplicacion. Para hacerlo presione click derecho sobre el siguiente link")
		puts ("Luego click izquierdo en abrir el enlace \n")
		puts request_token.authorize_url
		
	#Funcion que recibe los parametros anteriores y realiza la conexion	
	def conection()	
	puts ("\nPresione Enter para continuar luego de permitir el acceso")
	begin	
		access_token = @cliente.authorize(
  		request_token.token,
  		request_token.secret)
		rescue Exception => e
			abort("No se ha aceptado la conexion de la aplicacion, programa cerrando...")
		puts ("Conexion establecida satisfactoriamente")
	end
		
	rescue Exception => e
		abort( "TIMEOUT EXCEPTION: al parecer hay un problema con la conexion a internet, programa cerrando...")
end 

begin   
	@lista_grupos = Array.new
	@cliente=""
	puts ("|---------------------------------------------------------------------|")
	puts ("Lenguajes de Programacion")
	puts ("|---------------------------------------------------------------------|\n")
	puts ("Por favor espere mientras realizamos la conexion...")	
	login()
end

#Funcion dedicada a tweetear lo encomendado
	def twittear(lista_tweets)
		i = 0
		puts ("--------\nRealizando Tweets espere un momento...")
		while i < lista_tweets.length
			tweet = (lista_tweets[i].titulo + " - " +
			lista_tweets[i].link)
			@cliente.update(tweet[0,140])
			i += 1
			puts ("Tweet numero: %s realizado" % i)
		end
	end
end
