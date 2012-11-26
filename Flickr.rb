# Tecnológico de Costa Rica
# Administración de Tecnologías de Información
# TI3404 Lenguajes de Programación
# Prof.: Andréi Fuentes Leiva

#gems requeridas
require 'rubygems'
require 'json'
require 'flickraw'

#Definamos una clase flickr
class Flickr

	#Variables globales de la clase
	$Search 				
	$Titulo				
	$Contador = 1 		
	$Lista = []			
	$Fotografia = []	
	$ContadorII = 0		
	$Tamaño	
				
	#La aplicación está registrada con los siguientes datos
	def initialize()
		#La aplicación está registrada con los siguientes datos
		FlickRaw.api_key =  "b907fe707248d846c970de37fdf212e0"
		FlickRaw.shared_secret = "d6300bd479506d23"
	end
	
	#Funcion para obtener las fotos
	def ObtFotos(filtro, numero)
		$Search = flickr.photos.search(:tags => filtro, :per_page => numero, :page => 1
	end
	
	#Funcion para ingresar los datos en una variable
	def IngreInfo()
		for foto in $Search do
			info = flickr.photos.getInfo(:photo_id => foto.id)
			$Fotografia.push(info.title)
			$Fotografia.push(FlickRaw.url_q(info))
			$Lista.push($Fotografia)
			$Fotografia = []
		end
		$Tamaño = $Lista.length
	end
	
	#Funcion para obtener las informacion de las fotos
	def ObtInfo()
		for foto in $Lista do
			puts "Numero " + $Contador.to_s
			$Contador = $Contador + 1
			puts "Titulo : " + foto[0]
			puts "Url: " + foto[1]
		end
	end
	
	#Funcion para asignar la imagen
	def AsigImagen()
		if $ContadorII < $Tamaño
				$Titulo = $Lista[$ContadorII][0]
				$Foto = $Lista[$ContadorII][1]
				$ContadorII = $ContadorII + 1
				puts $Foto
		else puts "Final"
		end
	end
end


