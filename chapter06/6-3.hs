phoneBook = [("betty", "555-2938"), ("bonnie", "452-2928")]

findKey :: (Eq k) => k -> [(k, v)] -> Maybe v
findKey key [] = Nothing
findKey key ((k, v):xs)
  | key == k = Just v
  | otherwise = findKey key xs
