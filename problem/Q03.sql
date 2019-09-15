-- 3.1 次のSELECT文の文法的誤りを修正
SELECT shohin_id, SUM(shohin_mei)
FROM Shohin
GROUP BY shohin_bunrui
WHERE torokubi > '2009-09-01';
/* 解 
- GROUP BY は末尾
- グループ分けに使用した商品分類以外である商品IDはSELECTできない
- SUMの引数として文字列である商品名は不適切
*/

-- 3.2 販売単価の合計が仕入単価の合計の1.5倍より大きい商品分類を求めるSELECT文
SELECT shohin_bunrui, SUM(hanbai_tanka), SUM(shiire_tanka)
FROM Shohin
GROUP BY shohin_bunrui
HAVING COUNT(*) = 2;

-- 3.3 例の実行結果と同様の表示内容となるSELECT文
SELECT *
FROM Shohin
ORDER BY torokubi DESC, hanbai_tanka;
