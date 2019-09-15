-- 2.1 商品テーブルから登録日が2009/04/28以降である商品の表示
SELECT shohin_mei, torokubi
FROM Shohin
WHERE torokubi > '2009-04-28'; 

-- 2.2 SELECT文の確認
---- 全て 0row (NULLは'IS NULL' などでのみ判別可能)
SELECT *
FROM Shohin
WHERE shiire_tanka = NULL;

SELECT *
FROM Shohin
WHERE shiire_tanka <> NULL;

SELECT *
FROM Shohin
WHERE shiire_tanka > NULL;

-- 2.3 利益が500以上を表示するSELECT文と結果が同じになるモノを2つ
---- 元
SELECT shohin_mei, hanbai_tanka, shiire_tanka
FROM Shohin
WHERE hanbai_tanka - shiire_tanka >= 500;
---- 解1
SELECT shohin_mei, hanbai_tanka, shiire_tanka
FROM Shohin
WHERE shiire_tanka - hanbai_tanka <= -500;
---- 解2
SELECT shohin_mei, hanbai_tanka, shiire_tanka
FROM Shohin
WHERE NOT hanbai_tanka - shiire_tanka < 500;

-- 2.4 販売単価を10%引きにしても利益が100円より高い事務用品とキッチン用品 の表示
SELECT shohin_mei, shohin_bunrui, hanbai_tanka * 0.9 - shiire_tanka AS rieki
FROM Shohin
WHERE hanbai_tanka * 0.9 - shiire_tanka > 100
AND (shohin_bunrui = '事務用品' OR shohin_bunrui = 'キッチン用品');
