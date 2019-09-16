-- 6.1 商品テーブルに以下2つのSELECT文を実行した結果
SELECT shohin_mei, shiire_tanka
FROM Shohin
WHERE shiire_tanka NOT IN (500, 2800, 5000);
  ---- 2rows (穴空けパンチ, おろしがね)

SELECT shohin_mei, shiire_tanka
FROM Shohin
WHERE shiire_tanka NOT IN (500, 2800, 5000, NULL);
  ---- 0row

-- 6.2 商品テーブルを以下条件で分類
  -- 低額商品 : 販売価格1000以下
  -- 中額商品 : 販売価格1001円 ~ 3000円
  -- 高額商品 : 販売価格3001円以上
SELECT 
  COUNT(CASE WHEN hanbai_tanka <= 1000 THEN hanbai_tanka ELSE NULL END) AS low_price,
  COUNT(CASE WHEN hanbai_tanka BETWEEN 1001 AND 3000 THEN hanbai_tanka ELSE NULL END) AS mid_price,
  COUNT(CASE WHEN hanbai_tanka >= 3001 THEN hanbai_tanka ELSE NULL END) AS high_price
FROM Shohin;
