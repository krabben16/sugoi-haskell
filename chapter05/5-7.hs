f1 = zipWith max [1,2] [4,5]
f2 = map (*3) $ zipWith max [1,2] [4,5]
-- product リストの積を返す
f3 = product . map (*3) $ zipWith max [1,2] [4,5]
-- replicate 単一の値からなるリストを返す
f4 = replicate 2 . product . map (*3) $ zipWith max [1,2] [4,5]
