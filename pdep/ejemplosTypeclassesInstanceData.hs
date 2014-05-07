sum' :: Num a => [a] -> a
sum' [] = 0
sum' (x:xs) = x + sum xs

-- Typeclasses
-- Los typeclasses (clasificaciones de tipos) más importantes son:
--  * Show: cosas que se pueden convertir a string y por tanto se pueden mostrar en el intérprete. Define la funcion show
--  * Eq: Cosas que se pueden comparar por equivalencia. Define ==
--  * Ord: Cosas para las que existe una relación de orden. Define  >, <, >=, etc
--  * Enum: Cosas que se pueden enumerar (como los números y los caracteres). Permite utilizar la sintaxis de rangos [x..y] 
--  * Num: Cosas numéricas. Define la suma, resta, multiplicación
--  * Integral: Cosas que son numeros enteros, como Int e Integer. Define fromIntegral y los operadores de división entera div, rem y mod 
--  * Fractional: Cosas que son numeros divisibles. Define la división / 

-- probamos las siguientes consultas:
-- :t sum
-- :t (==)
-- :t (+)
-- True == False
-- 2 == 3
-- 3 == True Rompe!
-- even Rompe porque lo intenta mostrar (hace show even), pero conceptualmente no rompe. 
-- map (\f -> f 2) [even, odd]

---- =============================
---- A partir de aca todo es bonus
---- =============================


-- Instancias
-- En cualquier momento puedo declarar queun tipo propio o existente sea instancia de una cierta clase de tipos (es decir, agregar ese tipo al conjunto)
-- Ejemplo: podemos hacer que las funciones se puedan mostrar. 
--   Esto se lee: hacé que el tipo función sea instancia (pertenzca al conjunto) de la typeclass  Show
instance Show (a -> b)  where 
  show f = "funcion"



-- Data: tipos propios
-- A diferencia de type, que define un sinónimo de tipos, data define un tipo nuevo. Podemos pensar a data como una mejora respecto de las tuplas cuando queremos
-- modelar estructuras

--    Acá estamos definiendo el tipo Auto (que pertenece al mundo de los tipos)
--    | 
--    v 
data Auto = Auto Int Int deriving (Show, Eq)
--           ^               ^
--           |               | 
--          Acá estamos      +----- y acá le estamos diciendo que genere por nosotros el código de instance Show Auto where ... e instance Eq Auto where.... 
--          definiendo un 
--          constructor Auto (que pertenece al mundo de los valores)

data Ballena = Ballena Int Int deriving (Show, Eq)

moby :: Ballena
moby = Ballena 300 100

-- el auto de Fede
marta :: Auto
marta = Auto 100 200


-- Data se usa de forma similar a las tuplas (se puede construir, y descomponer usando pattern matching) pero tiene una sintaxis ligeramente diferente
cargar :: Auto -> Int -> Auto
cargar (Auto maximo nivel) cantidad = Auto maximo (nivel + cantidad)








