data Section = Section { getA :: Int, getB :: Int, getC :: Int } deriving (Show)
type RoadSystem = [Section]

heathrowToLondon :: RoadSystem
heathrowToLondon = [
  Section 50 10 30
  , Section 5 90 20
  , Section 40 2 25
  , Section 10 8 0
]

data Label = A | B | C deriving (Show)
type Path = [(Label, Int)]

roadStep :: (Path, Path) -> Section -> (Path, Path)
roadStep (pathA, pathB) (Section a b c) = 
  let timeA = sum (map snd pathA)
    timeB = sum (map snd pathB)
    forwardTimeToA = timeA + a
    crossTimeToA = timeB + b + c
    forwardTimeToB = timeB + b
    crossTimeToB = timeA + a + c
    newPathToA = if forwardTimeToA <= crossTimeToA
                  then (A, a):pathA
                  else (C, c):(B, b):pathB
    newPathToB = if forwardTimeToB <= crossTimeToB
                  then (B, b):pathB
                  else (C, c):(A, a):newPathToA
  in (newPathToA, newPathToB)

{-
roadStep ([], []) (head heathrowToLondon)
Sectio 50 10 30
forwardTimeToA = 50
crossTimeToA = 10 + 30 = 40
forwardTimeToB = 10
crossTimeToB = 50 + 30 = 80
newPathToA = (C, 30):(B, 10):pathA = [(C, 30), (B, 10)]
newPathToB = (B, 10):pathB = [(B, 10)]
-}

optimalPath :: RoadSystem -> Path
optimalPath roadSystem = 
  let (bestAPath, bestBPath) = foldl roadStep ([], []) roadSystem
  in if sum (map snd bestAPath) <= sum (map snd bestBPath)
      then reverse bestAPath
      else reverse bestBPath
 