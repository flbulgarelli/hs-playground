doble :: Int -> Int
doble x = x * 2

capicua :: String -> Bool
capicua unString = reverse unString == unString

predecesor :: Int -> Int	
predecesor x = x - 1

esPar :: Int -> Bool
esPar numero = rem numero 2 == 0


modulo x | x >= 0 = x
  	 | otherwise = -x

signoDe :: Int -> String
signoDe numero | numero > 0 = "Positivo"
	       | numero < 0 = "Negativo"
	       | otherwise = "Cero"
marta :: Autos
marta = ( "ABC123", 30, 5 )

type Auto = (String, Int, Int)

cargarTanque :: Int -> Auto -> Auto 		
cargarTanque nafta auto 		
	| capacidadSuficiente nafta auto = aumentarNivel nafta auto
	| otherwise = auto

capacidadSuficiente :: Int -> Auto -> Bool
capacidadSuficiente nafta ( _ , capacidad, nivel) = capacidad >= nafta + nivel

aumentarNivel :: Int -> Auto -> Auto
aumentarNivel nafta (patente, capacidad, nivel) = (patente, capacidad, nivel + nafta)


















