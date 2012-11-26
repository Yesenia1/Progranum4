# Tecnológico de Costa Rica
# Administración de Tecnologías de Información
# TI3404 Lenguajes de Programación
# Prof.: Andréi Fuentes Leiva

require 'rubygems'
require 'erb'
require 'sinatra'
require 'Flickr'
require 'cgi'
require 'open-uri'
require 'hpricot'
require 'twitter_oauth'

$descrip	#Variable que tiene el paramtro de busqueda
$numero		#Variable que tiene el numero de imagenes a mostrar

#Crea una nueva instancia
$Flickr = Flickr.new()

#metodo que llama al erb de Principal
get '/' do
	erb :Principal
end

#parametros que recibe el boton de la busqueda
post '/busqueda' do
	$descrip	= params[:campo1].to_s
	$numero		= params[:campo2].to_i
	$Flickr.ObtFotos($descrip, $numero)
	$Flickr.IngreInfo()
	$Flickr.ObtInfo()
	$Flickr.AsigImagen()
	redirect  '/resultado'
end

#parametros del boton siguiente
post '/siguiente' do
	$Flickr.AsigImagen()
	redirect  '/resultado'
end

#parametros del boton de tweetear
post '/tweet' do
	redirect  '/tweetear'
end
	
get '/tweetear' do
	erb:tweet
end

#metodo que llama al resultado donde muestra la imagen
get '/resultado' do
	erb :Resultado
end

	

	


